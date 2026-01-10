-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")

-- hjkl
vim.keymap.set({ "n", "x" }, "j", function()
  if vim.v.count > 0 or #vim.fn.reg_recording() > 0 or #vim.fn.reg_executing() > 0 then
    return "m'" .. vim.v.count .. "j"
  end
  return "gj"
end, { expr = true })

vim.keymap.set({ "n", "x" }, "k", function()
  if vim.v.count > 0 or #vim.fn.reg_recording() > 0 or #vim.fn.reg_executing() > 0 then
    return "m'" .. vim.v.count .. "k"
  end
  return "gk"
end, { expr = true })

vim.keymap.set({ "n", "v" }, "s", "<Nop>")
vim.keymap.set({ "n", "v" }, "S", "<Nop>")

vim.keymap.set({ "i", "c" }, "jj", "<Esc>", { noremap = true, silent = true })

-- remap H M L
vim.keymap.set("n", "gH", "H")
vim.keymap.set("n", "gM", "M")
vim.keymap.set("n", "gL", "L")

-- buffer navigation
-- vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { silent = true })
-- vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { silent = true })
-- vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { silent = true })
-- vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { silent = true })

-- split window
vim.keymap.set("n", "ss", "<cmd>split<cr>")
vim.keymap.set("n", "sv", "<cmd>vsplit<cr>")
vim.keymap.set("n", "sc", "<C-w>c")

-- move window
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sl", "<C-w>l")

-- tab management
vim.keymap.set("n", "<tab>", "<cmd>tabnext<cr>", { silent = true })
vim.keymap.set("n", "<s-tab>", "<cmd>tabprevious<cr>", { silent = true })
vim.keymap.set("n", "th", "<cmd>tabfirst<cr>", { silent = true })
vim.keymap.set("n", "tj", "<cmd>tabprevious<cr>", { silent = true })
vim.keymap.set("n", "tk", "<cmd>tabnext<cr>", { silent = true })
vim.keymap.set("n", "tl", "<cmd>tablast<cr>", { silent = true })
vim.keymap.set("n", "tt", "<cmd>tabe .<cr>", { silent = true })
vim.keymap.set("n", "tq", "<cmd>tabclose<cr>", { silent = true })

-- terminal mode
vim.keymap.set("t", "<C-k>", [[<C-\><C-n>]])

-- command mode
--- Emacs style from yutkat
vim.keymap.set("c", "<C-a>", "<Home>", { silent = false })
if not vim.g.vscode then
  vim.keymap.set("c", "<C-e>", "<End>", { silent = false })
end
vim.keymap.set("c", "<C-f>", "<right>", { silent = false })
vim.keymap.set("c", "<C-b>", "<left>", { silent = false })
vim.keymap.set("c", "<C-d>", "<DEL>", { silent = false })

-- toggle 0 made by ycino
vim.keymap.set("n", "0", function()
  return string.match((vim.fn.getline(".") --[[@as string]]):sub(0, vim.fn.col(".") - 1), "^%s+$") and "0" or "^"
end, { expr = true, silent = true })

-- Automatically indent with i and A made by ycino
vim.keymap.set("n", "i", function()
  return vim.fn.len(vim.fn.getline(".")) ~= 0 and "i" or '"_cc'
end, { expr = true, silent = true })
vim.keymap.set("n", "A", function()
  return vim.fn.len(vim.fn.getline(".")) ~= 0 and "A" or '"_cc'
end, { expr = true, silent = true })

vim.keymap.set({ "n", "v" }, "x", '"_x') -- delete without yank
vim.keymap.set({ "n", "v" }, "X", '"_d$') -- delete to end of line without yank
vim.keymap.set("n", "gq", "<cmd>nohlsearch<cr><esc>")
vim.keymap.set("n", "U", "<C-r>") -- redo by U
vim.keymap.set({ "n", "v" }, "<leader>x", vim.cmd.cclose)
vim.keymap.set("n", "M", "%") -- jump to matching bracket by M
vim.keymap.set("x", "p", "P") -- don't override register when paste in visual mode
vim.keymap.set("x", "y", "mzy`z") -- restore cursor position after yank in visual mode
vim.keymap.set("i", "<C-k>", function() -- capitalize word
  local line = vim.fn.getline(".")
  local col = vim.fn.getpos(".")[3]
  local substring = line:sub(1, col - 1)
  local result = vim.fn.matchstr(substring, [[\v<(\k(<)@!)*$]])
  return "<C-w>" .. result:upper()
end, { expr = true })

-- replace
vim.keymap.set("x", "S", 'y:%s/<C-r><C-r>"//g<Left><Left>')
vim.keymap.set("n", "S", 'yiw:%s/<C-r><C-r>"//g<Left><Left>')

-- indent in visual mode
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- tips from monaqa san: https://zenn.dev/vim_jp/articles/2024-06-05-vim-middle-class-features
for _, quote in ipairs({ '"', "'", "`" }) do
  vim.keymap.set({ "x", "o" }, "a" .. quote, "2i" .. quote)
end

vim.keymap.set("", "<c-i>", "<c-i>")
vim.keymap.set("n", "g<leader>", "<cmd>QuickLook<cr>")
