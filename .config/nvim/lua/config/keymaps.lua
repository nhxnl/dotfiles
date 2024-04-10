local keymap = vim.keymap

keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
keymap.set("i", "jk", "<Esc>", { desc = "Escape with jk" })
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n><C-w>h", { silent = true, desc = "Escape in terminal" })
keymap.set("n", "x", '"_x', { desc = "Delete character without yanking" })
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number under cursor" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number under cursor" })
-- keymap.set("n", "dw", 'vb"_d')
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
keymap.set("n", "J", "mzJ`z", { desc = "Append the line below to the current line" })
keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without losing previous yank" })
keymap.set("n", "<leader>rp", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Replace" })
-- Remap for dealing with word wrap
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set("n", "gk", "k", { silent = true })
keymap.set("n", "gj", "j", { silent = true })
-- Diagnostic keymaps
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
-- Indent while remaining in visual mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
keymap.set("n", "<Esc>", "<cmd>noh<CR><Esc>", { desc = "Escape and clear hlsearch" })
keymap.set("n", "U", "<C-r>", { desc = "Redo" })
keymap.set({ "s", "i", "n", "v" }, "<C-s>", "<Esc>:w<CR>", { desc = "Exit insert mode and save changes" })
keymap.set({ "i", "c" }, "<C-h>", "<C-Left>", { desc = "Move word(s) backwards" })
keymap.set({ "i", "c" }, "<C-l>", "<C-Right>", { desc = "Move word(s) forwards" })
-- Keeping the cursor centered while jumping up down
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll downwards" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll upwards" })
keymap.set("n", "n", "nzzzv", { desc = "Next result" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous result" })
-- Tab
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tu", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", ":tabnext<CR>", { noremap = true, silent = true, desc = "Go to next tab" })
keymap.set("n", "<leader>tp", ":tabprev<CR>", { noremap = true, silent = true, desc = "Go to previous tab" })
-- Split window
keymap.set("n", "<leader>si", ":split<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>so", ":vsplit<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>su", ":close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize splits size" })
-- Move window
keymap.set("n", "<leader>sh", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<leader>sk", "<C-w>k", { desc = "Go to top window" })
keymap.set("n", "<leader>sj", "<C-w>j", { desc = "Go to bottom window" })
keymap.set("n", "<leader>sl", "<C-w>l", { desc = "Go to right window" })
-- Resize window
keymap.set("n", "<A-Left>", "<C-w>>")
keymap.set("n", "<A-Right>", "<C-w><")
keymap.set("n", "<A-Up>", "<C-w>+")
keymap.set("n", "<A-Down>", "<C-w>-")
-- Opt move code
keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move up" })
keymap.set("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move down" })
keymap.set("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move up" })
keymap.set("n", "<C-`>", ":new<CR>:term<CR>", { noremap = true, desc = "Open terminal in bottom split" })
-- Plugins keymaps
keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory with Oil" })
keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Open Lazy plugin manager" })
keymap.set("n", "<C-b>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neotree" })
