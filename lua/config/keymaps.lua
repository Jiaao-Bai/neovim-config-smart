-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
  noremap = true, -- 键位映射是非递归的
  silent = true, -- 关闭映射触发时多余的信息
}

-- 本地变量
local map = vim.api.nvim_set_keymap

map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>wq", ":wqa!<CR>", opt)

-- 上下滚动浏览
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)
map("n", "<C-Down>", "5j", opt)
map("n", "<C-Up>", "5k", opt)
map("v", "<C-Down>", "5j", opt)
map("v", "<C-Up>", "5k", opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
map("n", "<C-m>", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>m", ":NvimTreeToggle<CR>", opt)

-- 列表快捷键
pluginKeys.nvimTreeList = { -- 打开文件或文件夹
  { key = { "<CR>", "<2-LeftMouse>" }, action = "edit" },
  { key = "o", action = "system_open" },
  -- v分屏打开文件
  { key = "v", action = "vsplit" },
  -- h分屏打开文件
  { key = "h", action = "split" },
  -- Ignore (node_modules)
  { key = "i", action = "toggle_ignored" },
  -- Hide (dotfiles)
  { key = ".", action = "toggle_dotfiles" },
  { key = "R", action = "refresh" },
  -- 文件操作
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "y", action = "copy_name" },
  { key = "Y", action = "copy_path" },
  { key = "gy", action = "copy_absolute_path" },
  { key = "I", action = "toggle_file_info" },
  { key = "n", action = "tabnew" },
  -- 进入下一级
  { key = { "]" }, action = "cd" },
  -- 进入上一级
  { key = { "[" }, action = "dir_up" },
}

return pluginKeys
