vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
-- Change without affecting the register (using the black hole register)
vim.keymap.set("n", "<leader>c", '"_c', { desc = "Change without affecting register" })
vim.keymap.set("n", "<leader>C", '"_C', { desc = "Change from cursor to EOL without affecting register" })

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- window management --
vim.keymap.set("n", "<leader>sv", "<C-w>v<C-w>w", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s<C-w>w", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
-- window management --

-- Open the floating diagnostic window
vim.keymap.set("n", "<leader>od", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Close diagnostic float" })

vim.keymap.set("n", "<leader>wr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("x", "<leader>wr", [["hy:%s/<C-r>h/<C-r>h/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.keymap.set("n", "<leader>ea", 'oassert.NoError(err, "")<Esc>F";a')

vim.keymap.set("n", "<leader>el", 'oif err != nil {<CR>}<Esc>O.logger.Error("error", "error", err)<Esc>F.;i')

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

-- alternate file
vim.keymap.set("n", "<leader><Enter>", "<C-^>", { desc = "Alternate file" })

-- tab through buffers
vim.keymap.set("n", "<TAB>", ":bnext<CR>", { silent = true })

-- nvim-tree
-- vim.api.nvim_set_keymap("n", "<leader>ej", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>et", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ef", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ec", ":NvimTreeCollapse<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-h>", "<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-j>", "<Down>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<Up>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-l>", "<Right>", { noremap = true, silent = true })
