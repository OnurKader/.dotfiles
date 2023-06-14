local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- Check this out "https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim"
require("lazy").setup({
	{ "NvChad/nvim-colorizer.lua" },
	{ "Pocco81/true-zen.nvim" },
	{ "PotatoesMaster/i3-vim-syntax" },
	{ "Saecki/crates.nvim" },
	{ "arrufat/vala.vim" },
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "cespare/vim-toml" },
	{ "christoomey/vim-sort-motion" },
	{ "dstein64/vim-startuptime" },
	{ "eandrju/cellular-automaton.nvim" },
	{ "ellisonleao/gruvbox.nvim", priority = 420, lazy = false },
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "habamax/vim-godot" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/vim-vsnip" },
	{ "hrsh7th/vim-vsnip-integ" },
	{ "imsnif/kdl.vim" },
	{ "jghauser/mkdir.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "krady21/compiler-explorer.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "kyazdani42/nvim-web-devicons" },
	{ "kylechui/nvim-surround" },
	{ "lewis6991/gitsigns.nvim" },
	{ "luisiacc/gruvbox-baby" },
	{ "mrjones2014/tldr.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },
	{ "neovim/nvim-lspconfig" },
	{ "numToStr/Comment.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-lua/popup.nvim" },
	{ "nvim-lualine/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		dependencies = { { "nvim-telescope/telescope.nvim" } },
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{ "nvim-telescope/telescope-media-files.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },
	{ "nvim-telescope/telescope-symbols.nvim" },
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, tag = "0.1.1" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "onsails/lspkind-nvim" },
	{
		"phaazon/mind.nvim",
		branch = "v2.2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("mind").setup()
		end,
	},
	{ "rafamadriz/friendly-snippets" },
	{ "ray-x/cmp-treesitter" },
	{ "rhysd/vim-clang-format" },
	{ "simrat39/rust-tools.nvim" },
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{ "sophacles/vim-processing" },
	{ "stephpy/vim-yaml" },
	{ "tpope/vim-repeat" },
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag" },
	{ "ziglang/zig.vim" },
})

vim.cmd([[
  syntax enable
  " colorscheme gruvbox-baby
  " For some reason the current line number wasn't being highlighted properly
  " Pretty sure CursorLineNr is unnecessary
  " hi LineNr guifg=#fabd2f
  " hi LineNrAbove guifg=#7c6f64
  " hi LineNrBelow guifg=#7c6f64
  " hi CursorLineNr guifg=#fabd2f
  colorscheme catppuccin-mocha
]])

