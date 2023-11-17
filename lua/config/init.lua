local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('config.globals')
require('config.options')
require('config.keymaps')

local opts = {
	defaults = {
		lazy = true,
	},
	install = {
		colorscheme = { 'palenight.lua' }
	},
	rtp = {
		disabled_plugins = {
			'gzip',
			'matchit',
			'matchparen',
			'netrwPlugin',
			'tarPlugin',
			'tohtml',
			'tutor',
			'zipPlugin',
		}
	},
	change_detections = {
		notify = true,
	},
}

require('lazy').setup('plugins', opts)

local ensure_installed = {
  'sumneko_lua',
}

require('mason').setup()
require('mason-lspconfig').setup({ ensure_installed = ensure_installed })

require('lsp-config').sumneko_lua.setup {}
