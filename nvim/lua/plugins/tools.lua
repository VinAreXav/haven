return { 
		--- fzf, gitsigns, comment, fterm, htop, nvim-lint, render-markdown, ron, decisive, nvim-ide, kitty-scrollback, obsidian

		{	"ibhagwan/fzf-lua",
    cmd = "FzfLua",  -- allows :FzfLua to trigger lazy-loading
    config = function(_, opts)
    require("fzf-lua").setup(opts)
	require("plugins.configs.fzf-lua")
  end,
  },

		{ 	"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = function()
		require("plugins.configs.gitsigns")
end,
		},
		
		{ 	"numToStr/Comment.nvim",
		config = function()
		require("plugins.configs.comment")
		end,
		},

		{ 	"numToStr/FTerm.nvim",
		event = "VeryLazy",
		config = function()
		local fterm = require("FTerm")
		
		_G.htop = fterm:new({
		ft = 'fterm_htop',
		cmd = "htop",
		dimensions = {
          height = 0.9,
          width = 0.9,
		},
							})
		end,		
},
{
  "mfussenegger/nvim-lint",
  event = { "BufWritePost", "BufReadPost", "InsertLeave" }, -- typical triggers
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      fish = { "fish" },
      lua = { "luac" },
      python = { "ruff" },
      sh = { "bash" },
      c = { "cppcheck" },
      rust = { "clippy" },
      css = { "stylelint" },
      html = { "htmlhint" },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
},

		{ 	"MeanderingProgrammer/render-markdown.nvim",
		config = function()
				require("plugins.configs.render-markdown")
		end,
		},

		{ 	"emmanueltouzery/decisive.nvim",
		config= function()
				    require('decisive').setup{}
		end,
		lazy=true,
		ft = {'csv'},
		
		keys = {
		{ '<leader>cca', ":lua require('decisive').align_csv({})<cr>", { silent = true }, desc = "Align CSV", mode = 'n' },
		{ '<leader>ccA', ":lua require('decisive').align_csv_clear({})<cr>", { silent = true }, desc = "Align CSV clear", mode = 'n' },
		{ '[c', ":lua require('decisive').align_csv_prev_col()<cr>", { silent = true }, desc = "Align CSV prev col", mode = 'n' },
		{ ']c', ":lua require('decisive').align_csv_next_col()<cr>", { silent = true }, desc = "Align CSV next col", mode = 'n' },
				}
		},
  
		{ "ron-rs/ron.vim",
		config = function()
				require('ron').setup{}
		end,
		},

		{ "ldelossa/nvim-ide",
		lazy = "VeryLazy",
		config = function()
				require("plugins.configs.nvim-ide")
		end,
		},

		{ "mikesmithgh/kitty-scrollback.nvim",
				enabled = true,
				lazy = true,
		cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth', 'KittyScrollbackGenerateCommandLineEditing' },
				event = { 'User KittyScrollbackLaunch' },
				config = function()
				require('kitty-scrollback').setup()
    end,
		},

		{ "obsidian-nvim/obsidian.nvim", 
		version = "*", 
		ft = "markdown",
		dependencies = {
          "nvim-lua/plenary.nvim", },
		
		lazy = false,
		config = function()
		require("plugins.configs.obsidian")
		end,
		},
		
		{
		 "oflisback/obsidian-bridge.nvim",	
		lazy = false,
		dependencies = {
		"nvim-lua/plenary.nvim",
				},
		config = function()
		require("plugins.configs.obsidian-bridge")
		end,
		},
}

