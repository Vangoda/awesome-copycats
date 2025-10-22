-- Source: https://bitbucket.org/seregaxvm/awesome-wm-configs/src/master/get_secret.lua
local Gio = require("lgi").Gio
local GLib = require("lgi").GLib

local function get_secret(attrs)
    local bus = Gio.bus_get_sync(Gio.BusType.SESSION, nil)
    local name = "org.freedesktop.secrets"
    local object = "/org/freedesktop/secrets"
    local interface = "org.freedesktop.Secret.Service"
    local secret = ""
    local try_again = false

    -- search for secret path
    local method = "SearchItems"
    local message = Gio.DBusMessage.new_method_call(name, object, interface, method)
    message:set_body(GLib.Variant("(a{ss})", {attrs}))

    local result, err = bus:send_message_with_reply_sync(message, Gio.DBusSendMessageFlags.NONE, -1, nil)
    local location = ""
    for _, l in result:get_body():pairs() do
        if #l > 0 then
            location = tostring(l[1])
        end
    end

    if location:len() == 0 then
        return nil, false
    end

    -- open session
    local method = "OpenSession"
    local message = Gio.DBusMessage.new_method_call(name, object, interface, method)
    message:set_body(GLib.Variant("(sv)", {"plain", GLib.Variant("s", "")}))

    local result, err = bus:send_message_with_reply_sync(message, Gio.DBusSendMessageFlags.NONE, -1, nil)
    local session = result:get_body()[2]

    if #session == 0 then
        return nil, false
    end

    -- unlock key
    local method = "Unlock"
    local message = Gio.DBusMessage.new_method_call(name, object, interface, method)
    message:set_body(GLib.Variant("(ao)", {{location}}))
    local result, err = bus:send_message_with_reply_sync(message, Gio.DBusSendMessageFlags.NONE, -1, nil)
    local unlocked = result:get_body():get_child_value(0).data
    local prompt = result:get_body():get_child_value(1).data

    if #unlocked == 0 then
        -- prompt
        local interface = "org.freedesktop.Secret.Prompt"
        local method = "Prompt"
        local message = Gio.DBusMessage.new_method_call(name, prompt, interface, method)
        message:set_body(GLib.Variant("(s)", {"1"}))
        local result, err = bus:send_message_with_reply_sync(message, Gio.DBusSendMessageFlags.NONE, -1, nil)
        try_again = true
    else
        -- get secret
        local interface = "org.freedesktop.Secret.Service"
        local method = "GetSecrets"
        local message = Gio.DBusMessage.new_method_call(name, object, interface, method)
        message:set_body(GLib.Variant("(aoo)", {{location}, session}))
        local result, err = bus:send_message_with_reply_sync(message, Gio.DBusSendMessageFlags.NONE, -1, nil)
        local rv = result:get_body()
        if rv ~= nil then
            secret = tostring(rv:get_child_value(0):get_child_value(0):get_child_value(1):get_child_value(2).data)

            -- lock key
            local method = "Lock"
            local message = Gio.DBusMessage.new_method_call(name, object, interface, method)
            message:set_body(GLib.Variant("(ao)", {{location}}))
            local result, err = bus:send_message_with_reply_sync(message, Gio.DBusSendMessageFlags.NONE, -1, nil)
        end
    end

    -- close session
    local interface = "org.freedesktop.Secret.Session"
    local method = "Close"
    local message = Gio.DBusMessage.new_method_call(name, location, interface, method)
    local result, err = bus:send_message_with_reply_sync(message, Gio.DBusSendMessageFlags.NONE, -1, nil)

    -- Speed up deletion of the GDBusMessage
    collectgarbage("collect")

    return secret, try_again
end

return get_secret
