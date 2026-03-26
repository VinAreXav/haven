return {
		
		{ "neovim/nvim-lspconfig",
			 dependencies = {
		"mason.nvim",
{"mason-org/mason-lspconfig.nvim", config = function() end }, },
		config = function()
				require("plugins.configs.lspconfig")
		end,
		},
		
		{ "hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
	config = function()
			require("plugins.configs.cmp")
	end,
  },
},

		{ 	"L3MON4D3/LuaSnip",
		lazy = true,
		dependencies = {
		{	"rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
      end,
    },
  },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
		},		
  },

		{ 	"saadparwaiz1/cmp_luasnip",	opts = nil },		


		{ 	"folke/lazydev.nvim",
		config = function()
		require("plugins.configs.lazydev")
end,
},
		{ 	"mason-org/mason.nvim",
		lazy = false,
		config = function()
				require("plugins.configs.mason")
		end,
				opts = {
				ensure_installed = {
				"stylua",
				"shfmt", 		 },
						},
		},	
		{ "mason-org/mason-lspconfig.nvim", config = function() end },
}
