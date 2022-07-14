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
map('i', "<Leader>w", "<Esc>:w<CR>")
map('i', "<Leader>W", "<Esc>:w<CR>")
map('i', "<Leader>q", "<Esc>:q<CR>")
map('i', "<Leader>Q", "<Esc>:q<CR>")
map('i', "<Leader>x", "<Esc>:x<CR>")
map('i', "<Leader>X", "<Esc>:x<CR>")
map('', "<Leader>w", ":w<CR>")
map('', "<Leader>W", ":w<CR>")
map('', "<Leader>q", ":q<CR>")
map('', "<Leader>Q", ":q<CR>")
map('', "<Leader>x", ":x<CR>")
map('', "<Leader>X", ":x<CR>")
map('n', "<Leader><Enter>", "mqo<Esc>k`q") -- Changed to ',<CR>' to have the default functionality
map('n', 'ü', "o<Esc>")
map('n', 'ğ', "mqO<Esc>`q")
map('n', "<S-Del>", '<Esc>"_dd')
map('i', "<S-Del>", '<Esc>"_dda')
map('n', "<Leader>j", ":m+<cr>==")
map('n', "<Leader>k", ":m-2<cr>==")
map('n', "<Space>", "za")

-- Telescope
local telescope_builtin = require("telescope.builtin")
map('n', "<C-p>", telescope_builtin.find_files)
map('n', "<Leader>t", telescope_builtin.find_files)
map('n', "<Leader>g", telescope_builtin.live_grep)
map('n', "<Leader>b", telescope_builtin.buffers)
map('n', "<Leader>m", function() telescope_builtin.man_pages({ sections = { "ALL" } }) end)

--[[
Map "<Leader>l*" to these
builtin.lsp_references					Lists LSP references for word under the cursor
builtin.lsp_incoming_calls				Lists LSP incoming calls for word under the cursor
builtin.lsp_outgoing_calls				Lists LSP outgoing calls for word under the cursor
builtin.lsp_document_symbols			Lists LSP document symbols in the current buffer
builtin.lsp_workspace_symbols			Lists LSP document symbols in the current workspace
builtin.lsp_dynamic_workspace_symbols 	Dynamically Lists LSP for all workspace symbols
builtin.diagnostics						Lists Diagnostics for all open buffers or a specific buffer. Use option bufnr=0 for current buffer.
builtin.lsp_implementations				Goto the implementation of the word under the cursor if there's only one, otherwise show all options in Telescope
builtin.lsp_definitions					Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope
builtin.lsp_type_definitions			Goto the definition of the type of the word under the cursor, if there's only one, otherwise show all options in Telescope
]]--

