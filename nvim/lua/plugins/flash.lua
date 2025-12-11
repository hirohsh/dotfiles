return {
  "folke/flash.nvim",
  keys = function(_, keys)
    -- Flash のデフォルトキーを削除して上書きする
    return {
      { "<CR>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    }
  end,
}