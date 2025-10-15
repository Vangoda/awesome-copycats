--[[

    Powerarrow Awesome WM theme
    github.com/lcpz
    Edited by Vangoda

--]] local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local helpers = require("lain.helpers")

local string, os = string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

-- Load the the Xresources theme
local xtheme = xresources.get_current_theme()

-- Setup theme
local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-vangoda"

-- Wallpaper
theme.wallpaper = theme.dir .. "/wall.png"

-- Fonts
theme.font = "Terminus Bold " .. dpi(16)
theme.font_clock = "LCD " .. dpi(14)
theme.font_calendar = "Digital-7 Mono " .. dpi(16)

-- Colors
-- Custom colors
-- Try to read from xrdb, fallback to defaults
theme.black = xtheme["color0"] or "#323633"
theme.black_light = xtheme["color8"] or "#9a9998"
theme.white = xtheme["color7"] or "#e0ece9"
theme.white_light = xtheme["color15"] or "#ebfffa"
theme.red = xtheme["color1"] or "#C83F11"
theme.red_light = xtheme["color9"] or "#CC9393"
theme.green = xtheme["color2"] or "#6ca400"
theme.green_light = xtheme["color10"] or "#e3f8bc"
theme.yellow = xtheme["color3"] or "#bfac02"
theme.yellow_light = xtheme["color11"] or "#fdf7bd"
theme.blue = xtheme["color4"] or "#326dce"
theme.blue_light = xtheme["color12"] or "#cbdcfc"
theme.magenta = xtheme["color5"] or "#ca38b3"
theme.magenta_light = xtheme["color13"] or "#fdccf3"
theme.cyan = xtheme["color6"] or "#00CCFF"
theme.cyan_light = xtheme["color14"] or "#32D6FF"
-- Theme Colors
theme.fg_normal = xtheme[".foreground"] or "#323633"
theme.fg_focus = theme.cyan
theme.fg_urgent = theme.red
theme.bg_normal = xtheme[".background"] or "#e0ece9"
theme.bg_focus = theme.bg_normal
theme.bg_urgent = theme.red_light

-- Taglist
theme.taglist_fg_focus = theme.bg_normal
theme.taglist_bg_focus = theme.cyan
-- Tasklist
theme.tasklist_bg_normal = theme.bg_normal
theme.tasklist_bg_focus = theme.bg_normal
theme.tasklist_fg_focus = theme.cyan

-- Window
-- Window Border
theme.border_width = dpi(2)
theme.border_normal = theme.white_light
theme.border_focus = theme.cyan_light
theme.border_marked = theme.red_light
-- Window titlebar
theme.titlebar_bg_focus = theme.bg_focus
theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_fg_focus = theme.fg_focus

-- Click menu
theme.menu_height = dpi(24)
theme.menu_width = dpi(196)
theme.menu_submenu_icon = theme.dir .. "/icons/submenu.png"
theme.awesome_icon = theme.dir .. "/icons/awesome.png"
theme.taglist_squares_sel = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile = theme.dir .. "/icons/tile.png"
theme.layout_tileleft = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv = theme.dir .. "/icons/fairv.png"
theme.layout_fairh = theme.dir .. "/icons/fairh.png"
theme.layout_spiral = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle = theme.dir .. "/icons/dwindle.png"
theme.layout_max = theme.dir .. "/icons/max.png"
theme.layout_fullscreen = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier = theme.dir .. "/icons/magnifier.png"
theme.layout_floating = theme.dir .. "/icons/floating.png"
theme.widget_ac = theme.dir .. "/icons/ac.png"
theme.widget_battery = theme.dir .. "/icons/battery.png"
theme.widget_battery_low = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty = theme.dir .. "/icons/battery_empty.png"
theme.widget_brightness = theme.dir .. "/icons/brightness.png"
theme.widget_mem = theme.dir .. "/icons/mem.png"
theme.widget_cpu = theme.dir .. "/icons/cpu.png"
theme.widget_temp = theme.dir .. "/icons/temp.png"
theme.widget_net = theme.dir .. "/icons/ethernet.png"
theme.widget_hdd = theme.dir .. "/icons/hdd.png"
theme.widget_music = theme.dir .. "/icons/music.png"
theme.widget_music_on = theme.dir .. "/icons/note_on.png"
theme.widget_music_pause = theme.dir .. "/icons/pause.png"
theme.widget_music_stop = theme.dir .. "/icons/stop.png"
theme.widget_vol = theme.dir .. "/icons/vol.png"
theme.widget_vol_low = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail = theme.dir .. "/icons/mail.png"
theme.widget_mail_on = theme.dir .. "/icons/mail_on.png"
theme.widget_task = theme.dir .. "/icons/task.png"
theme.widget_scissors = theme.dir .. "/icons/scissors.png"
theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon = true
theme.useless_gap = 0
theme.titlebar_close_button_focus = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

local markup = lain.util.markup
local separators = lain.util.separators

-- Clock widget setup
-- Possible formats https://docs.gtk.org/glib/method.DateTime.format.html
local format_clock = '<span font="' .. theme.font_clock
format_clock = format_clock .. '" foreground="' .. theme.green_light
-- format_clock = format_clock .. '" timezone="Europe/Zagreb"'
format_clock = format_clock .. '">%T %d.%m.%Y</span>'
local textclock = wibox.widget.textclock(format_clock, 1, "Europe/Zagreb")
-- Calendar
theme.cal = lain.widget.cal({
    -- cal = "cal --color=always",
    attach_to = {textclock},
    three = true,
    followtag = true,
    icons = theme.dir .. "/icons/cal_green/",
    notification_preset = {
        font = theme.font,
        fg = theme.green,
        bg = theme.green_light
    }
})

-- Taskwarrior
-- This is a task list app widget. It requires taskwarrior app.
-- It uses the task widget from lain to show notifications and run task 
-- commands from the promptbox
local task = wibox.widget.imagebox(theme.widget_task)
local task_notification_preset = {
    font = theme.font,
    icon = theme.dir .. "/icons/taskwarrior.png",
    bg = theme.cyan_light,
    fg = theme.cyan
}
-- Attach taskwarrior to lain widget applying config
lain.widget.contrib.task.attach(task, {
    -- do not colorize output
    -- show_cmd = "task | sed -r 's/\\x1B\\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g'"
    show_cmd = "task next",
    followtag = true,
    notification_preset = task_notification_preset
})
task:buttons(my_table.join(awful.button({}, 1, lain.widget.contrib.task.prompt)))

-- Mail IMAP check
-- commented because it needs to be set before use
local mailicon = wibox.widget.imagebox(theme.widget_mail)
mailicon:buttons(my_table.join(awful.button({}, 1, function()
    awful.spawn(mail)
end)))
theme.mail = lain.widget.imap({
    timeout = 180,
    server = "server",
    mail = "mail",
    password = "keyring get mail",
    settings = function()
        if mailcount > 0 then
            widget:set_text(" " .. mailcount .. " ")
            mailicon:set_image(theme.widget_mail_on)
        else
            widget:set_text("")
            mailicon:set_image(theme.widget_mail)
        end
    end
})
--

-- ALSA volume
theme.volume = lain.widget.alsabar({
    -- togglechannel = "IEC958,3",
    notification_preset = {
        font = "Terminus 10",
        fg = theme.fg_normal
    }
})

