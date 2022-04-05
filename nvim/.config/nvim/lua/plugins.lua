local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    'git',
    'clone',
    '--depth', '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path})
  vim.cmd [[packadd packer.vim]]
end

vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local ok, packer = pcall(require, "packer")
if not ok then
  vim.notify("packer not available")
  return
end

return packer.startup({function(use)
  -- packages manager
  use 'wbthomason/packer.nvim'

  use 'google/vim-jsonnet'
  use 'mfukar/robotframework-vim'

  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  }

  use {
    "hoob3rt/lualine.nvim",
    after = "github-nvim-theme",
    config = function()
      require("lualine").setup {
        options = {
          theme = "auto"
        }
      }
    end
  }

  use {
    "projekt0n/github-nvim-theme",
    config = function()
      require("github-theme").setup({
        theme_style = "dark_default"
      })
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
      { 'kyazdani42/nvim-web-devicons' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    }
  }

  -- use { 'mfukar/robotframework-vim' }
  use { 'ellisonleao/glow.nvim' }

  -- enable LSP
  use { 'neovim/nvim-lspconfig' }
  -- language server installer
  use { "williamboman/nvim-lsp-installer" }

  -- completion
  use { "hrsh7th/nvim-cmp" }
  use { "onsails/lspkind-nvim" }
  -- buffer completions
  use { "hrsh7th/cmp-buffer" }
  -- path completions
  use { "hrsh7th/cmp-path" }
  -- cmdline completions
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/cmp-nvim-lsp" }

  -- snippets source for nvim-cmp
  use { 'saadparwaiz1/cmp_luasnip' }
  -- snippets plugin
  use { 'L3MON4D3/LuaSnip' }

  use { 'numToStr/Comment.nvim' }

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end
  }
}})

