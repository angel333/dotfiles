-- bootstrap lazy.nvim (straight from docs)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  checker = { enabled = true, frequency = 604800, notify = false },
  spec = {
    { "neovim/nvim-lspconfig",
    },                                   -- }}}
    {
      "nvim-treesitter/nvim-treesitter", -- {{{
      build = ":TSUpdate",
      config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
          ensure_installed = {
            "arduino",
            "astro",
            "awk",
            "bash",
            "c",
            "css",
            "csv",
            "dart",
            "diff",
            "forth",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "gnuplot",
            "gpg",
            "haskell",
            "hcl",
            "html",
            "ini",
            "javascript",
            "jq",
            "jsdoc",
            "json",
            "kotlin",
            -- "latex",
            "lua",
            "luadoc",
            "markdown",
            "nix",
            "org",
            "php",
            "rust",
            "scss",
            "sql",
            "ssh_config",
            "strace",
            "supercollider",
            "svelte",
            "terraform",
            "tmux",
            "toml",
            "tsv",
            "twig",
            "typescript",
            "uxntal",
            "vim",
            "vue",
            "xml",
            "yaml",
            "zig",
            "nu",
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
      end,
      dependencies = {
        { "nushell/tree-sitter-nu", build = ":TSUpdate nu" },
      },
    },                         -- }}}
    {
      "epwalsh/obsidian.nvim", -- {{{
      version = "*",           -- latest version, not latest commit
      lazy = true,
      ft = "markdown",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      opts = {
        workspaces = {
          {
            name = "Main",
            path = "~/Documents/Obsidian_Vault",
          },
        }
        -- ...
      },
    },                                 -- }}}
    {
      "nvim-telescope/telescope.nvim", -- {{{
      tag = '0.1.8',
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      opts = {
        pickers = {
          colorscheme = {
            enable_preview = true,
          },
        },
      }
    }, -- }}}
    {
      'NeogitOrg/neogit',
      dependencies = {
        'nvim-lua/plenary.nvim',         -- required
        'sindrets/diffview.nvim',        -- optional - Diff integration
        'nvim-telescope/telescope.nvim', -- optional
      },
      config = true,
    },
    {
      'lewis6991/gitsigns.nvim',
      -- config copypasted from docs
      opts = {
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({ ']c', bang = true })
            else
              gitsigns.nav_hunk('next')
            end
          end)

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal({ '[c', bang = true })
            else
              gitsigns.nav_hunk('prev')
            end
          end)

          -- Actions
          map('n', '<leader>hs', gitsigns.stage_hunk)
          map('n', '<leader>hr', gitsigns.reset_hunk)
          map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
          map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
          map('n', '<leader>hS', gitsigns.stage_buffer)
          map('n', '<leader>hu', gitsigns.undo_stage_hunk)
          map('n', '<leader>hR', gitsigns.reset_buffer)
          map('n', '<leader>hp', gitsigns.preview_hunk)
          map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end)
          map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
          map('n', '<leader>hd', gitsigns.diffthis)
          map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
          map('n', '<leader>td', gitsigns.toggle_deleted)

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      },
    },
    {
      'stevearc/oil.nvim',
      ---@module 'oil'
      ---@type oil.SetupOpts
      opts = {},
    },
  },
})

-- vim:et:sw=2:ts=2:
