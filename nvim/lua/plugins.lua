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
-- Also this https://github.com/nvim-telescope/telescope-file-browser.nvim
require("lazy").setup({
	{ "NvChad/nvim-colorizer.lua",    event = { "BufReadPost", "BufNewFile" } },
	{ "Pocco81/true-zen.nvim",        cmd = { "TZAtaraxis", "TZFocus", "TZMinimalist", "TZNarrow" } },
	{ "PotatoesMaster/i3-vim-syntax", ft = "i3" },
	{ "Saecki/crates.nvim",           event = "BufRead Cargo.toml" },
	{ "arrufat/vala.vim",             ft = "vala" },
	{
		"brenton-leighton/multiple-cursors.nvim",
		version = "*",
		opts = {
			pre_hook = function()
				require('nvim-autopairs').disable()
			end,
			post_hook = function()
				require('nvim-autopairs').enable()
			end,
		},
		keys = {
			{ "<C-j>",         "<Cmd>MultipleCursorsAddDown<CR>" },
			{ "<C-Down>",      "<Cmd>MultipleCursorsAddDown<CR>",        mode = { "n", "i" } },
			{ "<C-k>",         "<Cmd>MultipleCursorsAddUp<CR>" },
			{ "<C-Up>",        "<Cmd>MultipleCursorsAddUp<CR>",          mode = { "n", "i" } },
			{ "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" } },
			{ "<Leader>a",     "<Cmd>MultipleCursorsAddMatches<CR>",     mode = { "n", "x" } },
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 690,
		lazy = false,
	},
	{ "cespare/vim-toml",                ft = "toml" },
	{
		"christoomey/vim-sort-motion",
		keys = {
			{ "gs", mode = { "n", "x", "o" }, desc = "Sort lines or a comma separated list" },
		},
	},
	{ "dstein64/vim-startuptime",        cmd = "StartupTime" },
	{ "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPost", "BufNewFile" },
	},
	{ "ggandor/leap.nvim",                   event = { "BufReadPost", "BufNewFile" } },
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "habamax/vim-godot",                   ft = "godot" },
	{ "hrsh7th/cmp-buffer",                  event = "InsertEnter" },
	{ "hrsh7th/cmp-cmdline",                 event = "InsertEnter" },
	{ "hrsh7th/cmp-nvim-lsp",                event = "InsertEnter" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help", event = "InsertEnter" },
	{ "hrsh7th/cmp-nvim-lua",                event = "InsertEnter" },
	{ "hrsh7th/cmp-path",                    event = "InsertEnter" },
	{ "hrsh7th/cmp-vsnip",                   event = "InsertEnter" },
	{ "hrsh7th/nvim-cmp",                    event = "InsertEnter" },
	{ "hrsh7th/vim-vsnip",                   event = "InsertEnter" },
	{ "hrsh7th/vim-vsnip-integ",             event = "InsertEnter" },
	{ "imsnif/kdl.vim",                      ft = "kdl" },
	{ "jghauser/mkdir.nvim",                 event = "VeryLazy" },
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"gbprod/none-ls-shellcheck.nvim",
		},
	},
	{ "kaarmu/typst.vim",                ft = "typst" },
	{ "krady21/compiler-explorer.nvim",  dependencies = { "nvim-lua/plenary.nvim" }, cmd = "CECompile" },
	{ "kylechui/nvim-surround",          event = "VeryLazy" },
	{ "lewis6991/gitsigns.nvim",         event = "VeryLazy" },
	{ "max397574/better-escape.nvim",    event = "VeryLazy" },
	{ "michaeljsmith/vim-indent-object", event = { "BufReadPost", "BufNewFile" } },
	{ "neovim/nvim-lspconfig",           event = { "BufReadPost", "BufNewFile" } },
	{ "numToStr/Comment.nvim",           event = { "BufReadPost", "BufNewFile" } },
	{ "nvim-lua/plenary.nvim",           lazy = true },
	{
		"nvim-neorg/neorg",
		lazy = true,
		ft = "norg",
		cmd = "Neorg",
		dependencies = { "luarocks.nvim" },
	},
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "nvim-lualine/lualine.nvim",   dependencies = { "nvim-tree/nvim-web-devicons" }, event = "VeryLazy" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		dependencies = { { "nvim-telescope/telescope.nvim" } },
		build =
		"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		event = "VeryLazy",
	},
	{
		"nvim-telescope/telescope-media-files.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		event = "VeryLazy",
	},
	{ "nvim-telescope/telescope-symbols.nvim", event = "VeryLazy" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		tag = "0.1.8",
		event = "VeryLazy",
	},
	{ "nvim-treesitter/nvim-treesitter",       event = { "BufReadPost", "BufNewFile" }, build = ":TSUpdate" },
	{ "onsails/lspkind-nvim",                  event = "VeryLazy" },
	{
		"phaazon/mind.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "MindOpenMain",
	},
	{ "rafamadriz/friendly-snippets", event = "InsertEnter" },
	{ "ray-x/cmp-treesitter",         event = "InsertEnter" },
	{ "rhysd/vim-clang-format",       cmd = "ClangFormat" },
	{ "simrat39/rust-tools.nvim",     ft = "rust" },
	{ "sindrets/diffview.nvim",       dependencies = "nvim-lua/plenary.nvim", event = "VeryLazy" },
	{ "sophacles/vim-processing",     ft = "processing" },
	{ "stephpy/vim-yaml",             ft = "yaml" },
	{ "tpope/vim-repeat",             event = "VeryLazy" },
	{ "vhyrro/luarocks.nvim",         priority = 1000,                        config = true },
	{ "windwp/nvim-autopairs", },
	{ "windwp/nvim-ts-autotag",       event = "InsertEnter" },
	{ "ziglang/zig.vim",              ft = "zig" },
})

vim.cmd([[
  syntax enable
  " For some reason the current line number wasn't being highlighted properly
  " Pretty sure CursorLineNr is unnecessary
  " hi LineNr guifg=#fabd2f
  " hi LineNrAbove guifg=#7c6f64
  " hi LineNrBelow guifg=#7c6f64
  " hi CursorLineNr guifg=#fabd2f
  colorscheme catppuccin-mocha
]])

