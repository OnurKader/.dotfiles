return require('packer').startup(function(use)
	-- use { "airblade/vim-gitgutter" }
	-- use { "folke/which-key.nvim", config = function() require("which-key").setup() end }
	-- use { "tpope/vim-surround" }
	use { "PotatoesMaster/i3-vim-syntax" }
	use { "Saecki/crates.nvim" }
	use { "arrufat/vala.vim" }
	use { "cespare/vim-toml" }
	use { "christoomey/vim-sort-motion" }
	use { "ctrlpvim/ctrlp.vim" }
	use { "ellisonleao/gruvbox.nvim" }
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
	use { "jose-elias-alvarez/null-ls.nvim" }
	use { "kyazdani42/nvim-web-devicons" }
	use { "kylechui/nvim-surround", config = function() require("nvim-surround").setup() end }
	use { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end }
	use { "neovim/nvim-lspconfig" }
	use { "nvim-lua/lsp_extensions.nvim" }
	use { "nvim-lua/plenary.nvim" }
	use { "nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" }
	use { "nvim-telescope/telescope.nvim", tag = "0.1.0" }
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	use { "onsails/lspkind-nvim" }
	use { "rafamadriz/friendly-snippets" }
	use { "ray-x/cmp-treesitter" }
	use { "rhysd/vim-clang-format" }
	use { "sjl/badwolf" }
	use { "sophacles/vim-processing" }
	use { "tpope/vim-commentary" }
	use { "tpope/vim-repeat" }
	use { "tweekmonster/startuptime.vim" }
	use { "vim-airline/vim-airline" }
	use { "vim-airline/vim-airline-themes" }
	use { "windwp/nvim-autopairs" }
	use { "windwp/nvim-ts-autotag" }
	use { "ziglang/zig.vim" }
end)
