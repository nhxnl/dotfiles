local on_attach = require("config.lsp").on_attach

local config = function()
	local servers = {
		clangd = {},
		gopls = {},
		eslint = {},
		tsserver = {},
		html = { filetypes = { "html", "twig", "hbs" } },
		lua_ls = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
				diagnostics = { disable = { "missing-fields" } },
			},
		},
	}

	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

	require("mason-lspconfig").setup({
		ensure_installed = vim.tbl_keys(servers),
		handlers = {
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
					filetypes = (servers[server_name] or {}).filetypes,
				})
			end,
		},
	})

	local lspconfig = require("lspconfig")

	lspconfig.clangd.setup({
		capabilities = {
			offsetEncoding = { "utf-16" }, -- prevent the offset encoding warning
		},
	})

	lspconfig.gopls.setup({
		root_dir = function(fname)
			return require("lspconfig/util").root_pattern("go.work", "go.mod", ".git")(fname) or vim.fn.getcwd()
		end,
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
				},
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = config,
}
