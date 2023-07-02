require("nvim-web-devicons").setup({
	default = true,
})

require("nvim-surround").setup()

require("gitsigns").setup()

require("Comment").setup({
	ignore = "^%s*$",
})

require("tldr").setup({
	-- the shell command to use
	tldr_command = "tldr",
	-- a string of extra arguments to pass to `tldr`, e.g. tldr_args = '--color always'
	tldr_args = "--color=always",
})

local telescope = require("telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key",
			},
		},
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "-H", "--strip-cwd-prefix" },
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "avi", "jpeg", "jpg", "mkv", "mp4", "pdf", "png", "webm", "webp" },
			-- find_cmd = "rg" -- find command (defaults to `fd`)
		},
		tldr = {},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("media_files")

-- Add a spell visual for lualine (From https://github.com/nvim-lualine/lualine.nvim/issues/487#issuecomment-1345625242)
local function spell()
	if vim.wo.spell == true then
		return "[" .. vim.bo.spelllang .. "]" -- MAYBE: Change the spelllang to just the string "SPELL"
	end
	return ""
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto", --"gruvbox-material",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { spell, "filetype", "encoding", "fileformat" },
		lualine_y = {},
		lualine_z = { "location", "progress" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})

-- TODO: asd
-- NOTE: asd
-- WARN: asd
-- PERF: asd
require("todo-comments").setup({
	signs = true, -- show icons in the signs column
	sign_priority = 8, -- sign priority
	-- keywords recognized as todo comments
	keywords = {
		FIX = {
			icon = " ", -- icon used for the sign, and in search results
			color = "error", -- can be a hex color, or a named color (see below)
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
			-- signs = false, -- configure signs for some keywords individually
		},
		TODO = { icon = " ", color = "info" },
		HACK = { icon = " ", color = "warning" },
		WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
		PERF = { icon = "󰅒 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = "󰍨 ", color = "hint", alt = { "INFO", "MAYBE" } },
	},
	merge_keywords = true, -- when true, custom keywords will be merged with the defaults
	-- highlighting of the line containing the todo comment
	-- * before: highlights before the keyword (typically comment characters)
	-- * keyword: highlights of the keyword
	-- * after: highlights after the keyword (todo text)
	highlight = {
		before = "", -- "fg" or "bg" or empty
		keyword = "fg", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
		after = "", -- "fg" or "bg" or empty
		pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
		comments_only = true, -- uses treesitter to match keywords in comments only
		max_line_len = 192, -- ignore lines longer than this
		exclude = {}, -- list of file types to exclude highlighting
	},
	-- list of named colors where we try to extract the guifg from the
	-- list of hilight groups or use the hex color if hl not found as a fallback
	colors = {
		error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
		warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
		info = { "DiagnosticInfo", "#2563EB" },
		hint = { "DiagnosticHint", "#10B981" },
		default = { "Identifier", "#7C3AED" },
	},
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
		},
		-- regex that will be used to match keywords.
		-- don't replace the (KEYWORDS) placeholder
		pattern = [[\b(KEYWORDS):]], -- ripgrep regex
		-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	},
})

require("true-zen").setup({
	modes = {
		-- configurations per mode
		ataraxis = {
			shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
			backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
			minimum_writing_area = {
				-- minimum size of main window
				width = 70,
				height = 44,
			},
			quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
			padding = {
				-- padding windows
				left = 52,
				right = 52,
				top = 0,
				bottom = 0,
			},
			callbacks = {
				-- run functions when opening/closing Ataraxis mode
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil,
			},
		},
		minimalist = {
			ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
			options = {
				-- options to be disabled when entering Minimalist mode
				number = false,
				relativenumber = false,
				showtabline = 0,
				signcolumn = "no",
				statusline = "",
				cmdheight = 1,
				laststatus = 0,
				showcmd = false,
				showmode = false,
				ruler = false,
				numberwidth = 1,
			},
			callbacks = {
				-- run functions when opening/closing Minimalist mode
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil,
			},
		},
		narrow = {
			--- change the style of the fold lines. Set it to:
			--- `informative`: to get nice pre-baked folds
			--- `invisible`: hide them
			--- function() end: pass a custom func with your fold lines. See :h foldtext
			folds_style = "informative",
			run_ataraxis = true, -- display narrowed text in a Ataraxis session
			callbacks = {
				-- run functions when opening/closing Narrow mode
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil,
			},
		},
		focus = {
			callbacks = {
				-- run functions when opening/closing Focus mode
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil,
			},
		},
	},
	integrations = {
		tmux = false, -- hide tmux status bar in (minimalist, ataraxis)
		kitty = {
			-- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
			enabled = false,
			font = "+3",
		},
		twilight = false, -- enable twilight (ataraxis)
		lualine = true, -- hide nvim-lualine (ataraxis)
	},
})

require("colorizer").setup({
	filetypes = { "*" },
	user_default_options = {
		RGB = true, -- #RGB hex codes
		RRGGBB = true, -- #RRGGBB hex codes
		names = true, -- "Name" codes like Blue or blue
		RRGGBBAA = false, -- #RRGGBBAA hex codes
		AARRGGBB = false, -- 0xAARRGGBB hex codes
		rgb_fn = false, -- CSS rgb() and rgba() functions
		hsl_fn = false, -- CSS hsl() and hsla() functions
		css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
		-- Available modes for `mode`: foreground, background,  virtualtext
		mode = "background", -- Set the display mode.
		-- Available methods are false / true / "normal" / "lsp" / "both"
		-- True is same as normal
		tailwind = false, -- Enable tailwind colors
		virtualtext = "■",
	},
	-- all the sub-options of filetypes apply to buftypes
	buftypes = {},
})

require("diffview").setup()

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
	dashboard.button("i", " " .. " New Buffer", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
	dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
	dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
	dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

dashboard.section.header.val = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}

alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
	autocmd FileType alpha setlocal nonumber
	autocmd FileType alpha setlocal norelativenumber
	autocmd FileType alpha setlocal statuscolumn=""
]])

