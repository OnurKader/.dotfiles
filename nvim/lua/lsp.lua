-- Setup nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")
require("crates").setup()

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
		keyword_length = 1,
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = false, -- do not show text alongside icons
			maxwidth = 64,
			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(_, vim_item)
				-- Maybe get stuff from the link above?
				return vim_item
			end,
		}),
	},
	mapping = {
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
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
		["<C-j>"] = cmp.mapping(function(fallback)
			if vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "<C-j>")
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lua" },
		{ name = "vsnip" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "crates" },
		{ name = "nvim_lsp_signature_help" },
		-- { name = 'treesitter' },
	}),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
-- 	sources = {
-- 		{ name = 'buffer' }
-- 	}
-- })

-- Setup autopairs
local autopairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

autopairs.setup({})

autopairs.add_rule(Rule("(", ")", "*"))
autopairs.add_rule(Rule("{", "}", "*"))
autopairs.add_rule(Rule("[", "]", "*"))
autopairs.add_rule(Rule('"', '"', "*"))
autopairs.add_rule(Rule("'", "'", "*"))

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
-- 	sources = cmp.config.sources({
-- 		{ name = 'path' }
-- 	}, {
-- 		{ name = 'cmdline' }
-- 	})
-- })

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

--[[
buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
buf_set_keymap('n', '<leader>l', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
--]]

-- https://github.com/neovim/nvim-lspconfig
-- Switch these to vim.keymap.set('n', <keys>, lua function, buf_opts)
local on_attach = function(_, buf)
	-- The rhs needs to be a string???
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"gd",
		"<cmd>lua vim.lsp.buf.definition()<CR>",
		{ desc = "Jump to definition" }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"gD",
		"<cmd>lua vim.lsp.buf.declaration()<CR>",
		{ desc = "Jump to declaration" }
	)
	vim.api.nvim_buf_set_keymap(buf, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show hover text" })
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"gi",
		"<cmd>lua vim.lsp.buf.implementation()<CR>",
		{ desc = "Jump to implementation" }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"<C-k>",
		"<cmd>lua vim.lsp.buf.signature_help()<CR>",
		{ desc = "Signature help" }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"<Leader>D",
		"<cmd>lua vim.lsp.buf.type_definition()<CR>",
		{ desc = "Show type definition" }
	)
	vim.api.nvim_buf_set_keymap(buf, "n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"<Leader>ca",
		"<cmd>lua vim.lsp.buf.code_action()<CR>",
		{ desc = "Show code actions" }
	)
	vim.api.nvim_buf_set_keymap(buf, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Show references" })
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"<Leader>e",
		"<cmd>lua vim.diagnostic.open_float()<CR>",
		{ desc = "Show line diagnostics" }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"<Leader>f",
		"<cmd>lua vim.lsp.buf.format({async = true})<CR>",
		{ desc = "Format file" }
	)
end

local lspconfig = require("lspconfig")

local clangd_capabilities = capabilities
clangd_capabilities.textDocument.semanticHighlighting = true

lspconfig["clangd"].setup({
	capabilities = clangd_capabilities,
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 200,
	},
	cmd = {
		"clangd",
		"--background-index",
		"--pch-storage=memory",
		"--clang-tidy", -- Look at clang-tidy options
		"--suggest-missing-includes",
		"--header-insertion=iwyu",
		"--header-insertion-decorators",
		"--cross-file-rename",
		"--completion-style=detailed",
		"-j=14",
	},
	init_options = {
		clangdFileStatus = true,
		usePlaceholders = true,
		completeUnimported = true,
		semanticHighlighting = true,
	},
})

lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["ts_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- lspconfig["bashls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
		},
	},
})

lspconfig["gdscript"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["vls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["ruff"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

local nl = require("null-ls")
local nl_builtins = nl.builtins

--flake8, rustfmt
local shchk = require("none-ls-shellcheck")

nl.setup({
	on_attach = on_attach,
	sources = {
		shchk.diagnostics,
		shchk.code_actions,
		-- nl_builtins.diagnostics.clang_check,
		-- So annoying, it's checking headers, and reporting them in the source file but obviously the location is wrong
		-- nl_builtins.diagnostics.cppcheck.with({ "-j4", "--std=c++23", "--suppress='*:source/*.h'", "--suppress='*:source/*.hpp'", "--suppress='*:src/*.hpp'", "--suppress='*:src/*.h'", "--suppress='*:**/*.hpp'", "--suppress='*:**/*.h'", "--suppress='*:include/*.h'", "--suppress='*:include/*.hpp'", "--suppress='*:*.hpp'", "--suppress='*:*.h'", "--enable=warning,style,performance,portability,information,missingInclude",
		-- 	"--template=gcc", "$FILENAME" }),
		nl_builtins.diagnostics.zsh.with({ method = nl.methods.DIAGNOSTICS_ON_SAVE }),
		nl_builtins.formatting.clang_format,
		nl_builtins.formatting.prettier,
		nl_builtins.formatting.black,
		nl_builtins.formatting.shfmt,
		nl_builtins.formatting.stylua,
	},
})

