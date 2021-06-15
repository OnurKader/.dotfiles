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
set completefunc=emoji#complete
set completeopt=menuone,noinsert,noselect
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
set timeoutlen=333
set updatetime=300
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
Plug 'bfrg/vim-cpp-modern'
Plug 'cespare/vim-toml'
Plug 'christoomey/vim-sort-motion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'gko/vim-coloresque'
Plug 'mhinz/vim-startify'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'rhysd/vim-clang-format'
Plug 'sjl/badwolf'
Plug 'sophacles/vim-processing'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
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
let g:ctrlp_match_window = 'bottom,order:ttb,min:2,max:12'
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
" devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_denite = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_vimfiler = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
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

if !exists('g:vscode')

	" require'nvim-treesitter.configs'.setup {
	"   ensure_installed = "maintained",
	"   highlight = {
	"     enable = true,
	"     disable = { "rust" },
	"   },
	" }

	" Rust & LSP Stuff
	lua <<EOF

	-- nvim_lsp object
	local nvim_lsp = require'lspconfig'

	-- function to attach completion when setting up lsp
	local on_attach = function(client)
	require'completion'.on_attach(client)
end

	-- Enable rust_analyzer
	nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })

	-- Enable diagnostics
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = true,
	signs = true,
	update_in_insert = true,
	}
	)
EOF

	" Use <Tab> and <S-Tab> to navigate through popup menu
	inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

	" Use <Tab> as trigger keys
	imap <Tab> <Plug>(completion_smart_tab)
	imap <S-Tab> <Plug>(completion_smart_s_tab)
	nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

endif

