require("mason-null-ls").setup({
  ensure_installed = {
    -- Opt to list sources here, when available in mason.
  },
  automatic_installation = false,
  automatic_setup = true, -- Recommended, but optional
  handlers = {},
})

require("null-ls").setup({
  sources = {
    -- require("null-ls").builtins.diagnostics.codespell.with({
    --   filetypes = { "markdown", "text" },
    -- }),
    -- require("typescript.extensions.null-ls.code-actions"),
    -- prettierd
    require("null-ls").builtins.formatting.prettierd,
  },
})
