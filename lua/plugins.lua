local fn = vim.fn

-- Automatically install packer
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
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use( "wbthomason/packer.nvim")

  -- To improve startup time
	use 'lewis6991/impatient.nvim'

  -- For neovim plugins dev
  use { "nvim-lua/plenary.nvim", module = "plenary" }

	-- Colorschemes
	use 'tiagovla/tokyodark.nvim'
	use { "EdenEast/nightfox.nvim", tag = "v1.0.0" }
	use 'xiyaowong/nvim-transparent'

	-- Language highlighting
	use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}

	-- Icons
	use 'kyazdani42/nvim-web-devicons'

	-- Buffers navigation and tabline
	use 'romgrk/barbar.nvim'

	-- Luanine for statusline
	use 'nvim-lualine/lualine.nvim'

	-- Indentation guides
	use 'lukas-reineke/indent-blankline.nvim'

	-- File search and much more
	use {'junegunn/fzf', run = "fzf#install()"}

	-- File explorer within nvim
	use 'kyazdani42/nvim-tree.lua'

	-- Commenter
	use "terrortylor/nvim-comment"

	-- LSP Configuration
	use {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}

	-- Completion
	use {
    'hrsh7th/nvim-cmp',
    requires = {
      {
        "L3MON4D3/LuaSnip",
        requires = { "rafamadriz/friendly-snippets" },
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
      { 'tzachar/cmp-tabnine', after = "nvim-cmp", run='powershell ./install.ps1' },
    },
    config = [[require('user.cmp')]],
    event = 'InsertEnter *',
  }

  -- Insert parents, quotes and brackets in pair
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('user.gitsigns')
    end,
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require('user.telescope')
    end,
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }

  use {'glepnir/dashboard-nvim'}

  -- Pretty notifications
  use 'rcarriga/nvim-notify'

  use 'kdheepak/lazygit.nvim'

  -- use 'ahmedkhalf/project.nvim'

  if PACKER_BOOTSTRAP then
      require("packer").sync()
  end
end)
