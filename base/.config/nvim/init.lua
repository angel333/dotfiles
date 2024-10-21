-- docs here: ~/Documents/Obsidian_Vault/Tech/Vim.md

-- should be before any key mapping
vim.g.mapleader = ","
-- vim.g.localmapleader = ?

require 'plugins'
require 'lsp'
require 'colors'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

-- usually per-file
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.conceallevel = 2
vim.opt.foldtext = '' -- much less confusing folds
vim.opt.foldmethod = 'marker'

vim.opt.completeopt = 'menu,popup,longest'

-- <C-[hjkl]> window navigation
vim.keymap.set('n', '<C-h>', function() vim.cmd.wincmd('h') end)
vim.keymap.set('n', '<C-j>', function() vim.cmd.wincmd('j') end)
vim.keymap.set('n', '<C-k>', function() vim.cmd.wincmd('k') end)
vim.keymap.set('n', '<C-l>', function() vim.cmd.wincmd('l') end)

-- save with <Space>
vim.keymap.set('n', '<Space>', vim.cmd.update)

-- toggle dark mode
vim.keymap.set('n', '<Leader>`', function()
  vim.opt.background =
      ('dark' == vim.opt.background:get())
      and 'light'
      or 'dark'
end)

vim.keymap.set('i', '<C-Space>', function()
  vim.lsp.completion.trigger()
end)

-- inlay hints toggling (for current buffer / all buffers)
do
  local function toggle_inlay_hints_fn(current_buf_only)
    local filter
    if current_buf_only then
      filter = { bufnr = 0 }
    else
      filter = { bufnr = nil }
    end
    return function()
      vim.lsp.inlay_hint.enable(
        not vim.lsp.inlay_hint.is_enabled(filter),
        filter
      )
    end
  end

  vim.keymap.set('n', '<Leader>i', toggle_inlay_hints_fn())
  vim.keymap.set('n', '<Leader>I', toggle_inlay_hints_fn(true))
end

-- vim:et:sw=2:ts=2:
