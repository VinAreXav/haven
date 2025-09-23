require("lazydev").setup({
  runtime = vim.env.VIMRUNTIME,
  library = {},
  integrations = {
    lspconfig = true,
    cmp = true,
    coq = false,
  },
  enabled = function(root_dir)
    return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
  end,
})

