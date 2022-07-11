-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use {"PotatoesMaster/i3-vim-syntax"}
	use {"Saecki/crates.nvim"}
	use {"airblade/vim-gitgutter"}
	use {"arrufat/vala.vim"}
	use {"cespare/vim-toml"}
	use {"christoomey/vim-sort-motion"}
	use {"ctrlpvim/ctrlp.vim"}
	use {"gko/vim-coloresque"}
	use {"hrsh7th/cmp-buffer"}
	use {"hrsh7th/cmp-cmdline"}
	use {"hrsh7th/cmp-nvim-lsp"}
	use {"hrsh7th/cmp-path"}
	use {"hrsh7th/cmp-vsnip"}
	use {"hrsh7th/nvim-cmp"}
	use {"hrsh7th/vim-vsnip"}
	use {"hrsh7th/vim-vsnip-integ"}
	use {"jose-elias-alvarez/null-ls.nvim"}
	use {"neovim/nvim-lspconfig"}
	use {"nvim-lua/lsp_extensions.nvim"}
	use {"nvim-lua/plenary.nvim"}
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
	use {"onsails/lspkind-nvim"}
	use {"rafamadriz/friendly-snippets"}
	use {"ray-x/cmp-treesitter"}
	use {"rhysd/vim-clang-format"}
	use {"sjl/badwolf"}
	use {"sophacles/vim-processing"}
	use {"tpope/vim-commentary"}
	use {"tpope/vim-repeat"}
	use {"tpope/vim-surround"}
	use {"tweekmonster/startuptime.vim"}
	use {"vim-airline/vim-airline"}
	use {"vim-airline/vim-airline-themes"}
	use {"ziglang/zig.vim"}
end)

