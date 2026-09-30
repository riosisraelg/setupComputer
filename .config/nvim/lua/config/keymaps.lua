-- ~/.config/nvim/lua/config/keymaps.lua
-- General Keymaps Configuration

local map = vim.keymap.set

-- 1. General Editing
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save File" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save File" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit Current Window" })
map("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Save and Quit" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Force Quit All" })

-- 2. Search Navigation & Clear Highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "Clear Search Highlights" })
map("n", "n", "nzzzv", { desc = "Next Search Result (Centered)" })
map("n", "N", "Nzzzv", { desc = "Previous Search Result (Centered)" })

-- 3. Half-page Scrolling (keep cursor centered)
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down Half-Page (Centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up Half-Page (Centered)" })

-- 4. Window Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to Left Window Split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to Lower Window Split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to Upper Window Split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to Right Window Split" })

-- 5. Window Resizing
map("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Decrease Window Height" })
map("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Increase Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase Window Width" })

-- 6. Window Split Management
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split Window Vertically" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split Window Horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make Split Windows Equal Size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close Current Split Window" })

-- 7. Buffer Management
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next Buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close Current Buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
map("n", "]b", "<cmd>bnext<CR>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })

-- 8. Visual Mode Indentation (stay in visual mode)
map("v", "<", "<gv", { desc = "Indent Left and Reselect" })
map("v", ">", ">gv", { desc = "Indent Right and Reselect" })

-- 9. Visual Mode Line Movement
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selected Lines Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selected Lines Up" })
map("x", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selected Lines Down" })
map("x", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selected Lines Up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move Selected Lines Down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move Selected Lines Up" })

-- 10. Clipboard (paste over selection without overwriting unnamed register)
map("x", "p", [["_dP]], { desc = "Paste Over Selection Without Overwriting Register" })
map("x", "P", [["_dP]], { desc = "Paste Over Selection Without Overwriting Register" })

-- 11. Terminal Management
map("n", "<leader>tt", "<cmd>terminal<CR>", { desc = "Open Terminal in Current Window" })
map("n", "<leader>th", "<cmd>split | terminal<CR>", { desc = "Open Horizontal Terminal" })
map("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", { desc = "Open Vertical Terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
map("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move to Left Window Split from Terminal" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move to Lower Window Split from Terminal" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move to Upper Window Split from Terminal" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move to Right Window Split from Terminal" })
