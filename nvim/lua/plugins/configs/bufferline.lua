local bufferline = require('bufferline')
require("bufferline").setup{
		options = { 
				mode = "bufferline",
				style_preset = bufferline.style_preset.default,
				numbers = "none",
				close_command = "bdelete! %d",
				indicator = {
						style = 'none',
				},
				modified_icon = ':3',
				max_name_length = 15,
				max_prefix_length = 12,
				truncate_names = true,
				tab_size = 15,
				diagnostics = "nvim_lsp",
				offsets = {
						{
								filetype = "NvimTree",
								text = "File Explorer",
								text_align = "center",
								separator = true
						}
				},
				show_buffer_icons = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				separator_style = "slant",
				auto_toggle_bufferline = true,
				groups = {
						items = {
				require('bufferline.groups').builtin.pinned:with({ icon = "󰐃 " })
						}
				}
		},



highlights = require("neopywal.theme.plugins.bufferline").setup()
}
