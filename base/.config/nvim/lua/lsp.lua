require 'lspconfig'.nushell.setup {} -- included in nu
require 'lspconfig'.zls.setup {}     -- included in zig
require 'lspconfig'.lua_ls.setup {   -- requires lua-language-server
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
    },
  },
}

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end

    if client.supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
      -- toggle
      vim.keymap.set('n', '<Leader>i', function()
        local desired = not vim.lsp.inlay_hint.is_enabled()
        vim.lsp.inlay_hint.enable(desired)
      end)
    end

    if client.supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function() vim.lsp.completion.trigger() end)
    end

    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        end,
      })
    end
  end,
})

-- vim: et sw=2 ts=2 fdm=marker
