-- highlight groups overrides
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'torte',
  desc = 'highlight groups overrides',
  callback = function()
    local hl = vim.api.nvim_set_hl
    hl(0, 'Folded', { fg = '#808080', bg = '#303030' })
    hl(0, 'Search', { fg = '#ffff00', bg = '#000000', reverse = true })
    hl(0, 'IncSearch', { fg = '#00ff00', bg = '#000000', reverse = true })
    hl(0, 'Comment', { fg = '#87afff', italic = true })
    hl(0, 'LspInlayHint', { fg = '#585858', italic = true })
    hl(0, 'VertSplit', { fg = '#303030', bg = '#000000' })
  end,
})

vim.cmd.colorscheme('torte')

-- vim:et:sw=2:ts=2:
