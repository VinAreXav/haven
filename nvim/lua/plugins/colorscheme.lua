return { 
{ 
		{"RedsXDD/neopywal.nvim",
		name = "neopywal",
		lazy = false,
		priority = 1000,
		opts = {
				transparent_background = true,
				enable_bufferline = true,
				plugins = {
						lazy = true,
						nvim_cmp = true,
						lazygit = true,
						notify = false
				}
		},
		config = function(_, opts)
        require("neopywal").setup(otps)
		vim.cmd.colorscheme("neopywal")
				end,
						},
		}
}

