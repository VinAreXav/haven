return {

  { "mfussenegger/nvim-dap",
  event = "VeryLazy",
   dependencies = {
    {"theHamsta/nvim-dap-virtual-text",
	      opts = {},
		},
    {"rcarriga/nvim-dap-ui",
	    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
	  },
	  config = function()
	  require("dapui").setup()
	  end,
    },
    },
  config = function()
  require("plugins.configs.nvim-dap")
  end,
  },
  
}

