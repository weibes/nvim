return {
  'lewis6991/gitsigns.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('gitsigns').setup({
      signs = {
        add          = { text = '▎' },
        change       = { text = '▎' },
        delete       = { text = '▁' },
        topdelete    = { text = '▔' },
        changedelete = { text = '▎' },
        untracked    = { text = '▎' },
      },
      current_line_blame = false, -- toggle with <leader>tb
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 300,
      },
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Hunk navigation
        map('n', ']c', function()
          if vim.wo.diff then vim.cmd.normal({ ']c', bang = true })
          else gitsigns.nav_hunk('next') end
        end, { desc = "Git: Next hunk" })

        map('n', '[c', function()
          if vim.wo.diff then vim.cmd.normal({ '[c', bang = true })
          else gitsigns.nav_hunk('prev') end
        end, { desc = "Git: Prev hunk" })

        -- Stage / reset hunks
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = "Git: Stage hunk" })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = "Git: Reset hunk" })
        map('v', '<leader>hs', function() gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { desc = "Git: Stage selected lines" })
        map('v', '<leader>hr', function() gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { desc = "Git: Reset selected lines" })

        -- Buffer-level ops
        map('n', '<leader>hS', gitsigns.stage_buffer,      { desc = "Git: Stage buffer" })
        map('n', '<leader>hR', gitsigns.reset_buffer,      { desc = "Git: Reset buffer" })
        map('n', '<leader>hu', gitsigns.undo_stage_hunk,   { desc = "Git: Undo stage hunk" })

        -- Preview / inspect
        map('n', '<leader>hp', gitsigns.preview_hunk,      { desc = "Git: Preview hunk" })
        map('n', '<leader>hb', function() gitsigns.blame_line({ full = true }) end, { desc = "Git: Blame line (full)" })
        map('n', '<leader>hd', gitsigns.diffthis,          { desc = "Git: Diff this file" })
        map('n', '<leader>hD', function() gitsigns.diffthis('~') end, { desc = "Git: Diff against last commit" })

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "Git: Toggle inline blame" })
        map('n', '<leader>td', gitsigns.toggle_deleted,            { desc = "Git: Toggle deleted lines" })

        -- Text object: operate on a hunk with ih (e.g. `vih`, `dih`, `yih`)
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Git: Select hunk" })
      end,
    })
  end,
}
