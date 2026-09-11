-- Basic editor options. Tweak freely; this is the safest file to experiment in.

local opt = vim.opt

vim.g.mapleader = " "        -- Space is leader key (pressed before custom shortcuts)
vim.g.maplocalleader = " "

opt.number = true            -- show line numbers
opt.relativenumber = true    -- relative numbers, handy for jumps (5j, 3k, etc.)
opt.cursorline = true        -- highlight current line

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true         -- spaces instead of tabs
opt.smartindent = true
opt.backspace = "indent,eol,start"

opt.wrap = false
opt.scrolloff = 8            -- keep 8 lines visible above/below cursor
opt.sidescrolloff = 8

opt.colorcolumn = "80"       -- highlight 80th column
opt.scrolloff = 8            -- keep cursor at least 8 rows from top/bottom

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.incsearch = true         -- incremental search

opt.iskeyword:append("-")    -- dw/diw/ciw works on full-word )

opt.ignorecase = true
opt.smartcase = true         -- case-sensitive search only if you type a capital

opt.splitright = true        -- vertical splits open to the right
opt.splitbelow = true        -- horizontal splits open below

opt.termguicolors = true     -- true color support (needed for most themes)
opt.signcolumn = "yes"       -- always show sign column (avoids text shifting)

opt.updatetime = 250         -- faster completion / diagnostics popup
opt.timeoutlen = 400         -- faster which-key-style popups

opt.undofile = true          -- persistent undo across sessions
opt.swapfile = false

opt.clipboard = "unnamedplus" -- use system clipboard for yank/paste
