-- Custom keymaps not tied to a specific plugin.
-- Plugin-specific keymaps live inside each plugin's own spec file so
-- everything about that plugin stays in one place.

local map = vim.keymap.set

map("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })

map("n", "<leader>cd", vim.cmd.Ex)

map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

map("n", "<C-d>", "<C-d>zz") -- Keep cursor in place while moving up/down page
-- sometimes in insert mode, control-c doesn't exactly work like escape
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")       -- center screen when looping search results
map("n", "N", "Nzzzv")

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Clear search highlight
map("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlight" })

-- Move selected lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
