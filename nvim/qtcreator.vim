" Setting Stuff
filetype off
filetype plugin indent on
let g:python3_host_prog = '/usr/bin/python3.9'
let g:python_host_prog = '/usr/bin/python'
let mapleader =","
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
set timeoutlen=333
set updatetime=300
set wildmenu
set wildmode=list,longest,full
set wildignore+=*/.git,*/.ccls-cache
set wrap
syntax on
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
autocmd BufRead,BufNewFile /home/beronthecolossus/.config/i3/* set filetype=i3
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
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
			\| exe "normal! g'\"" | endif
" Leader bindings for some snippets and Write/Quit
:noremap <leader>c :wincmd w<cr>
:noremap <leader>h :split<cr>
:noremap <leader>v :vsp<cr>
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
nnoremap <leader>k :m-2<cr>==
nnoremap ,j :m+<cr>==
nnoremap ,k :m-2<cr>==
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>w :w<CR>
nnoremap ,w :w<CR>
nnoremap <leader>W :w<CR>
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
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

