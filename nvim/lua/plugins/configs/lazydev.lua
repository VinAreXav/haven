vim.lsp.config("lazydev"){
  runtime = vim.env.VIMRUNTIME,
    ft = 'lua',
  cmd = 'LazyDev',
  library = {},
  { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      { path = 'snacks.nvim', words = { 'Snacks' } },
  integrations = {
    lspconfig = true,
    cmp = true,
    coq = false,
  },
  enabled = function(root_dir)
    return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
  end,
}
