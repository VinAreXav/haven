-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "filetype",
  },
  view = {
    width = 25,
  },
  renderer = {
    group_empty = true,

	icons = {
		show = {
		file = true,
		folder = true,
		folder_arrow = true,
		git = true,
		},
	},
  },
  
  filters = {
    dotfiles = false,
  },
sync_root_with_cwd = true, --fix to open cwd with tree
	respect_buf_cwd = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
		update_root = true,
	},
})

