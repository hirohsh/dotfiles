-- ~/.config/nvim/lua/plugins/copilot.lua
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        TelescopePrompt = false,
        gitcommit = false,
      },
    },
  },
}
