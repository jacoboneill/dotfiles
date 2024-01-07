return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup({
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				})
			end,
			dependencies = {
				"williamboman/mason-lspconfig.nvim",
			},
		},
		{
			"folke/neodev.nvim",
			opts = {
				library = {
					enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
					-- these settings will be used for your Neovim config directory
					runtime = true, -- runtime path
					types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
					plugins = true, -- installed opt or start plugins in packpath
					-- you can also specify the list of plugins to make available as a workspace library
					-- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
				},
				setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
				-- With lspconfig, Neodev will automatically setup your lua-language-server
				-- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
				-- in your lsp start options
				lspconfig = false,
				-- much faster, but needs a recent built of lua-language-server
				-- needs lua-language-server >= 3.6.0
				pathStrict = true,
			},
		},
	},
	config = function()
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
        "pylsp",
			},
		})

		local servers = {
			clangd = {},
			lua_ls = {
				Lua = {
					worspace = { checkThirdParty = false },
					telemety = { enable = false },
				},
			},
		}

		local on_attach = function(client, bufnr)
			-- LSP keymaps
		end
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		mason_lspconfig.setup_handlers({
			function(server_name)
				local opts = {
					on_attach = on_attach,
					capabilities = capabilities,
					settings = servers[server_name],
				}

				require("lspconfig")[server_name].setup(opts)
			end,
		})
	end,
}
