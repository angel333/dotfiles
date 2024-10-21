require 'lspconfig'.nushell.setup {} -- included in nu
require 'lspconfig'.zls.setup {}     -- included in zig
require 'lspconfig'.gleam.setup {}   -- included in gleam
require 'lspconfig'.lua_ls.setup {   -- requires lua-language-server
  -- see ../.luarc.json
}

vim.lsp.inlay_hint.enable(false)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end

    if client.supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
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
