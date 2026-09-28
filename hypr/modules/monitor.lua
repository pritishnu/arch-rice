------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/



-- ~/.config/hypr/monitors.lua
-- Laptop display: Samsung ATNA60HR01-0 (2880x1800, 60Hz / 120Hz)

-- Built-in laptop screen
-- 2880x1800 at scale 1.5 = 1920x1200 logical pixels (divides cleanly)
hl.monitor({
    output   = "eDP-1",
    mode     = "2880x1800@120",   -- change to @60 to save battery
    position = "0x0",
    scale    = 1.67,
    bitdepth = 10,
    cm       = "hdr",
})

--hl.monitor({
--    output   = "eDP-1",
--    mode     = "2880x1800@120",   -- change to @60 to save battery
--    position = "0x0",
--    scale    = 1.6,
--    bitdepth = 8,
--    cm       = "srgb",
--})
 
-- Fallback for any external monitor you plug in later
--hl.monitor({
--    output   = "",
--    mode     = "preferred",
--    position = "auto-right",
--    scale    = 1,
--})

-- Fallback for any external monitor you plug in later:
-- placed to the right of the laptop screen, at its preferred mode
--hl.monitor({
--    output   = "",
--    mode     = "preferred",
--    position = "auto-right",
--    scale    = 1,

local sdr = 1.0

local function set_sdr(step)
    sdr = math.max(0.2, math.min(2.0, sdr + step))
    hl.exec_cmd(string.format(
        [[hyprctl eval 'hl.monitor({ output = "eDP-1", mode = "2880x1800@120", position = "0x0", scale = 1.67, bitdepth = 10, cm = "hdr", sdrbrightness = %.2f, sdr_max_luminance = 250 })']],
        sdr
    ))
end

hl.bind("XF86MonBrightnessUp",   function() set_sdr(0.1)  end, { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", function() set_sdr(-0.1) end, { locked = true, repeating = true })