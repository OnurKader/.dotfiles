" Setting Stuff
filetype off
filetype plugin indent on
let g:python3_host_prog = '/usr/bin/python3.9'
let g:python_host_prog = '/usr/bin/python2.7'
let mapleader = ','
nnoremap <space> za
set autoread
set background=dark
set backspace=indent,start,eol
set complete-=i
set completeopt=menuone,noselect
set directory=~/.config/nvim/tmp
set encoding=utf-8
set foldmethod=manual
set hidden
set ignorecase
set inccommand=nosplit
set incsearch
" set iskeyword-=_
set lazyredraw
set mouse=a
set nobackup
set nocompatible
set noerrorbells
set noexpandtab
set novisualbell
set nrformats+=alpha
set nrformats-=octal
set number
set path+=**
set ruler
set scrolloff=4
set shell=zsh
set shiftwidth=4
set shortmess+=c
set showcmd
set showmatch
set signcolumn=yes
set smartcase
set smartindent
set smarttab
set softtabstop=4
set splitbelow
set splitright
set t_Co=256
set tabstop=4
set termguicolors
set textwidth=101
set timeoutlen=450
set updatetime=333
set wildmenu
set wildmode=list,longest,full
set wildignore+=*/.git,*/.ccls-cache,*/.idea
set wrap
syntax on
augroup numbertoggle
  autocmd!
  " InsertLeave & InsertEnter
  autocmd BufEnter,FocusGained * set relativenumber number
  autocmd BufLeave,FocusLost   * set norelativenumber
