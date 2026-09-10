-- Define capabilities safely
local capabilities = vim.lsp.protocol.make_client_capabilities()
if package.loaded["blink.cmp"] then
  capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
end

-- Core NvChad defaults for mapping keys, diagnostics, etc.
local on_attach = function(client, _bufnr)
  -- NvChad's built-in LSP mappings (or leave empty if managed globally)
end

local servers = { "html", "cssls", "jdtls", "omnisharp", "marksman" }

for _, lsp in ipairs(servers) do
  -- Use the new Neovim 0.11 native configuration
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- You must explicitly enable the server in Nvim 0.11+
  vim.lsp.enable(lsp)
end
