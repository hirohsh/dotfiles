local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local function tab_title(tab)
  local title = tab.active_pane.title
  title = title:gsub("^%S+:", "") 
  return title
end

wezterm.on(
  "format-tab-title", 
  function(tab, tabs, panes, config, hover, max_width)
    local is_active = tab.is_active
    local background = is_active and "#ae8b2d" or "#1e1e2e"
    local foreground = is_active and "#ffffffff" or "#6c7086"

    return {
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = " 󰓩 " .. tab_title(tab) .. "  " },
    }
  end
)

wezterm.on("update-right-status", function(window, pane)
  local name = window:active_key_table()
  if name then
    name = "TABLE: " .. name
  end
  window:set_right_status(name or "")
end)

config.initial_cols = 120
config.initial_rows = 30
config.scrollback_lines = 10000

config.default_prog = {"/bin/zsh", "-l"}
config.exit_behavior = 'Close'
config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"


config.color_scheme = "Dracula"
config.window_background_gradient = {
  orientation = 'Vertical',
  colors = { "#282a36", "#1e1f29" },
}


config.font = wezterm.font_with_fallback({
  "JetBrainsMono Nerd Font",
  "Noto Sans CJK JP",
})
config.font_size = 16
config.adjust_window_size_when_changing_font_size = false

config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.text_background_opacity = 1.0
config.window_decorations = "RESIZE"
config.window_padding = {
 left = 6,
 right = 6,
 top = 10,
 bottom = 10,
}


config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.enable_scroll_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
config.colors = {
   tab_bar = {
     inactive_tab_edge = "none",
     background = "none",
   },
}

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true
config.use_dead_keys = false
config.use_ime = true

config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.disable_default_key_bindings = true
-- config.leader = {key="q", mods="CTRL", timeout_milliseconds=1000}

return config
