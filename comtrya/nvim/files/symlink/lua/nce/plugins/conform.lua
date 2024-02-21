return {
  "stevearc/conform.nvim",

  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out

  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        yaml = { "prettier" },
        markdown = { "prettier" },
        go = { "gofmt", "goimports" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end
}
