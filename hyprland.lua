-- https://wiki.hypr.land/Configuring/Start/

hl.monitor({
	output = "eDP-1",
	mode = "1920x1080",
	position = "0x0",
	scale = "1"
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "preferred",
	position = "auto-left",
	scale = "1"
})

hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")

hl.on("hyprland.start", function()
  hl.exec_cmd("/nix/store/165rncxlyi4f9pjf1zk3hmj3mh2v881w-dbus-1.16.2/bin/dbus-update-activation-environment --systemd DISPLAY HYPRLAND_INSTANCE_SIGNATURE WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE && systemctl --user stop hyprland-session.target && systemctl --user start hyprland-session.target")
  hl.exec_cmd("waybar")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("rfkill unblock bluetooth")
  hl.exec_cmd("hyprctl dispatch workspace 1")
end)

local shown_col = {
	active_border = "0xffb8b8b8",
	inactive_border = "0xff777777",
}
local hidden_col = {
	active_border = "0xff333333",
	inactive_border = "0xff222222",
}

hl.config({
	general = {
		gaps_in  = 0,
		gaps_out = 0,
		border_size = 2,

		col = shown_col,

		layout = "dwindle",
		resize_on_border = false,
		allow_tearing = false,
	},

	decoration = {
		rounding = 0,
		active_opacity = 1,
		inactive_opacity = 1,

		shadow = { enabled = false, },
		blur = { enabled = false, },
	},

	animations = { enabled = false, },
})

hl.config({
	binds = {
		disable_keybind_grabbing = true
	}
})

hl.config({
	dwindle = {
		preserve_split = true,
	},
})

hl.config({
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		force_default_wallpaper = 0,
		on_focus_under_fullscreen = 2,
		font_family = "JetBrainsNerd-Mono",
		render_unfocused_fps = 10,
		screencopy_force_8b = false,
	},
})

hl.config {
	render = {
		direct_scanout = 1,
	},
	ecosystem = {
		no_donation_nag = true,
		no_update_news = true,
	},
}

hl.config({
	input = {
		kb_layout = "us,bg",
		kb_options = "grp:alt_space_toggle",
		follow_mouse = 1,
		accel_profile = "flat",
		numlock_by_default = false,
		repeat_delay = 300,
		repeat_rate = 90,
		scroll_method = "2fg",
		sensitivity = 1,
		touchpad = {
			disable_while_typing = true,
			natural_scroll = true,
			drag_lock = true,
			scroll_factor = 2.5,
		},
		tablet = {
			output = "current",
		},
	},
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = 1,
})

hl.window_rule({
	match = { class = ".*" },

	suppress_event = "maximize",
})
hl.window_rule({
	float = true,
	match = { title = "SpeedCrunch" }
})
hl.window_rule({
	name  = "fix-xwayland-drags",
	match = {
		class	  = "^$",
		title	  = "^$",
		xwayland   = true,
		float	  = true,
		fullscreen = false,
		pin		= false,
	},
	no_focus = true,
})

hl.bind("SUPER + O", hl.dsp.exec_raw("pkill waybar"))
hl.bind("SUPER + P", hl.dsp.exec_raw("waybar"))
hl.bind("SUPER + SHIFT + O", function()
	hl.config({general = {col = hidden_col}})
end)
hl.bind("SUPER + SHIFT + P", function()
	hl.config({general = {col = shown_col}})
end)
hl.bind("SUPER + T", hl.dsp.exec_raw("kitty"))
hl.bind("SUPER + E", hl.dsp.exec_raw("nautilus"))
hl.bind("SUPER + A", hl.dsp.exec_raw("gimp"))
hl.bind("SUPER + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + G", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + CTRL + SHIFT + Q", hl.dsp.window.kill())
hl.bind("SUPER + SHIFT + F", hl.dsp.window.pseudo())
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_raw("wofi-emoji"))
hl.bind("SUPER + S", hl.dsp.exec_raw("tofi-drun"))
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left"  }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down"  }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up"    }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + Z", hl.dsp.exec_raw("woomer"))
hl.bind("SUPER + V", hl.dsp.exec_raw("librewolf"))
hl.bind("SUPER + C", hl.dsp.exec_raw("speedcrunch"))
hl.bind("SUPER + CTRL + SHIFT + 0", hl.dsp.dpms({ action = "off", window = "eDP-1" }))
hl.bind("SUPER + SHIFT + 0",        hl.dsp.dpms({ action = "off" }))
hl.bind("SUPER + 0",                hl.dsp.dpms({ action = "on" }))
hl.bind("PRINT",           hl.dsp.exec_raw("hyprshot -zo ~/Pictures/Screenshots -sm output"))
hl.bind("SHIFT + PRINT",   hl.dsp.exec_raw("hyprshot -zo ~/Pictures/Screenshots -sm window"))
hl.bind("CONTROL + PRINT", hl.dsp.exec_raw("hyprshot -zo ~/Pictures/Screenshots -sm region"))
hl.bind("SUPER + SHIFT + Z", hl.dsp.window.pin({ action = "toggle" }))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + M", hl.dsp.exec_raw([[
echo 0 >> vol
touch muted
if [ 1 = $(cat muted) ]
then
	vol=$(cat vol)
	wpctl set-volume @DEFAULT_SINK@ $vol
	echo > muted
else 
	vol="$(wpctl get-volume @DEFAULT_SINK@)"
	vol=${vol:8}
	echo $vol > vol
	wpctl set-volume @DEFAULT_SINK@ 0
	echo 1 > muted
fi
]]))

for i = 1, 8 do
	hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i}))
	hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = false }))
end
hl.bind("SUPER + SPACE",         hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + SPACE", hl.dsp.window.move({ workspace = "special:magic", follow = false }))

hl.bind("SUPER + SHIFT + C", hl.dsp.window.center())
hl.bind("SUPER + SHIFT + H", hl.dsp.window.swap({ direction = "left"  }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.swap({ direction = "down"  }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.swap({ direction = "up"  }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.swap({ direction = "right" }))

hl.bind("SUPER + X", hl.dsp.submap("playerctl"))
hl.define_submap("playerctl", function()
	hl.bind("ESCAPE", hl.dsp.submap("reset"))
	hl.bind("SUPER + X", hl.dsp.submap("reset"))

	hl.bind("SPACE", hl.dsp.exec_raw("playerctl play-pause"))
	hl.bind("RIGHT", hl.dsp.exec_raw("playerctl position 5+"))
	hl.bind("LEFT", hl.dsp.exec_raw("playerctl position 5-"))
	hl.bind("J", hl.dsp.exec_raw("playerctl next"))
	hl.bind("K", hl.dsp.exec_raw("playerctl previous"))
	hl.bind("MINUS", hl.dsp.exec_raw("playerctl volume .05-"))
	hl.bind("EQUAL", hl.dsp.exec_raw("playerctl volume .05+"))
end)

