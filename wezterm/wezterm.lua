local wezterm = require("wezterm")

-- Use local to define the config variable
local config = wezterm.config_builder()

-- Existing configuration
config.default_cwd = "/Users/danishjoseph/Developer/"
config.initial_rows = 25
config.initial_cols = 100
config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBar"
-- config.color_scheme = "Nord (Gogh)"
config.color_scheme = "Catppuccin Macchiato"
config.font = wezterm.font("Google Sans Code", { weight = "Regular" })
config.font_size = 14
config.window_background_opacity = 0.8 -- Adjust the transparency (0.0 to 1.0)

return config
