
-- enjoy :D
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
		{ "catppuccin/nvim", name = "catppuccin" },
		{ "ellisonleao/gruvbox.nvim", name = "gruvbox" },
		{ "uZer/pywal16.nvim", name = "pywal16" },

-- LSP 
		{ "neovim/nvim-lspconfig" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-buffer"},
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },

-- UI
		{ "nvim-lualine/lualine.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		{ "lewis6991/gitsigns.nvim" },
		{ "numToStr/Comment.nvim" },
		{ "ibhagwan/fzf-lua" },
		{ "folke/which-key.nvim" },
		{ "romgrk/barbar.nvim" },
		{ "mfussenegger/nvim-lint" },
		{ "windwp/nvim-autopairs" },
		{ "norcalli/nvim-colorizer.lua" },
		{ "numToStr/FTerm.nvim" },
		{ "ron-rs/ron.vim" },
		{ "MeanderingProgrammer/render-markdown.nvim" },
		{ "emmanueltouzery/decisive.nvim" },
		{ "folke/twilight.nvim" },
		{ "obsidian-nvim/obsidian.nvim", version = "*",  ft = "markdown"},
		{ "ldelossa/nvim-ide" },
		{ "folke/snacks.nvim", ---@type snacks.Config 
		},
		{ "mason-org/mason.nvim" },
		{ "mfussenegger/nvim-dap" },
		{ "theHamsta/nvim-dap-virtual-text" },
		{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
		{ "folke/lazydev.nvim"},
		{ "nvim-tree/nvim-tree.lua"},
		{ "goolord/alpha-nvim", dependencies = {"nvim-tree/nvim-web-devicons"} }

})

-- move config and plugin config to alternate files
require("config.theme")
require("config.mappings")
require("config.options")
require("config.autocmd")

require("plugins.autopairs")
require("plugins.barbar")
require("plugins.colorizer")
require("plugins.colorscheme")
require("plugins.comment")
require("plugins.fterm")
require("plugins.fzf-lua")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.nvim-lint")
require("plugins.render-markdown")
require("plugins.treesitter")
require("plugins.twilight")
require("plugins.which-key")
require("plugins.cmp")
require("plugins.obsidian")
require("plugins.nvim-ide")
require("plugins.snacks")
require("plugins.mason")
require("plugins.nvim-dap")
require("plugins.nvim-dap-virtual-text")
require("plugins.nvim-dap-ui")
require("plugins.lazydev")
require("plugins.nvim-tree")
require("plugins.alpha-nvim")


vim.lsp.enable('pyright')

load_theme()
