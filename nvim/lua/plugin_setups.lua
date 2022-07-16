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

