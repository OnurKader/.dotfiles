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
		keyword_length = 2,
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
			end
		})
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		-- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", '')
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { 'i', 's' }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", '')
			end
		end, { 'i', 's' }),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	sources = cmp.config.sources({
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "crates" },
		{ name = "nvim_lsp_signature_help" },
		-- { name = 'treesitter' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
-- 	sources = {
-- 		{ name = 'buffer' }
-- 	}
-- })

-- Setup autopairs
local autopairs = require("nvim-autopairs");
local Rule = require("nvim-autopairs.rule")

autopairs.setup({
})

autopairs.add_rule(Rule('(', ')', '*'))
autopairs.add_rule(Rule('{', '}', '*'))
autopairs.add_rule(Rule('[', ']', '*'))
autopairs.add_rule(Rule('"', '"', '*'))
autopairs.add_rule(Rule("'", "'", '*'))

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on(
	"confirm_done",
	cmp_autopairs.on_confirm_done()
)

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
-- 	sources = cmp.config.sources({
-- 		{ name = 'path' }
-- 	}, {
-- 		{ name = 'cmdline' }
-- 	})
-- })

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
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
	vim.api.nvim_buf_set_keymap(buf, 'n', "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Jump to definition" })
	vim.api.nvim_buf_set_keymap(buf, 'n', "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Jump to declaration" })
	vim.api.nvim_buf_set_keymap(buf, 'n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show hover text" })
	vim.api.nvim_buf_set_keymap(buf, 'n', 'Kr', "<cmd>RustHoverActions<CR>", { desc = "Hover actions for rust-tools" })
	vim.api.nvim_buf_set_keymap(buf, 'n', "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>",
		{ desc = "Jump to implementation" })
	vim.api.nvim_buf_set_keymap(buf, 'n', "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature help" })
	vim.api.nvim_buf_set_keymap(buf, 'n', "<Leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>",
		{ desc = "Show type definition" })
	vim.api.nvim_buf_set_keymap(buf, 'n', "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
	vim.api.nvim_buf_set_keymap(buf, 'n', "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>",
		{ desc = "Show code actions" })
	vim.api.nvim_buf_set_keymap(buf, 'n', "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Show references" })
	vim.api.nvim_buf_set_keymap(buf, 'n', "<Leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>",
		{ desc = "Show line diagnostics" })
	vim.api.nvim_buf_set_keymap(buf, 'n', "<Leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<CR>",
		{ desc = "Format file" })
end

local lspconfig = require("lspconfig")

local clangd_capabilities = capabilities
clangd_capabilities.textDocument.semanticHighlighting = true

lspconfig["clangd"].setup {
	capabilities = clangd_capabilities,
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 300,
	},
	cmd = {
		'clangd',
		'--background-index',
		'--pch-storage=memory',
		'--clang-tidy', -- Look at clang-tidy options
		'--suggest-missing-includes',
		'--cross-file-rename',
		'--completion-style=detailed',
	},
	init_options = {
		clangdFileStatus = true,
		usePlaceholders = true,
		completeUnimported = true,
		semanticHighlighting = true,
	},
}

