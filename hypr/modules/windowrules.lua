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
  opacity = "0.92 override 0.6 override 0.8 override",
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
    size = "800 600",
})

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

hl.env("GTK_USE_PORTAL", "1")