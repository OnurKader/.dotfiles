local map = vim.keymap.set

map('n', 'j', "gj")
map('n', 'k', "gk")
map('i', "<Down>", "<C-o>gj")
map('i', "<Up>", "<C-o>gk")
map('n', "<Down>", "gj")
map('n', "<Up>", "gk")
map('i', "jk", "<Esc>")
map('i', "jj", "<Esc>")
map('n', 'Q', "@@")
map('n', 's', '"_s')
map('n', 'x', '"_x')
-- cmap qw wq -- Unnecessary
-- cmap wwq wq
map('v', '<', "<gv")
map('v', '>', ">gv")
map('n', "<S-J><S-J>", "i<CR><Esc>k$")
map('i', "<S-J><S-J>", "<Esc>i<CR><Esc>kA")
map('n', "<Leader>h", ":sp<CR>")
map('n', "<Leader>v", ":vsp<CR>")
map('i', "<Leader>i", "<++>")
map('', "<Leader><Leader>", '<Esc>/<++><Enter>"_c4l')
-- These can be an empty mode ''
map('i', "<Leader>w", "<Esc>:w<CR>")
map('i', "<Leader>W", "<Esc>:w<CR>")
map('i', "<Leader>q", "<Esc>:q<CR>")
map('i', "<Leader>Q", "<Esc>:q<CR>")
map('i', "<Leader>x", "<Esc>:x<CR>")
map('i', "<Leader>X", "<Esc>:x<CR>")
map('', "<Leader>w", "<Esc>:w<CR>")
map('', "<Leader>W", "<Esc>:w<CR>")
map('', "<Leader>q", "<Esc>:q<CR>")
map('', "<Leader>Q", "<Esc>:q<CR>")
map('', "<Leader>x", "<Esc>:x<CR>")
map('', "<Leader>X", "<Esc>:x<CR>")
map('n', "<Leader><Enter>", "mqo<Esc>k`q") -- Changed to ',<CR>' to have the default functionality
map('n', 'ü', "o<Esc>")
map('n', 'ğ', "mqO<Esc>`q")
map('n', "<S-Del>", '<Esc>"_dd')
map('i', "<S-Del>", '<Esc>"_dda')
map('n', "<Leader>j", ":m+<cr>==")
map('n', "<Leader>k", ":m-2<cr>==")
map('n', "<Space>", "za")

