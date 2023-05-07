local on_attach = function(client, bufnr)
  client.server_capabilities.hoverProvider = false
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {},
      rust_analyzer = {},
      ruff_lsp = {
        init = function()
          require("lspconfig").on_attach(on_attach)
        end,
      },
      bashls = {},
    },
  },
}
