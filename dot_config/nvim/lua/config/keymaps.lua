-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Mapear jj para Esc no modo de inserção
vim.keymap.set("i", "jk", "<Esc>", { desc = "Sair do modo de inserção com jj" })
