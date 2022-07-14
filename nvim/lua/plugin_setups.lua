require("nvim-web-devicons").setup({
	default = true;
})

require("nvim-surround").setup()

require("gitsigns").setup()

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key"
			}
		}
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
		},
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "avi", "jpeg", "jpg", "mkv", "mp4", "pdf", "png", "webm", "webp" },
			-- find_cmd = "rg" -- find command (defaults to `fd`)
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("media_files")

