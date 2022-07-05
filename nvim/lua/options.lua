local augroup = vim.api.nvim_create_augroup("numbertoggle", {clear = true})
local aucmd = vim.api.nvim_create_autocmd

vim.opt.autoread = true
vim.opt.background = "dark"
vim.opt.backspace = "indent,start,eol" -- Should I switch to a list?
vim.opt.complete:remove('i')
vim.opt.completeopt = "menuone,noselect"
vim.opt.directory = "/home/beron/.config/nvim/tmp"
vim.opt.encoding = "utf-8"
vim.opt.foldmethod = "manual"
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.lazyredraw = true
vim.opt.mouse = 'a'
vim.opt.backup = false
vim.opt.errorbells = false
vim.opt.expandtab = false
vim.opt.visualbell = false
vim.opt.nrformats:append("alpha")
vim.opt.nrformats:remove("octal")
vim.opt.number = true
vim.opt.path = vim.opt.path + "**"
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.scrolloff = 4
vim.opt.shell = "zsh"
vim.opt.shiftwidth = 4
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.textwidth = 101 -- Should think about this again, possibly larger (wider)
vim.opt.timeoutlen = 450
vim.opt.updatetime = 333
vim.opt.wildmenu = true
vim.opt.wildmode = "list,longest,full"
vim.opt.wildignore:append("*/.git,*/.ccls-cache,*/.idea,*/.cache")
vim.opt.wrap = true

-- Should I change the set *number* stuff to lua versions

-- InsertEnter
aucmd("FocusGained", {
	pattern = "*",
	group= augroup,
	command = "set relativenumber number"
})

-- InsertLeave
aucmd("FocusLost", {
	pattern = "*",
	group= augroup,
	command = "set norelativenumber"
})

-- Plugin options among other things
-- Colorscheme
vim.g.badwolf_darkgutter = 1
vim.g.badwolf_tabline = 2
vim.g.badwolf_css_props_highlight = 1

vim.cmd [[
  syntax enable
  colorscheme badwolf
]]

-- Airline
vim.g.airline_powerline_fonts = 1

-- Had some problems so...
vim.cmd [[
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" Powerline Symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ''
]]

-- Also laziness
vim.cmd [[
" Views
au BufWritePost,BufLeave,WinLeave ?* mkview
au BufWinEnter ?* silent! loadview
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
]]


--[[
" Clipboard & Statusline
set clipboard=unnamedplus
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
au BufNewFile,BufRead *.py set textwidth=80
autocmd FileType python set colorcolumn=80
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType gitcommit set tabstop=4
" Some Movement Stuff
nnoremap j gj
nnoremap k gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
inoremap jk <Esc>
inoremap jj <Esc>
" gj gk Arrow Key Functionality in Normal Mode
nnoremap <Up> gk
nnoremap <Down> gj
-]]


