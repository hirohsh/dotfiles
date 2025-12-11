-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

require("config.global")

local opt = vim.opt

-- ========== 表示系 ==========
opt.number = true            -- 行番号
opt.relativenumber = true    -- 相対行番号
opt.cursorline = true        -- 現在行ハイライト
opt.signcolumn = "yes"       -- サインカラム常時表示
opt.wrap = false             -- 行の折り返しを無効化
opt.pumblend = 10            -- ポップアップメニュー透明度

-- ========== インデント ==========
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- ========== 検索 ==========
opt.ignorecase = true        -- 大文字小文字を無視
opt.smartcase = true         -- 大文字が含まれていたら区別する
opt.incsearch = true         -- インクリメンタルサーチ
opt.hlsearch = true          -- 検索ハイライトを残す

-- ========== パフォーマンス ==========
opt.updatetime = 200         -- update早くして軽快に
opt.timeoutlen = 400         -- キーマップ待機時間短縮

-- ========== UI快適化 ==========
opt.termguicolors = true     -- True Color
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 8            -- 上下の余白
opt.sidescrolloff = 8

-- ========== 編集体験 ==========
opt.clipboard = "unnamedplus" -- OSクリップボード共有
opt.undofile = true           -- 永続 undo ファイル
opt.swapfile = false          -- 古い swapfile 無効化
opt.autoread = true           -- 外部変更を自動読み込み

-- ========== その他 ==========
opt.completeopt = { "menu", "menuone", "noselect" } -- 補完の挙動改善
vim.opt.list = true           -- 可視化文字を表示
vim.opt.listchars = {
  tab = "▸▹┊",
  trail = "▫",
  nbsp = "␣",
  extends = "❯",
  precedes = "❮",
}