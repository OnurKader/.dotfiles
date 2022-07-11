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
vim.opt.timeoutlen = 500
vim.opt.updatetime = 500
vim.opt.wildmenu = true
vim.opt.wildmode = "list,longest,full"
vim.opt.wildignore:append("*/.git,*/.ccls-cache,*/.idea,*/.cache")
vim.opt.wrap = true
vim.opt.cmdheight = 2

vim.g.mapleader = ','
vim.g["clang_format#detect_style_file"] = 1

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
let g:airline#extensions#tabline#enabled = 0
]]

-- Also laziness
vim.cmd [[
" Views
au BufWritePost,BufLeave,WinLeave ?* mkview
au BufWinEnter ?* silent! loadview
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
]]

-- Clipboard & Statusline
vim.opt.clipboard = "unnamedplus"
vim.opt.statusline:append("%#warningmsg#")
vim.opt.statusline:append("%{SyntasticStatuslineFlag()}")
vim.opt.statusline:append("%*")

-- I don't think this actually works
-- aucmd("BufRead", {pattern = "/home/beron/.config/i3/*", command = "set ft=i3"})
-- vim.filetype.add({pattern = {["/home/beron/.config/i3*/*"] = "i3"}})

-- CtrlP
vim.g.ctrlp_map = "<C-p>"
vim.g.ctrlp_cmd = "CtrlP"
vim.g.ctrlp_switch_buffer = "et"
vim.g.ctrlp_match_window = "bottom,order:ttb,min:2,max:15"
vim.g.ctrlp_working_path_mode = 'a'
-- vim.g.ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
vim.g.ctrlp_show_hidden = 1


vim.cmd [[
" Python specific stuff
au BufNewFile,BufRead *.py set textwidth=80
autocmd FileType python set colorcolumn=80
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType gitcommit set tabstop=4
]]

-- Yeah I'm bored, I'll clean this up later
vim.cmd [[
let g:max_diagnostics_to_display=64
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
			\| exe "normal! g'\"" | endif
let g:cpp_member_highlight = 1
let g:cpp_attributes_highlight = 1
let c_no_curly_error=1
" Git keybinds
let g:gitgutter_grep=''
let g:gitgutter_max_signs = 512
" Remove Whitespace
autocmd BufWrite * if ! &bin && &filetype != "gitcommit" | silent! %s/\s\+$//ge | endif
" Enable spell check for git commits
autocmd BufRead COMMIT_EDITMSG set spell
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
]]

-- Forgive me father for I have sinned
vim.cmd [[
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
]]
