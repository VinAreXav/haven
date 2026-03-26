return {
 -- lualine, web-debicons, treesitter, barbar, which-key, twilight, snacks, alpha, tree, colorizer
		{ 	"nvim-lualine/lualine.nvim",
		  event = "VeryLazy",
		  config = function()
				 require("lualine").setup({}) 
				 require("plugins.configs.lualine")
		  end,
		},

		{ "nvim-tree/nvim-web-devicons" },
		{'brenoprata10/nvim-highlight-colors',
				lazy = false,
				config = function()
						require("plugins.configs.nvim-hightlight-colors")
				end,
		},
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", 
		event = "VeryLazy",
		config = function()
		require("plugins.configs.treesitter")
		end,
		},
		
		{ 	'akinsho/bufferline.nvim', 
		version = "*", dependencies = 'nvim-tree/nvim-web-devicons',
		  event = "VeryLazy", 
		  config = function()
		require("plugins.configs.bufferline")
		  end,
		},
		
		{	"folke/which-key.nvim",
		 event = "VeryLazy",
		  config = function()
      require("which-key").setup({})
      require("plugins.configs.which-key")  -- load your custom mappings
    end,
		},

		{ 	"folke/twilight.nvim",
		event = "VeryLazy",
		config = function()
				require("plugins.configs.twilight")
		end,
		},

		{ 	"folke/snacks.nvim",
		event = "VimEnter",
		priority = 1000,
		 config = function()
				 require("plugins.configs.snacks")
		 end,
		},  
		
		{   "nvim-tree/nvim-tree.lua",
				lazy = false,
				config = function()
						require("plugins.configs.nvim-tree")
				end,
		},

		{	"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
		require('plugins.configs.autopairs')
		end,
		},
		{			
				"3rd/image.nvim",
				build = false,				
				opts = {
						processor = "magick_cli",
				}
		},
}

