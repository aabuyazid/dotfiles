-- nvim/lua/user/lsp/mason.lua

-- protected calls
local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
    return
end

local servers = {
    "cssmodules_ls",
    "emmet_ls",
    "html",
    "rust_analyzer",
    "marksman",
    "clangd",
    "neocmake",
    "lua_ls",
    "dockerls",
    "ltex",
    "pyright",
}

-- Here we declare which settings to pass to the mason, and also ensure servers are installed. If not, they will be installed automatically.
local settings = {
    ui = {
        border = "rounded",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
    ensure_installed = servers,
    automatic_installation = true,
}

-- we'll need to call lspconfig to pass our server to the native neovim lspconfig.
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

-- loop through the servers
for _, server in pairs(servers) do
    opts = {
        -- getting "on_attach" and capabilities from handlers
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    -- get the server name
    server = vim.split(server, "@")[1]

    -- pass them to lspconfig
    lspconfig[server].setup(opts)
end

require('lspconfig').verible.setup{
  cmd = {'verible-verilog-ls',
         '--rules_config_search'}
}
