local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.cmd([[packadd packer.vim]])
end

vim.api.nvim_create_augroup("packer_user_config", {})
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = "source <afile> | PackerSync",
  group = "packer_user_config",
  desc = "Update plugins when plugins.lua is updated",
})

local ok, packer = pcall(require, "packer")
if not ok then
  vim.notify("packer is not available")
  return
end

return packer.startup({
  function(use)
    -- packages manager
    use({ "wbthomason/packer.nvim" })

    use("google/vim-jsonnet")

    use("tpope/vim-surround")
    use("tpope/vim-repeat")

    use({
      "petertriho/nvim-scrollbar",
      config = function()
        require("scrollbar").setup()
      end,
    })

    use({
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
      },
    })

    use({ "tpope/vim-fugitive" })

    use({
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons",
      },
    })

    use({
      "nvim-lualine/lualine.nvim",
      requires = { "nvim-tree/nvim-web-devicons" },
      after = "github-nvim-theme",
      config = function()
        require("lualine").setup({
          options = {
            globalstatus = true,
          },
        })
      end,
    })

    use({
      "projekt0n/github-nvim-theme",
      config = function()
        require("github-theme").setup({
          options = {
            transparent = true,
          },
        })
        vim.cmd("colorscheme github_dark_high_contrast")
      end,
    })

    use({
      "simrat39/symbols-outline.nvim",
      config = function()
        require("symbols-outline").setup()
      end,
    })

    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })

    use({
      "nvim-treesitter/nvim-treesitter-context",
      requires = {
        { "nvim-treesitter/nvim-treesitter" },
      },
      config = function()
        require("treesitter-context").setup({
          enable = true,
        })
      end,
    })

    use({
      "lewis6991/spellsitter.nvim",
      requires = {
        { "nvim-treesitter/nvim-treesitter" },
      },
      config = function()
        require("spellsitter").setup({
          enable = true,
        })
      end,
    })

    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-treesitter/nvim-treesitter" },
        { "kyazdani42/nvim-web-devicons" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      },
    })

    use({
      "ellisonleao/glow.nvim",
      config = function()
        require("glow").setup({
          style = "dark",
          pager = false,
        })
      end,
    })

    -- enable LSP
    use({
      "neovim/nvim-lspconfig",
      requires = {
        "b0o/schemastore.nvim",
      },
    })

    -- language server installer
    use({
      "williamboman/mason.nvim",
    })

    use({
      "williamboman/mason-lspconfig.nvim",
      requires = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
      },
    })

    use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = {
        { "nvim-lua/plenary.nvim" },
      },
    })

    -- completion
    use({ "hrsh7th/nvim-cmp" })
    use({ "onsails/lspkind-nvim" })
    -- buffer completions
    use({ "hrsh7th/cmp-buffer" })
    -- path completions
    use({ "hrsh7th/cmp-path" })
    -- cmdline completions
    use({ "hrsh7th/cmp-cmdline" })
    use({ "hrsh7th/cmp-nvim-lsp" })

    -- snippets source for nvim-cmp
    use({ "saadparwaiz1/cmp_luasnip" })
    -- snippets plugin
    use({ "L3MON4D3/LuaSnip" })
    use({
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end,
    })

    use({
      "folke/trouble.nvim",
      requires = {
        { "kyazdani42/nvim-web-devicons" },
      },
      config = function()
        require("trouble").setup()
      end,
    })

    -- Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
