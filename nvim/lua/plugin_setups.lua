require("nvim-web-devicons").setup({
	default = true;
})

require("nvim-surround").setup()

require("gitsigns").setup()

require("Comment").setup({
	ignore = "^%s*$"
})

require("tldr").setup({
	-- the shell command to use
	tldr_command = "tldr",
	-- a string of extra arguments to pass to `tldr`, e.g. tldr_args = '--color always'
	tldr_args = "--color=always"
})

local telescope = require("telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key"
			}
		}
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case"
		},
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "avi", "jpeg", "jpg", "mkv", "mp4", "pdf", "png", "webm", "webp" }
			-- find_cmd = "rg" -- find command (defaults to `fd`)
		},
		tldr = {

		}
	},
})

telescope.load_extension("fzf")
telescope.load_extension("media_files")

-- FIXME: SPELL option doesn't show in the statusline
require("lualine").setup {
	options = {
		icons_enabled = true,
		theme = "gruvbox-material", -- "auto"
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "filetype", "encoding", "fileformat" },
		lualine_y = {},
		lualine_z = { "location", "progress" }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}