-- Switch to rust-tools
require("rust-tools").setup({
	tools = { -- rust-tools options
		-- automatically set inlay hints (type hints)
		-- There is an issue due to which the hints are not applied on the first
		-- opened file. For now, write to the file to trigger a reapplication of
		-- the hints or just run :RustSetInlayHints.
		-- default: true
		autoSetHints = true,

		-- how to execute terminal commands
		-- options right now: termopen / quickfix
		executor = require("rust-tools/executors").termopen,

		-- callback to execute once rust-analyzer is done initializing the workspace
		-- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
		on_initialized = nil,

		-- These apply to the default RustSetInlayHints command
		inlay_hints = {

			-- Only show inlay hints for the current line
			only_current_line = false,

			-- Event which triggers a refersh of the inlay hints.
			-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
			-- not that this may cause higher CPU usage.
			-- This option is only respected when only_current_line and
			-- autoSetHints both are true.
			only_current_line_autocmd = "CursorHold",

			-- whether to show parameter hints with the inlay hints or not
			-- default: true
			show_parameter_hints = true,

			-- whether to show variable name before type hints with the inlay hints or not
			-- default: false
			show_variable_name = false,

			-- prefix for parameter hints
			-- default: "<-"
			parameter_hints_prefix = "<- ",

			-- prefix for all the other hints (type, chaining)
			-- default: "=>"
			other_hints_prefix = "=> ",

			-- whether to align to the lenght of the longest line in the file
			max_len_align = false,

			-- padding from the left if max_len_align is true
			max_len_align_padding = 1,

			-- whether to align to the extreme right or not
			right_align = false,

			-- padding from the right if right_align is true
			right_align_padding = 7,

			-- The color of the hints
			highlight = "Comment",
		},

		-- options same as lsp hover / vim.lsp.util.open_floating_preview()
		hover_actions = {
			-- the border that is used for the hover window
			-- see vim.api.nvim_open_win()
			border = {
				{ "╭", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╮", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "╯", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╰", "FloatBorder" },
				{ "│", "FloatBorder" },
			},

			-- whether the hover action window gets automatically focused
			-- default: false
			auto_focus = false,
		},

		-- settings for showing the crate graph based on graphviz and the dot
		-- command
		crate_graph = {
			-- Backend used for displaying the graph
			-- see: https://graphviz.org/docs/outputs/
			-- default: x11
			backend = "x11",
			-- where to store the output, nil for no output stored (relative
			-- path from pwd)
			-- default: nil
			output = nil,
			-- true for all crates.io and external crates, false only the local
			-- crates
			-- default: true
			full = true,

			-- List of backends found on: https://graphviz.org/docs/outputs/
			-- Is used for input validation and autocompletion
			-- Last updated: 2021-08-26
			enabled_graphviz_backends = {
				"bmp",
				"cgimage",
				"canon",
				"dot",
				"gv",
				"xdot",
				"xdot1.2",
				"xdot1.4",
				"eps",
				"exr",
				"fig",
				"gd",
				"gd2",
				"gif",
				"gtk",
				"ico",
				"cmap",
				"ismap",
				"imap",
				"cmapx",
				"imap_np",
				"cmapx_np",
				"jpg",
				"jpeg",
				"jpe",
				"jp2",
				"json",
				"json0",
				"dot_json",
				"xdot_json",
				"pdf",
				"pic",
				"pct",
				"pict",
				"plain",
				"plain-ext",
				"png",
				"pov",
				"ps",
				"ps2",
				"psd",
				"sgi",
				"svg",
				"svgz",
				"tga",
				"tiff",
				"tif",
				"tk",
				"vml",
				"vmlz",
				"wbmp",
				"webp",
				"xlib",
				"x11",
			},
		},
	},

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
	server = {
		-- standalone file support
		-- setting it to false may improve startup time
		standalone = true,
		cargo = { allFeatures = true, autoReload = true },
		checkOnSave = { enable = true, command = "clippy" },
		on_attach = on_attach,
	}, -- rust-analyer options
})
-- require("rust-tools.inlay_hints").toggle_inlay_hints()

lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["tsserver"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["bashls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["sumneko_lua"].setup({
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

local nl = require("null-ls")
local nl_builtins = nl.builtins

nl.setup({
	on_attach = on_attach,
	sources = {
		nl_builtins.code_actions.shellcheck,
		nl_builtins.diagnostics.clang_check,
		nl_builtins.diagnostics.cppcheck.with({ "--enable=warning,style,performance,portability,information,missingInclude",
			"--template=gcc", "$FILENAME" }),
		nl_builtins.diagnostics.editorconfig_checker,
		nl_builtins.diagnostics.shellcheck,
		nl_builtins.diagnostics.zsh,
		nl_builtins.formatting.clang_format,
		nl_builtins.formatting.prettier,
		nl_builtins.diagnostics.flake8,
		nl_builtins.formatting.black,
		nl_builtins.formatting.rustfmt,
		nl_builtins.formatting.shfmt,
		nl_builtins.formatting.stylua
	},
})

