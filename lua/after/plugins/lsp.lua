local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })

  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = "LSP: Go to definition" }))
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = "LSP: References" }))
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = "LSP: Implementation" }))
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = "LSP: Hover docs" }))
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = "LSP: Rename" }))
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = "LSP: Code action" }))
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, vim.tbl_extend('force', opts, { desc = "LSP: Show diagnostic" }))
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, vim.tbl_extend('force', opts, { desc = "LSP: Prev diagnostic" }))
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, vim.tbl_extend('force', opts, { desc = "LSP: Next diagnostic" }))

  -- inlay hints (nvim 0.10+)
  if client.supports_method("textDocument/inlayHint") then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "ts_ls", "eslint", "clangd", "gopls", "rust_analyzer" },
  handlers = {
    lsp_zero.default_setup,
    -- ts_ls is handled by typescript-tools.nvim — skip auto-setup to avoid conflicts
    ts_ls = function() end,
    eslint = function()
      require('lspconfig').eslint.setup({
        settings = {
          workingDirectory = { mode = "auto" },
        },
      })
    end,
  },
})
