return { 
{ 
		{"RedsXDD/neopywal.nvim",
		name = "neopywal",
		lazy = false,
		priority = 1000,
		opts = {
				notify = "none",
				transparent_background = true,
				enable_bufferline = true,
				plugins = {
						lazy = true,
						nvim_cmp = true,
						lazygit = true,
				}
		},
		config = function(_, opts)
        require("neopywal").setup(otps)
		vim.cmd.colorscheme("neopywal-light")
				end,
						},
		}
}

