-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

-- Window
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- config.window_decorations = "NONE"
-- config.window_decorations = "RESIZE"
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Font
config.font = wezterm.font('JetBrainsMono NerdFont Mono')
config.font_size = 14.8

-- Tabs
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

-- and finally, return the configuration to wezterm
return config
