-- All keybindings live here for easy reference.
-- LSP keymaps are buffer-local (set via LspAttach autocmd below).

local map = vim.keymap.set

-- ============================================
-- General
-- ============================================
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlight" })

-- ============================================
-- File Operations
-- ============================================
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
map("n", "<leader>cd", vim.cmd.Ex, { desc = "Open netrw file browser" })
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- ============================================
-- Window Navigation
-- ============================================
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- ============================================
-- Search & Cursor
-- ============================================
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
map("n", "n", "nzzzv", { desc = "Next search result and center" })
map("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- ============================================
-- Line Movement (Visual)
-- ============================================
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- ============================================
-- Telescope (fuzzy finder)
-- ============================================
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Search text in project" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "List open buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Search help tags" })

-- ============================================
-- LSP (buffer-local, set when LSP attaches)
-- ============================================
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local bmap = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    bmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
    bmap("n", "gr", vim.lsp.buf.references, "Go to references")
    bmap("n", "K", vim.lsp.buf.hover, "Hover documentation")
    bmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    bmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
    bmap("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, "Previous diagnostic")
    bmap("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")
    bmap("n", "<leader>de", vim.diagnostic.open_float, "Show diagnostic in float")
  end,
})
