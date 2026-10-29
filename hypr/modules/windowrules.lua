hl.window_rule({
  name      = "move-kitty",
  match     = { class = "kitty" },
  move      = {100, 100},
  animation = "popin",
})

-- Disable blur for firefox
hl.window_rule({ match = { class = "firefox" }, no_blur = true })
hl.window_rule({ match = { class = "/home/vyke/.tarball-installations/zen/zen" }, no_blur = true })

-- Move kitty to the center of the cursor
hl.window_rule({
  match = { class = "kitty" },
  move  = {"cursor_x-(window_w*0.5)", "cursor_y-(window_h*0.5)"},
})

-- Set border color to red if window is fullscreen
hl.window_rule({
  match        = { fullscreen = true },
  border_color = "rgb(7957ad) rgb(7957ad)",
})

-- Set border color to yellow when title contains Hyprland
hl.window_rule({
  match        = { title = ".*Hyprland.*" },
  border_color = "rgb(5092b5)",
})

-- Set opacity to 1.0 active, 0.5 inactive and 0.8 fullscreen for kitty
hl.window_rule({
  match   = { class = "kitty" },
  opacity = "0.90 override 0.6 override 0.8 override",
})

-- Set rounding to 10 for kitty
hl.window_rule({ match = { class = "kitty" }, rounding = 10 })

-- Fix pinentry losing focus
hl.window_rule({
  match       = { class = "(pinentry-)(.*)" },
  stay_focused = true,
})

hl.window_rule({
    name = "portal-file-chooser",
    match = { class = "^(Xdg-desktop-portal-gtk)$" },
    float = true,
    center = true,
    size = "1200 800",
})

-- cursor brightness sync with the system brightness
hl.config({
    cursor = {
        no_hardware_cursors = true,
    },
})
--zen browser picture in picture
hl.window_rule({
    name = "zen-pip",
    match = { title = "^(Picture-in-Picture)$" },
    float = true,
    pin = true,
    size = {"monitor_w * 0.25", "monitor_h * 0.25"},
    move = {"monitor_w - window_w - 20", "monitor_h - window_h - 20"},
})

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

hl.env("GTK_USE_PORTAL", "2")
hl.env("GDK_SCALE", "2")
hl.env("QT_SCALE_FACTOR", "2")
