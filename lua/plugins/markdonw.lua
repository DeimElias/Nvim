return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    lspconfig["marksman"].setup({
      filetypes = { "markdown", "quarto", "R" },
    })

    lspconfig["grammarly"].setup({
      filetypes = { "markdown", "quarto", "R" },
    })
  end,
}
