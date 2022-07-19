-- Check this out "https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim"
return require('packer').startup(function(use)
	-- MAYBE: Switch to a single call to use with a list as the parameter
	use { "PotatoesMaster/i3-vim-syntax" }
	use { "Saecki/crates.nvim" }
	use { "arrufat/vala.vim" }
	use { "cespare/vim-toml" }
	use { "christoomey/vim-sort-motion" }
	use { "dstein64/vim-startuptime" }
	use { "ellisonleao/gruvbox.nvim" }
	use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }
	use { "gko/vim-coloresque" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/cmp-cmdline" }
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-nvim-lsp-signature-help" }
	use { "hrsh7th/cmp-path" }
	use { "hrsh7th/cmp-vsnip" }
	use { "hrsh7th/nvim-cmp" }
	use { "hrsh7th/vim-vsnip" }
	use { "hrsh7th/vim-vsnip-integ" }
	use { "jghauser/mkdir.nvim" }
	use { "jose-elias-alvarez/null-ls.nvim" }
	use { "kyazdani42/nvim-web-devicons" }
	use { "kylechui/nvim-surround" }
	use { "lewis6991/gitsigns.nvim" }
	use { "lewis6991/impatient.nvim" }
	use { "mrjones2014/tldr.nvim", requires = { "nvim-telescope/telescope.nvim" } }
	use { "neovim/nvim-lspconfig" }
	use { "numToStr/Comment.nvim" }
	use { "nvim-lua/plenary.nvim" }
	use { "nvim-lua/popup.nvim" }
	use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } }
	use { "nvim-telescope/telescope-fzf-native.nvim", requires = { { "nvim-telescope/telescope.nvim" } },
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" }
	use { "nvim-telescope/telescope-media-files.nvim", requires = { { "nvim-telescope/telescope.nvim" } } }
	use { "nvim-telescope/telescope-symbols.nvim" }
	use { "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { { "nvim-lua/plenary.nvim" } } }
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	use { "onsails/lspkind-nvim" }
	use { "rafamadriz/friendly-snippets" }
	use { "ray-x/cmp-treesitter" }
	use { "rhysd/vim-clang-format" }
	use { "simrat39/rust-tools.nvim" }
	use { "sophacles/vim-processing" }
	use { "stephpy/vim-yaml" }
	use { "tpope/vim-repeat" }
	use { "windwp/nvim-autopairs" }
	use { "windwp/nvim-ts-autotag" }
	use { "ziglang/zig.vim" }
end)