augroup END
" Plugins
call plug#begin('/home/beron/.local/share/nvim/plugged')
Plug 'ActivityWatch/aw-watcher-vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'christoomey/vim-sort-motion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'rafamadriz/friendly-snippets'
Plug 'gko/vim-coloresque'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rhysd/vim-clang-format'
Plug 'sjl/badwolf'
Plug 'hrsh7th/vim-vsnip'
Plug 'honza/vim-snippets'
Plug 'sophacles/vim-processing'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'tpope/vim-surround'
Plug 'tweekmonster/startuptime.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
" Color Scheme
" Make the gutters darker than the background.
let g:badwolf_darkgutter = 1
" Make the tab line lighter than the background.
let g:badwolf_tabline = 2
" Enable CSS Properties
let g:badwolf_css_props_highlight = 1
colorscheme badwolf
" Transparent Background
" highlight Normal guibg=NONE ctermbg=NONE
" highlight LineNr guibg=NONE ctermbg=NONE
" Airline Stuff
let g:airline_powerline_fonts = 1
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
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
" Views
au BufWritePost,BufLeave,WinLeave ?* mkview
au BufWinEnter ?* silent! loadview
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
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
" Moving to Windows (Split)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
autocmd BufRead,BufNewFile /home/beron/.config/i3/* set filetype=i3
autocmd BufRead COMMIT_EDITMSG set spell
" Pear Tree
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
" Clang-Format
autocmd FileType c,cpp,h,hpp let g:clang_format#auto_format = 0
let g:clang_format#detect_style_file = 0
augroup ClangFormatSettings
	autocmd!
	" map to <Leader>cf in C++ code
	autocmd FileType c,cpp,h,hpp,cc,hh nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
	autocmd FileType c,cpp,h,hpp,cc,hh inoremap <buffer><Leader>cf <Esc>:ClangFormat<CR>
	autocmd FileType c,cpp,h,hpp,cc,hh vnoremap <buffer><Leader>cf :ClangFormat<CR>
	autocmd FileType rust,rs nnoremap <buffer><Leader>cf :!rustfmt %<CR>
	autocmd FileType rust,rs inoremap <buffer><Leader>cf <Esc>:!rustfmt %<CR>
	autocmd FileType rust,rs vnoremap <buffer><Leader>cf :!rustfmt %<CR>
augroup END
let g:clang_format#style_options = {
			\	"BasedOnStyle": "Mozilla",
			\	"AccessModifierOffset": '-4',
			\	"AlignAfterOpenBracket": "Align",
			\	"AlignConsecutiveMacros": 'true',
			\	"AlignConsecutiveAssignments": 'false',
			\	"AlignConsecutiveDeclarations": 'false',
			\	"AlignEscapedNewlines": "Left",
			\	"AlignOperands": 'true',
			\	"AlignTrailingComments": 'true',
			\	"AllowAllArgumentsOnNextLine": 'true',
			\	"AllowAllConstructorInitializersOnNextLine": 'true',
			\	"AllowAllParametersOfDeclarationOnNextLine": 'true',
			\	"AllowShortBlocksOnASingleLine": 'true',
			\	"AllowShortCaseLabelsOnASingleLine": 'true',
			\	"AllowShortFunctionsOnASingleLine": 'true',
			\	"AllowShortIfStatementsOnASingleLine": "Never",
			\	"AllowShortLambdasOnASingleLine": "All",
			\	"AllowShortLoopsOnASingleLine": 'false',
			\	"AlwaysBreakAfterDefinitionReturnType": "None",
			\	"AlwaysBreakAfterReturnType": 'None',
			\	"AlwaysBreakBeforeMultilineStrings": 'false',
			\	"AlwaysBreakTemplateDeclarations": 'Yes',
			\	"BinPackArguments": 'false',
			\	"BinPackParameters": 'false',
			\	"BreakBeforeBinaryOperators": "None",
			\	"BreakBeforeBraces": "Allman",
			\	"BreakBeforeTernaryOperators": 'true',
			\	"BreakConstructorInitializers": "AfterColon",
			\	"BreakInheritanceList": "AfterColon",
			\	"BreakStringLiterals": 'true',
			\	"CompactNamespaces": 'false',
			\	"ConstructorInitializerAllOnOneLineOrOnePerLine": 'true',
			\	"ConstructorInitializerIndentWidth": '4',
			\	"ContinuationIndentWidth": '4',
			\	"ColumnLimit": '101',
			\	"Cpp11BracedListStyle": 'true',
			\	"DerivePointerAlignment": 'false',
			\	"DisableFormat": 'false',
			\	"ExperimentalAutoDetectBinPacking": 'false',
			\	"FixNamespaceComments": 'true',
			\	"IncludeBlocks": "Regroup",
			\	"IndentCaseLabels": 'true',
			\	"IndentPPDirectives": "None",
			\	"IndentWidth": '4',
			\	"IndentWrappedFunctionNames": 'false',
			\	"KeepEmptyLinesAtTheStartOfBlocks": 'false',
			\	"Language": "Cpp",
			\	"NamespaceIndentation": "None",
			\	"PenaltyReturnTypeOnItsOwnLine": '10000',
			\	"PointerAlignment": "Left",
			\	"ReflowComments": 'true',
			\	"SortIncludes": 'true',
			\	"SortUsingDeclarations": 'false',
			\	"SpaceAfterCStyleCast": 'false',
			\	"SpaceAfterLogicalNot": 'false',
			\	"SpaceAfterTemplateKeyword": 'false',
			\	"SpaceBeforeAssignmentOperators": 'true',
			\	"SpaceBeforeCpp11BracedList": 'true',
			\	"SpaceBeforeCtorInitializerColon": 'true',
			\	"SpaceBeforeInheritanceColon": 'true',
			\	"SpaceBeforeParens": "Never",
			\	"SpaceBeforeRangeBasedForLoopColon": 'false',
			\	"SpaceInEmptyParentheses": 'false',
			\	"SpacesBeforeTrailingComments": '4',
			\	"SpacesInAngles": 'false',
			\	"SpacesInCStyleCastParentheses": 'false',
			\	"SpacesInContainerLiterals": 'false',
			\	"SpacesInParentheses": 'false',
			\	"SpacesInSquareBrackets": 'false',
			\	"Standard": "Latest",
			\	"TabWidth": '4',
			\	"UseTab": "Always" }
" CTRL-P
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_match_window = 'bottom,order:ttb,min:2,max:15'
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_show_hidden = 1
" Mappings
nnoremap Q @@
noremap s "_s
noremap x "_x
cmap qw wq
cmap wwq wq
vnoremap < <gv
vnoremap > >gv
nnoremap Y y$
nnoremap <S-J><S-J> i<CR><Esc>k$
inoremap <S-J><S-J> <Esc>i<CR><Esc>kA
let g:max_diagnostics_to_display=64
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
			\| exe "normal! g'\"" | endif
let g:cpp_member_highlight = 1
let g:cpp_attributes_highlight = 1
let c_no_curly_error=1
" box-shadow style highlighting
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END
" Git keybinds
let g:gitgutter_grep=''
let g:gitgutter_max_signs = 512
" CTRL-C to toggle highlight.
let hlstate=0
nnoremap <C-c> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1 <Esc>
" Remove Whitespace
autocmd BufWrite * if ! &bin && &filetype != "gitcommit" | silent! %s/\s\+$//ge | endif
" Leader bindings for some snippets and Write/Quit
" :noremap <leader>c :wincmd w<cr>
:noremap <leader>h :sp<CR>
:noremap <leader>v :vsp<CR>
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
inoremap <leader>w <Esc>:w<CR>
inoremap ,w <Esc>:w<CR>
inoremap <leader>q <ESC>:q<CR>
inoremap <leader>x <ESC>:x<CR>
map <leader><leader> <Esc>/<++><Enter>"_c4l
map ,, <Esc>/<++><Enter>"_c4l
nnoremap <Enter> meo<Esc>k`e
nnoremap ü o<Esc>
nnoremap ğ mmO<Esc>`m
noremap <S-Del> <Esc>"_dd
inoremap <S-Del> <Esc>"_dda
nnoremap <Leader>j :m+<cr>==
nnoremap <Leader>k :m-2<cr>==
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :w<CR>
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
" Abbreviations
iab whit with
iab wiht with
iab teh the
iab hte the
iab wieght weight
iab lenght length
iab hieght height
iab tihs this
iab doubel double
iab mian main
iab flaot float

" LSPConfig
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  ---buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  ---buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>l', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<leader>T', '<cmd>lua require\'lsp_extensions\'.inlay_hints()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'bashls' }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
	capabilities = capabilities,
    flags = {
      debounce_text_changes = 300,
    }
  }
end
EOF

lua << EOF
-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 2;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
	buffer = true;
	vsnip = true;
	-- spell = true;
    nvim_lsp = true;
	nvim_lua = true;
    path = true;
	-- treesitter = true;
	tags = true;
  };
}

-- Utility functions for compe and luasnip
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col '.' - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-n>'
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t '<Tab>'
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-p>'
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t '<S-Tab>'
  end
end

-- Map tab to the above tab complete functiones
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })

-- Map compe confirm and complete functions
vim.api.nvim_set_keymap('i', '<Escape>', 'compe#close()', { expr = true })
vim.api.nvim_set_keymap('i', '<CR>', 'compe#complete("<CR>")', { expr = true })
vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#confirm()', { expr = true })
vim.api.nvim_set_keymap('s', '<C-Space>', 'compe#confirm()', { expr = true })
vim.api.nvim_set_keymap('i', '<C-Y>', 'compe#confirm()', { expr = true })
EOF

" Show hints on file enter
autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}

" Tree-Sitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = { "bash", "c", "cmake", "cpp", "css", "javascript", "json", "latex", "python", "rust", "toml", "typescript", "yaml"} ,
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

"" https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
