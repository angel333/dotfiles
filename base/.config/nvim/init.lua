vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.cursorline = true
vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.keymap.set("n", "<down>", ":bnext<cr>")
vim.keymap.set("n", "<up>", ":bprev<cr>")

-- moving between splits
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

vim.cmd [[colorscheme vim]]

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "neovim/nvim-lspconfig" },
    { "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function () 
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
    },
  },
})

require'lspconfig'.nushell.setup{}
