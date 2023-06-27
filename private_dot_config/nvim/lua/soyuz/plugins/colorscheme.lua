return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = "night",
        styles = {
          comments = "italic",
          keywords = "italic",
          floats = "transparent",
          sidebars = "transparent",
        },
        on_highlights = function(hl)
          hl.CursorLineNr = { fg = "#FFD700" }
        end,
        terminal_colors = true,
        transparent = true,
      })
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
}
