require'nvim-treesitter.configs'.setup {
	ensure_installed = {"bash", "c", "cmake", "cpp", "css", "html", "javascript", "json",
						"latex", "make", "python", "rust", "toml", "typescript", "yaml", "vim"} ,
	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}
