local wezterm = require 'wezterm'
local act = wezterm.action

return {
  keys = {
    { key = 'Space', mods = 'CTRL', action  = wezterm.action.ActivateKeyTable({ name = "leader", one_shot = true }) },
    { key = ']', mods = 'SUPER', action = act.ActivateTabRelative(1) },
    { key = '[', mods = 'SUPER', action = act.ActivateTabRelative(-1) },
    { key = 'Enter', mods = 'SUPER', action = act.ToggleFullScreen },
    { key = '=', mods = 'SUPER', action = act.IncreaseFontSize },
    { key = '-', mods = 'SUPER', action = act.DecreaseFontSize },
    { key = 'c', mods = 'SUPER', action = act.CopyTo 'Clipboard' },
    { key = 'v', mods = 'SUPER', action = act.PasteFrom 'Clipboard' },
    { key = 'h', mods = 'SUPER', action = act.ActivatePaneDirection 'Left' },
    { key = 'j', mods = 'SUPER', action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'SUPER', action = act.ActivatePaneDirection 'Up' },
    { key = 'l', mods = 'SUPER', action = act.ActivatePaneDirection 'Right' },
    { key = 'n', mods = 'SUPER', action = act.SpawnWindow },
    { key = 'p', mods = 'SUPER', action = act.ActivateCommandPalette },
    { key = 'q', mods = 'SUPER', action = act.QuitApplication },
    { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
    { key = 'u', mods = 'SUPER', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
    { key = 'f', mods = 'SUPER', action = act.Search 'CurrentSelectionOrEmptyString' },
    { key = 't', mods = 'SUPER', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'r', mods = 'SUPER', action = act.CloseCurrentTab{ confirm = true } },
    { key = 'z', mods = 'SUPER|SHIFT', action = act.TogglePaneZoomState },
    { key = 'c', mods = 'SUPER|SHIFT', action = act.ActivateCopyMode },
    { key = '/', mods = 'SUPER', action = act.QuickSelect },
    { key = 'LeftArrow', mods = 'SUPER', action = act.AdjustPaneSize{ 'Left', 1 } },
    { key = 'RightArrow', mods = 'SUPER', action = act.AdjustPaneSize{ 'Right', 1 } },
    { key = 'UpArrow', mods = 'SUPER', action = act.AdjustPaneSize{ 'Up', 1 } },
    { key = 'DownArrow', mods = 'SUPER', action = act.AdjustPaneSize{ 'Down', 1 } },
    { key = '1', mods = 'SUPER', action = act.ActivateTab(0) },
    { key = '2', mods = 'SUPER', action = act.ActivateTab(1) },
    { key = '3', mods = 'SUPER', action = act.ActivateTab(2) },
    { key = '4', mods = 'SUPER', action = act.ActivateTab(3) },
    { key = '5', mods = 'SUPER', action = act.ActivateTab(4) },
    { key = '6', mods = 'SUPER', action = act.ActivateTab(5) },
    { key = '7', mods = 'SUPER', action = act.ActivateTab(6) },
    { key = '8', mods = 'SUPER', action = act.ActivateTab(7) },
    { key = '9', mods = 'SUPER', action = act.ActivateTab(8) },
  },
  
  key_tables = {
    leader = {
      { key = 'w', mods = 'NONE', action = act.ShowLauncherArgs({ flags = "WORKSPACES", title = "Select Workspace" }) },
      { key = 'h', mods = 'NONE', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
      { key = 'v', mods = 'NONE', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
      { key = '$', mods = 'NONE', action = act.PromptInputLine(
        {
          description = "(wezterm) Set workspace title:",
          action = wezterm.action_callback(
            function(win, pane, line)
              if line then
                wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
              end
            end
          ),
        }), 
      },
      {
        key = "W", mods = "SHIFT", action = act.PromptInputLine(
          {
            description = "(wezterm) Create new workspace:",
            action = wezterm.action_callback(
              function(window, pane, line)
                if line then
                  window:perform_action(act.SwitchToWorkspace({ name = line }), pane)
                end
              end
            ),
          }
        ),
      },
    },
    copy_mode = {
      { key = 'Tab', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
      { key = 'Enter', mods = 'NONE', action = act.CopyMode 'MoveToStartOfNextLine' },
      { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 'Space', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
      { key = '$', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
      { key = ',', mods = 'NONE', action = act.CopyMode 'JumpReverse' },
      { key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
      { key = ';', mods = 'NONE', action = act.CopyMode 'JumpAgain' },
      { key = 'F', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
      { key = 'G', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackBottom' },
      { key = 'H', mods = 'NONE', action = act.CopyMode 'MoveToViewportTop' },
      { key = 'L', mods = 'NONE', action = act.CopyMode 'MoveToViewportBottom' },
      { key = 'M', mods = 'NONE', action = act.CopyMode 'MoveToViewportMiddle' },
      { key = 'O', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
      { key = 'T', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
      { key = 'V', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Line' } },
      { key = '^', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLineContent' },
      { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'b', mods = 'CTRL', action = act.CopyMode 'PageUp' },
      { key = 'd', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (0.5) } },
      { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWordEnd' },
      { key = 'f', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = false } } },
      { key = 'f', mods = 'CTRL', action = act.CopyMode 'PageDown' },
      { key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
      { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
      { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
      { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
      { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
      { key = 'o', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEnd' },
      { key = 'q', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 't', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = true } } },
      { key = 'u', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (-0.5) } },
      { key = 'v', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
      { key = 'v', mods = 'CTRL', action = act.CopyMode{ SetSelectionMode =  'Block' } },
      { key = 'y', mods = 'NONE', action = act.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { CopyMode =  'Close' } } },
    },

    search_mode = {
      { key = 'Enter', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
      { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
      { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
      { key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
      { key = 'u', mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
    },

  }
}
