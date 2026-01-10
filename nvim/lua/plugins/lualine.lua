return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- LazyVim デフォルトの lualine_c は
      --   1) root_dir 2) diagnostics 3) filetype(icon_only) 4) pretty_path
      -- なので、4番目を「省略なし pretty_path」に差し替えます。
      opts.sections.lualine_c[4] = {
        LazyVim.lualine.pretty_path({
          length = 0, -- 0 = `...` に省略しない（全部出す）
          -- relative = "root", -- 必要なら指定（root基準）
          -- relative = "cwd",  -- 必要なら指定（cwd基準）
        }),
      }
    end,
  },
}
