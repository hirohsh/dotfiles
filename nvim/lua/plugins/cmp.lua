return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-@>"] = cmp.mapping.complete(),
        ["<Nul>"] = cmp.mapping.complete(),
      })
    end,
  },
}
