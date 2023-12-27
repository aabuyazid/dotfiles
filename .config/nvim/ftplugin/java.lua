local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"
local lsp_attach = function(client, bufnr)
    -- mappings here
end

local config = {
    cmd = { jdtls_bin },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    on_attach = lsp_attach,
}
require('jdtls').start_or_attach(config)
