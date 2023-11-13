local opts = {
  ensure_installed = {
    'clangd',
    'tsserver',
  },
  automatic_installation = true,
}

return {
  'williamboman/mason-lspconfig.nvim',
  lazy = false,
  opts = opts,
  event = 'BufReadPre',
  dependencies = 'williamboman/mason.nvim',
}
