local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- X11
config.enable_wayland = false
config.front_end = "WebGpu"

-- Performance
config.webgpu_power_preference = "HighPerformance"
config.max_fps = 165


-- Fonts
config.font = wezterm.font_with_fallback({
  { family = 'Iosevka Nerd Font',  scale = 1.1 },
})


-- Color Scheme
config.color_scheme = 'rose-pine'

-- Decorations
config.window_background_opacity = 0.8
config.window_decorations = "TITLE | RESIZE"
config.window_close_confirmation = 'NeverPrompt'
config.scrollback_lines = 2000
config.default_workspace = "main"
config.show_tab_index_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false

config.window_padding = {
  left = 16,
  right = 16,
  top = 8,
  bottom = 8,
}

-- Actions
config.leader = { key = "f", mods = "CTRL" }
config.keys = {
  -- Send C-f when pressing C-f twice
  { key = "f",          mods = "LEADER|CTRL", action = act.SendKey { key = "a", mods = "CTRL" } },
  { key = "c",          mods = "LEADER",      action = act.ActivateCopyMode },

  -- Panes
  { key = "s",          mods = "LEADER",      action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "%",          mods = "LEADER|SHIFT",      action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },

  -- Move around panes
  { key = "h",          mods = "LEADER",      action = act.ActivatePaneDirection("Left") },
  { key = "j",          mods = "LEADER",      action = act.ActivatePaneDirection("Down") },
  { key = "k",          mods = "LEADER",      action = act.ActivatePaneDirection("Up") },
  { key = "l",          mods = "LEADER",      action = act.ActivatePaneDirection("Right") },

  { key = "w",          mods = "LEADER",      action = act.CloseCurrentPane { confirm = true } },
  { key = "z",          mods = "LEADER",      action = act.TogglePaneZoomState },
  { key = "o",          mods = "LEADER",      action = act.RotatePanes "Clockwise" },

  -- Tab keybindings
  { key = "t",          mods = "LEADER",      action = act.SpawnTab("CurrentPaneDomain") },
  { key = "[",          mods = "LEADER",      action = act.ActivateTabRelative(-1) },
  { key = "]",          mods = "LEADER",      action = act.ActivateTabRelative(1) },
  { key = "n",          mods = "LEADER",      action = act.ShowTabNavigator },
  {
    key = "e",
    mods = "LEADER",
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = "Fuchsia" } },
        { Text = "Renaming Tab Title...:" },
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end)
    }
  },
  -- Key table for moving tabs around
  { key = "m", mods = "LEADER",       action = act.ActivateKeyTable { name = "move_tab", one_shot = false } },
  -- Or shortcuts to move tab w/o move_tab table. SHIFT is for when caps lock is on
  { key = "{", mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
  { key = "}", mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },

}

return config

