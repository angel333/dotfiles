vim.lsp.enable('nushell')  -- included in nu
vim.lsp.enable('zls')      -- included in zig
vim.lsp.enable('gleam')    -- included in gleam
vim.lsp.enable('ocamllsp') -- `opam install ocaml-lsp-server`
vim.lsp.enable('hls')      -- ?
vim.lsp.enable('pyright')  -- requires pyright
vim.lsp.enable('lua_ls')   -- requires lua-language-server; config in ../.luarc.json

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
