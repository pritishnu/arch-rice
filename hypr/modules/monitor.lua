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

local state_file = os.getenv("HOME") .. "/.config/hypr/sdr_brightness"

local function load_sdr()
    local f = io.open(state_file, "r")
    if not f then return 1.0 end
    local v = tonumber(f:read("*l"))
    f:close()
    if not v then return 1.0 end
    return math.max(0.2, math.min(2.0, v))
end

local function save_sdr(v)
    local f = io.open(state_file, "w")
    if f then
        f:write(string.format("%.2f\n", v))
        f:close()
    end
end

local function monitor_cfg(v)
    return {
        output = "eDP-1",
        mode = "2880x1800@120",
        position = "0x0",
        scale = 1.67,
        bitdepth = 10,
        cm = "hdr",
        sdrbrightness = v,
        sdr_max_luminance = 250,
    }
end

local sdr = load_sdr()

-- apply the saved value at startup / config reload
hl.monitor(monitor_cfg(sdr))

local function set_sdr(step)
    sdr = math.max(0.2, math.min(2.0, sdr + step))
    save_sdr(sdr)
    hl.exec_cmd(string.format(
        [[hyprctl eval 'hl.monitor({ output = "eDP-1", mode = "2880x1800@120", position = "0x0", scale = 1.67, bitdepth = 10, cm = "hdr", sdrbrightness = %.2f, sdr_max_luminance = 250 })']],
        sdr
    ))
end

hl.bind("XF86MonBrightnessUp",   function() set_sdr(0.1)  end, { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", function() set_sdr(-0.1) end, { locked = true, repeating = true })

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

--local sdr = 1.0

--local function set_sdr(step)
--    sdr = math.max(0.2, math.min(2.0, sdr + step))
--    hl.exec_cmd(string.format(
--        [[hyprctl eval 'hl.monitor({ output = "eDP-1", mode = "2880x1800@120", position = "0x0", scale = 1.67, bitdepth = 10, cm = "hdr", sdrbrightness = %.2f, sdr_max_luminance = 250 })']],
--        sdr
--    ))
--end

--hl.bind("XF86MonBrightnessUp",   function() set_sdr(0.1)  end, { locked = true, repeating = true })
--hl.bind("XF86MonBrightnessDown", function() set_sdr(-0.1) end, { locked = true, repeating = true })