return {
  {
    'nvim-lualine/lualine.nvim',
    required = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = 'tokyonight',
          section_separators = '',
          component_separators = '|',
        },
      })
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      filesystem = {
        hijack_netrw_behavior = "disabled",
      }
    },
    config = function()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
      vim.keymap.set('n', '<leader>nt', ':NeoTreeReveal<CR>', { desc = '[N]vim [T]ree' })
      vim.keymap.set('n', '<leader>nc', ':NeoTreeClose<CR>', { desc = '[N]vim [T]ree [C]lose' })
      require("neo-tree").setup({
        close_if_last_window = true,
        filesystem = {
          hijack_netrw_behavior = "disabled",
        },
      })
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    file_ignore_patters = {
      "node_modules",
      ".git",
      "*lock.json",
      "yarn.lock",
      "package-lock.json",
    },
    defaults = {
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
    },
    config = function()
      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
      vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
      vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
      vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
      vim.keymap.set('n', '<leader>fc', require('telescope.builtin').git_commits, { desc = '[F]ind [C]ommits' })
      vim.keymap.set('n', '<leader>cb', require('telescope.builtin').git_bcommits, { desc = '[C]ommit [B]uffers' })
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`false
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 200,
        ignore_whitespace = false,
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true })
        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true })
        map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line { full = true } end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function() gs.diffthis('~') end)
        map('n', '<leader>td', gs.toggle_deleted)
      end
    }
  }
}
