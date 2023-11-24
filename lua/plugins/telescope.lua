local mapkey = require("util.keymapper").mapkey

local telescope_file_browser = {
  "nvim-telescope/telescope-file-browser.nvim",
  lazy = false,
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
}

local config = function()
	local telescope = require("telescope")
  local file_browser = telescope.extensions.file_browser
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
          ["<C-q>"] = "close",
				},
        n = {
          ["q"] = "close",
          ["a"] = file_browser.actions.create
        },
			},
		},
	})

  telescope.load_extension "file_browser"
end

local telescope = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = {
		mapkey("<leader>fk", "Telescope keymaps", "n"),
		mapkey("<leader>fh", "Telescope help_tags", "n"),
		mapkey("<leader>ff", "Telescope find_files", "n"),
		mapkey("<leader>fg", "Telescope live_grep", "n"),
		mapkey("<leader>fx", "Telescope buffers", "n"),
    mapkey("<leader>fb", "Telescope file_browser", "n"),
	},
}

return {
  telescope,
  telescope_file_browser,
}
