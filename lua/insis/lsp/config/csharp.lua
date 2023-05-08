local common = require("insis.lsp.common-config")

common.capabilities.offsetEncoding = "utf-8"

local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  cmd = {
    "csharp-ls",
  },
  init_options = {
    AutomaticWorkspaceInit = true,
  },
  handlers = {
    ["textDocument/definition"] = require("csharpls_extended").handler,
  },
  on_attach = function(client, bufnr)
    common.disableFormat(client)
    common.keyAttach(bufnr)
    --[[ keymap(
      "n",
      require("insis").config.lsp.definition,
      "<CMD>lua require('csharpls_extended').lsp_definitions()<CR>",
      { noremap = true, silent = true, buffer = bufnr }
    ) ]]
  end,
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
