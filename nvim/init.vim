" Setting Stuff
filetype off
filetype plugin indent on
let g:python3_host_prog = '/usr/bin/python3.7'
let g:python_host_prog = '/usr/bin/python'
let mapleader =","
nnoremap <space> za
set autoread
set background=dark
set backspace=indent,start,eol
set complete-=i
set directory=~/.config/nvim/tmp
set encoding=utf-8
set foldmethod=manual
set hidden
set ignorecase
set inccommand=nosplit
set incsearch
set lazyredraw
set mouse=a
set nobackup
set nocompatible
set noerrorbells
set signcolumn=yes
set shortmess+=c
set noexpandtab
set novisualbell
set nrformats+=alpha
set number
set path+=**
set ruler
set scrolloff=4
set shell=zsh
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smartindent
set softtabstop=4
set splitbelow
set splitright
set t_Co=256
set tabstop=4
set termguicolors
set updatetime=420
set wildmenu
set wildmode=list,longest,full
set wrap
syntax on
augroup numbertoggle
  autocmd!
  " InsertLeave & InsertEnter
  autocmd BufEnter,FocusGained * set relativenumber
  autocmd BufLeave,FocusLost   * set norelativenumber
augroup END
" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'SirVer/UltiSnips'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-sort-motion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'edkolev/tmuxline.vim'
Plug 'elzr/vim-json'
Plug 'gko/vim-coloresque'
Plug 'godlygeek/tabular'
Plug 'hail2u/vim-css3-syntax'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-emoji'
Plug 'kana/vim-operator-user'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'plasticboy/vim-markdown'
Plug 'plytophogy/vim-virtualenv'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'rhysd/vim-clang-format'
Plug 'rking/ag.vim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sjl/badwolf'
Plug 'sophacles/vim-processing'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
call plug#end()
" Color Scheme
" Make the gutters darker than the background.
let g:badwolf_darkgutter = 1
" Make the tab line lighter than the background.
let g:badwolf_tabline = 2
colorscheme badwolf
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
au BufWinEnter ?* silent loadview
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
" Clipboard & Statusline
set clipboard=unnamedplus
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
au BufNewFile,BufRead *.py set textwidth=80
autocmd FileType python set colorcolumn=80
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Some Movement Stuff
nnoremap j gj
nnoremap k gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
inoremap jk <Esc>
inoremap jj <Esc>
" Moving to Windows (Split)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" gj gk Arrow Key Functionality in Normal Mode
nnoremap <Up> gk
nnoremap <Down> gj
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
autocmd BufRead,BufNewFile /home/beronthecolossus/.config/i3/* set filetype=i3
" Pear Tree
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
" CTRL-P
nnoremap <Leader>ag :Ag
autocmd FileType c,cpp,h,hpp let g:clang_format#auto_format = 1
let g:clang_format#detect_style_file = 0
let g:clang_format#style_options = {
			\	"BasedOnStyle": "Mozilla",
			\	"AccessModifierOffset": '0',
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
			\	"AllowShortFunctionsOnASingleLine": "All",
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
			\	"ColumnLimit": '92',
			\	"Cpp11BracedListStyle": 'true',
			\	"DerivePointerAlignment": 'true',
			\	"DisableFormat": 'false',
			\	"ExperimentalAutoDetectBinPacking": 'false',
			\	"FixNamespaceComments": 'true',
			\	"IncludeBlocks": "Regroup",
			\	"IndentCaseLabels": 'true',
			\	"IndentPPDirectives": "AfterHash",
			\	"IndentWidth": '4',
			\	"IndentWrappedFunctionNames": 'false',
			\	"KeepEmptyLinesAtTheStartOfBlocks": 'false',
			\	"Language": "Cpp",
			\	"NamespaceIndentation": "All",
			\	"PenaltyReturnTypeOnItsOwnLine": '10000',
			\	"PointerAlignment": "Left",
			\	"ReflowComments": 'true',
			\	"SortIncludes": 'true',
			\	"SortUsingDeclarations": 'false',
			\	"SpaceAfterCStyleCast": 'false',
			\	"SpaceAfterLogicalNot": 'false',
			\	"SpaceAfterTemplateKeyword": 'false',
			\	"SpaceBeforeAssignmentOperators": 'true',
			\	"SpaceBeforeCpp11BracedList": 'false',
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
			\	"Standard": "Cpp11",
			\	"TabWidth": '4',
			\	"UseTab": "Always" }
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" Coc.nvim
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
let g:UltiSnipsExpandTrigger="<CR>"
" ALE
let g:ale_linters = {
			\	'cpp': ['ccls'],
			\	'hpp': ['ccls'],
			\	'h': ['ccls'],
			\	'c': ['ccls'],
			\	'javascript': ['eslint'],
			\}
let g:airline#extensions#ale#enabled = 1
" Mappings
nnoremap Q @@
nnoremap s "_s
nnoremap x "_x
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
" Prettier
let g:prettier#exec_cmd_async = 1
let g:prettier#config#use_tabs = 'true'
let g:prettier#config#tab_width = 4
let g:prettier#config#print_width = 99
let g:prettier#config#bracket_spacing = 'false'
let g:prettier#config#single_quote = 'false'
let g:prettier#quickfix_auto_focus = 0
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
			\| exe "normal! g'\"" | endif
set completefunc=emoji#complete
nmap <F4> :Goyo<CR>
" Tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
" box-shadow style highlighting
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END
" If NerdTree is the  only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | :bdelete | endif
let nerdtreequitonopen = 0
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
" Git keybinds
let g:gitgutter_grep=''
" Git status
nnoremap  <Leader>gs  :Gstatus<CR>
" Git diff in split window
nnoremap  <Leader>gd  :Gdiffsplit<CR>
" Git commit
nnoremap  <Leader>gc  :Gcommit<CR>
" Git push
nnoremap  <Leader>gP  :Gpush<CR>
" Git pull
nnoremap  <Leader>gp  :Gpull<CR>
" Git merge
nnoremap  <Leader>gm  :Gmerge<CR>
" Compile Stuff
" olcPixelGameEngine
autocmd FileType cpp noremap <F6> <Esc>:w <CR> :!g++ % -o %< -lX11 -O3 -lGL -lpthread -lpng && vblank_mode=0 ./%< <CR>
" SFML
autocmd FileType cpp noremap <F7> <Esc>:w <CR> :!g++ % -o %< -O3 `pkg-config --libs --cflags sfml-all` && ./% &< <CR>
" OpenCV
autocmd FileType cpp noremap <F8> <Esc>:w <CR> :!g++ % -o %< -O3 `pkg-config --libs --cflags opencv` && ./%< <CR>
map <F5> :w! \| !compiler <C-r>%<CR>
" CTRL-C to toggle highlight.
let hlstate=0
nnoremap <C-c> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1 <Esc> <CR>
" Remove Whitespace
autocmd BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" Leader bindings for some snippets and Write/Quit
:noremap <leader>c :wincmd w<cr>
:noremap <leader>h :split<cr>
:noremap <leader>v :vsp<cr>
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
inoremap <leader>cout <Esc>Istd::cout << <Esc>A << std::endl;
inoremap <leader>for <Esc>Ifor (int i = 0; i < <Esc>A; ++i)<Enter>{<Enter>}<Esc>O
inoremap <leader>if <esc>Iif (<esc>A) {<enter>}<esc>O<tab>
inoremap <leader>opge <Esc>:w<CR><Esc>:!g++ % -o %< -lX11 -lGL -lpthread -O3 -lpng `pkg-config --cflags --libs opencv` && vblank_mode=0 ./%< <CR>
inoremap <leader>pge <Esc>:w<CR><Esc>:!g++ % -o %< -lX11 -lGL -lpng -lpthread -O3 && vblank_mode=0 ./%< <CR>
inoremap <leader>q <ESC>:q<CR>
inoremap <leader>sfml <Esc>:w<CR><Esc>:!g++ % -o %< -lsfml-graphics -lsfml-window -O3 -lsfml-system && ./%< <CR>
inoremap <leader>sys <esc>ISystem.out.println(<esc>A);
inoremap <leader>w <Esc>:w<CR>
inoremap <leader>x <ESC>:x<CR>
inoremap <leader>pragma <Esc>ggI#ifndef<Space><++><CR>#define<Space><++><CR><CR>class<Space><++><Enter>{<Enter>};<CR><Esc>GI<CR>#endif<CR><Esc>
map <leader><leader> <Esc>/<++><Enter>"_c4l
nnoremap <Enter> meo<Esc>k`e
nnoremap ü o<Esc>
nnoremap ğ ko<Esc>
noremap <S-Del> <Esc>"_dd
inoremap <S-Del> <Esc>"_dda
nnoremap <leader>j :m+<cr>==
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>w :w<CR>
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader>cout yOstd::cout << <esc>pA << std:endl;
vnoremap <leader>sys yOSystem.out.println(<esc>pA);
" MarkdownPreview Stuff
let g:mkdp_browser = 'qutebrowser'
let g:mkdp_refresh_slow = 1
let g:mkdp_markdown_css = '/home/beronthecolossus/Peki/github-markdown.css'
" Abbreviations
iab whit with
iab wiht with
iab teh the
iab hte the
iab wieght weight
iab hieght height
iab tihs this
iab doubel double
iab mian main
