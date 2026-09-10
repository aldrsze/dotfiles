local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    java = { "google-java-format" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    cs = { "csharpier" },
    python = { "black", "isort" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    markdown = { "prettierd", "prettier", stop_after_first = true },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = "fallback",
  },
}

require("conform").setup(options)
return options