-- MPD
local musicplr = awful.util.terminal .. " -title Music -g 130x34-320+16 -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(theme.widget_music)
mpdicon:buttons(my_table.join(awful.button({modkey}, 1, function()
    awful.spawn.with_shell(musicplr)
end), awful.button({}, 1, function()
    os.execute("mpc prev")
    theme.mpd.update()
end), awful.button({}, 2, function()
    os.execute("mpc toggle")
    theme.mpd.update()
end), awful.button({}, 3, function()
    os.execute("mpc next")
    theme.mpd.update()
end)))
theme.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            local artist = " " .. mpd_now.artist .. " "
            local title = mpd_now.title .. " "
            mpdicon:set_image(theme.widget_music_on)
            widget:set_markup(markup.font(theme.font, markup("#FF8466", artist) .. " " .. title))
        elseif mpd_now.state == "pause" then
            widget:set_markup(markup.font(theme.font, " mpd paused "))
            mpdicon:set_image(theme.widget_music_pause)
        else
            widget:set_text("")
            mpdicon:set_image(theme.widget_music)
        end
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font_calendar, theme.magenta_light,
            mem_now.used .. "/32768 MB (" .. mem_now.perc .. "%)"))
    end
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font_calendar, theme.red_light, cpu_now.usage .. "%"))
    end
})

-- Coretemp (lm_sensors, per core)
local tempwidget = awful.widget.watch({awful.util.shell, '-c', 'sensors -n k10temp-pci-00c3 | grep Tccd1'}, 1,
    function(widget, stdout)
        local temps = ""
        for line in stdout:gmatch("[^\r\n]+") do
            temps = temps .. line:match("[-]?%d*[%.]?%d+°C") -- in Celsius
        end

        widget:set_markup(markup.fontfg(theme.font_calendar, theme.red_light, temps))
    end)
--
-- Coretemp (lain, average)
-- local temp = lain.widget.temp({
--     settings = function()
--         widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
--     end
-- })
-- ]]
local tempicon = wibox.widget.imagebox(theme.widget_temp)

-- Filesystem
-- / fs
local fsicon = wibox.widget.imagebox(theme.widget_hdd)

theme.fs = lain.widget.fs({
    timeout = 60,
    partition = '/',
    threshold = 95,
    followtag = true,
    notification_preset = {
        fg = theme.blue,
        bg = theme.blue_light,
        font = theme.font
    },
    settings = function()
        local used_verbose = string.format("%.f/%.f %s", fs_now["/"].used, fs_now["/"].size, fs_now["/"].units)
        local used_percentage = fs_now["/"].percentage .. "%"
        local fsp = "[/]:"
        fsp = string.format("%s%s (%s)", fsp, used_verbose, used_percentage)

        widget:set_markup(markup.fontfg(theme.font_calendar, theme.blue_light, fsp))
    end
})
--

-- Battery
-- local baticon = wibox.widget.imagebox(theme.widget_battery)
-- local bat = lain.widget.bat({
--     settings = function()
--         if bat_now.status and bat_now.status ~= "N/A" then
--             if bat_now.ac_status == 1 then
--                 widget:set_markup(markup.font(theme.font, " AC "))
--                 baticon:set_image(theme.widget_ac)
--                 return
--             elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
--                 baticon:set_image(theme.widget_battery_empty)
--             elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
--                 baticon:set_image(theme.widget_battery_low)
--             else
--                 baticon:set_image(theme.widget_battery)
--             end
--             widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
--         else
--             widget:set_markup()
--             baticon:set_image(theme.widget_ac)
--         end
--     end
-- })

-- Net
local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
    timeout = 1,
    units = 1048576,
    format = "%04.1f",
    settings = function()
        widget:set_markup(markup.fontfg(theme.font_calendar, theme.yellow_light,
            " " .. net_now.received .. "↓" .. net_now.sent .. "↑MB/s"))
    end
})

-- Brigtness
local brighticon = wibox.widget.imagebox(theme.widget_brightness)
-- If you use xbacklight, comment the line with "light -G" and uncomment the line bellow
-- local brightwidget = awful.widget.watch('xbacklight -get', 0.1,
local brightwidget = awful.widget.watch('light -G', 0.1, function(widget, stdout, stderr, exitreason, exitcode)
    local brightness_level = tonumber(string.format("%.0f", stdout))
    widget:set_markup(markup.font(theme.font, " " .. brightness_level .. "%"))
end)

-- Separators
local arrow = separators.arrow_left

function theme.powerline_rl(cr, width, height)
    local arrow_depth, offset = height / 2, 0

    -- Avoid going out of the (potential) clip area
    if arrow_depth < 0 then
        width = width + 2 * arrow_depth
        offset = -arrow_depth
    end

    cr:move_to(offset + arrow_depth, 0)
    cr:line_to(offset + width, 0)
    cr:line_to(offset + width - arrow_depth, height / 2)
    cr:line_to(offset + width, height)
    cr:line_to(offset + arrow_depth, height)
    cr:line_to(offset, height / 2)

    cr:close_path()
end

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({
        app = awful.util.terminal
    })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(awful.button({}, 1, function()
        awful.layout.inc(1)
    end), awful.button({}, 2, function()
        awful.layout.set(awful.layout.layouts[1])
    end), awful.button({}, 3, function()
        awful.layout.inc(-1)
    end), awful.button({}, 4, function()
        awful.layout.inc(1)
    end), awful.button({}, 5, function()
        awful.layout.inc(-1)
    end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        height = dpi(24),
        bg = theme.bg_normal,
        fg = theme.fg_normal
    })

    -- Add widgets to the wibox
    s.mywibox:setup{
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            -- spr,
            s.mytaglist,
            s.mypromptbox,
            spr
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            -- using separators
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),

            -- E-Mail
            arrow(theme.bg_normal, theme.fg_focus),
            wibox.container.background(wibox.container.margin(wibox.widget {
                mailicon,
                theme.mail and theme.mail.widget,
                layout = wibox.layout.align.horizontal
            }, dpi(3), dpi(3)), "#343434"),

            -- Memory
            arrow(theme.cyan, theme.magenta),
            wibox.container.background(wibox.container.margin(wibox.widget {
                memicon,
                mem.widget,
                layout = wibox.layout.align.horizontal
            }, dpi(3), dpi(3)), theme.magenta),

            -- CPU Usage & Temperature
            arrow(theme.magenta, theme.red),
            wibox.container.background(wibox.container.margin(wibox.widget {
                cpuicon,
                cpu.widget,
                layout = wibox.layout.align.horizontal
            }, dpi(3), dpi(3)), theme.red),
            wibox.container.background(wibox.container.margin(wibox.widget {
                tempicon,
                tempwidget,
                layout = wibox.layout.align.horizontal
            }, dpi(3), dpi(3)), theme.red),

            -- Filesystem
            arrow(theme.red, theme.blue),
            wibox.container.background(wibox.container.margin(wibox.widget {
                fsicon,
                theme.fs and theme.fs.widget,
                layout = wibox.layout.align.horizontal
            }, dpi(3), dpi(3)), theme.blue),

            -- Power
            -- arrow("#CB755B", "#8DAA9A"),
            -- wibox.container.background(wibox.container.margin(wibox.widget {
            --     baticon,
            --     bat.widget,
            --     layout = wibox.layout.align.horizontal
            -- }, dpi(3), dpi(3)), "#8DAA9A"),

            -- Network stats
            arrow(theme.blue, theme.yellow),
            wibox.container.background(wibox.container.margin(wibox.widget {
                nil,
                neticon,
                net.widget,
                layout = wibox.layout.align.horizontal
            }, dpi(3), dpi(3)), theme.yellow),

            -- Time and date
            arrow(theme.yellow, theme.green),
            wibox.container.background(wibox.container.margin(wibox.widget {
                nil,
                nil,
                textclock,
                layout = wibox.layout.align.horizontal
            }, dpi(3), dpi(3)), theme.green),
            arrow(theme.green, theme.cyan),

            -- Taskwarrior
            wibox.container.background(wibox.container.margin(task, dpi(3), dpi(7)), theme.cyan),
            arrow(theme.cyan, theme.blue),

            -- Music
            wibox.container.background(wibox.container.margin(wibox.widget {
                mpdicon,
                theme.mpd.widget,
                layout = wibox.layout.align.horizontal
            }, dpi(3), dpi(3)), theme.blue),
            arrow(theme.blue, "alpha"),
            -- ]]
            s.mylayoutbox
        }
    }
end

return theme
