local THEME_LIGHT = 'morning'
local THEME_DARK = 'torte'

-- 'torte' theme highlight group overrides
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'torte',
  desc = "highlight group overrides the 'torte' theme",
  callback = function()
    local hl = vim.api.nvim_set_hl
    hl(0, 'Folded', { fg = '#808080', bg = '#303030' })
    hl(0, 'Search', { fg = '#ffff00', bg = '#000000', reverse = true })
    hl(0, 'IncSearch', { fg = '#00ff00', bg = '#000000', reverse = true })
    hl(0, 'Comment', { fg = '#87afff', italic = true })
    hl(0, 'LspInlayHint', { fg = '#585858', italic = true })
    hl(0, 'VertSplit', { fg = '#303030', bg = '#000000' })
    hl(0, 'Identifier', { fg = '#40ffff', bold = true })
  end,
})

vim.api.nvim_create_autocmd('OptionSet', {
  desc = "set light/dark theme when switching 'background'",
  pattern = "background",
  callback = function()
    local bg = vim.opt.background:get()
    vim.cmd.colorscheme(
      'dark' == bg
      and THEME_DARK
      or THEME_LIGHT
    )
    print(bg .. ' mode activated')
  end
});

-- vim:et:sw=2:ts=2:
