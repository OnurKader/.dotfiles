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
	{ "NvChad/nvim-colorizer.lua", event = "VeryLazy" },
	{ "Pocco81/true-zen.nvim", event = "VeryLazy" },
	{ "PotatoesMaster/i3-vim-syntax", event = "VeryLazy" },
	{ "Saecki/crates.nvim", event = "VeryLazy" },
	{ "arrufat/vala.vim", event = "VeryLazy" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 421,
		lazy = false,
	},
	{ "cespare/vim-toml", event = "VeryLazy" },
	{ "christoomey/vim-sort-motion", keys = "gs" },
	{ "dstein64/vim-startuptime", event = "VeryLazy" },
	{ "eandrju/cellular-automaton.nvim", event = "VeryLazy" },
	{ "ellisonleao/gruvbox.nvim", priority = 420, lazy = false },
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "habamax/vim-godot", event = "VeryLazy" },
	{ "hrsh7th/cmp-buffer", event = "InsertEnter" },
	{ "hrsh7th/cmp-cmdline", event = "InsertEnter" },
	{ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help", event = "InsertEnter" },
	{ "hrsh7th/cmp-nvim-lua", event = "InsertEnter" },
	{ "hrsh7th/cmp-path", event = "InsertEnter" },
	{ "hrsh7th/cmp-vsnip", event = "InsertEnter" },
	{ "hrsh7th/nvim-cmp", event = "InsertEnter" },
	{ "hrsh7th/vim-vsnip", event = "InsertEnter" },
	{ "hrsh7th/vim-vsnip-integ", event = "InsertEnter" },
	{ "imsnif/kdl.vim", event = "VeryLazy" },
	{ "jghauser/mkdir.nvim", event = "VeryLazy" },
	{ "jose-elias-alvarez/null-ls.nvim", event = "VeryLazy" },
	{ "krady21/compiler-explorer.nvim", dependencies = { "nvim-lua/plenary.nvim" }, event = "VeryLazy" },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "kylechui/nvim-surround", event = "VeryLazy" },
	{ "lewis6991/gitsigns.nvim" },
	{ "luisiacc/gruvbox-baby" },
	{ "mrjones2014/tldr.nvim", dependencies = { "nvim-telescope/telescope.nvim" }, event = "VeryLazy" },
	{ "neovim/nvim-lspconfig" },
	{ "numToStr/Comment.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-lua/popup.nvim" },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		dependencies = { { "nvim-telescope/telescope.nvim" } },
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{ "nvim-telescope/telescope-media-files.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },
	{ "nvim-telescope/telescope-symbols.nvim" },
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, tag = "0.1.2" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		"kaarmu/typst.vim",
		ft = "typst",
	},
	{ "onsails/lspkind-nvim", event = "VeryLazy" },
	{
		"phaazon/mind.nvim",
		branch = "v2.2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("mind").setup()
		end,
	},
	{ "rafamadriz/friendly-snippets", event = "InsertEnter" },
	{ "ray-x/cmp-treesitter", event = "InsertEnter" },
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

