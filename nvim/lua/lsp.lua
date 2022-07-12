-- Setup nvim-cmp.
local cmp = require'cmp'
local lspkind = require'lspkind'
require('crates').setup()

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	completion = {
		keyword_length = 2,
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = false, -- do not show text alongside icons
			maxwidth = 64,
			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function (_, vim_item)
				-- Maybe get stuff from the link above?
				return vim_item
			end
		})
	},
	mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		-- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		['<S-Tab>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "buffer" },
		{ name = "path" },
		-- { name = 'treesitter' },
		{ name = "crates" },
		{ name = "nvim_lsp_signature_help" },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
-- 	sources = cmp.config.sources({
-- 		{ name = 'path' }
-- 	}, {
-- 		{ name = 'cmdline' }
-- 	})
-- })

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

--[[
buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
buf_set_keymap('n', '<leader>l', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
--]]

local on_attach = function (_, buf)
	-- The rhs needs to be a string???
	vim.api.nvim_buf_set_keymap(buf, 'n', "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {desc = "Jump to definition"})
	vim.api.nvim_buf_set_keymap(buf, 'n', "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {desc = "Jump to declaration"})
	vim.api.nvim_buf_set_keymap(buf, 'n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>", {desc = "Show hover text"})
	vim.api.nvim_buf_set_keymap(buf, 'n', "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {desc = "Jump to implementation"})
	vim.api.nvim_buf_set_keymap(buf, 'n', "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {desc = "Signature help"})
	vim.api.nvim_buf_set_keymap(buf, 'n', "<Leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {desc = "Show type definition"})
	vim.api.nvim_buf_set_keymap(buf, 'n', "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", {desc = "Rename symbol"})
	vim.api.nvim_buf_set_keymap(buf, 'n', "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {desc = "Show code actions"})
	vim.api.nvim_buf_set_keymap(buf, 'n', "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {desc = "Show references"})
	vim.api.nvim_buf_set_keymap(buf, 'n', "<Leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {desc = "Show line diagnostics"})
	vim.api.nvim_buf_set_keymap(buf, 'n', "<Leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", {desc = "Format file"})
	vim.api.nvim_buf_set_keymap(buf, 'n', "<Leader>T", "<cmd>lua require\'lsp_extensions\'.inlay_hints()<CR>", {desc = "Show inlay hints"})
end

require('lspconfig')['clangd'].setup {
	capabilities = capabilities,
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 300,
	}
}

-- Switch to rust-tools
require('lspconfig')['rust_analyzer'].setup {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			cargo = { allFeatures = true, autoReload = true },
			checkOnSave = { enable = true, command = "clippy" },
		},
	}
}

require('lspconfig')['pyright'].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require('lspconfig')['tsserver'].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require('lspconfig')['bashls'].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

require('lspconfig')['sumneko_lua'].setup {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
		},
	},
}

