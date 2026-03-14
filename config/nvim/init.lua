
-------------------------------------------------
-- Opções básicas 
-------------------------------------------------
vim.opt.number          = true
vim.opt.clipboard       = "unnamedplus"
vim.opt.mouse           = "a"
vim.opt.termguicolors   = true
vim.g.mapleader         = " "
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-------------------------------------------------
-- Lazy.nvim (instalação automática)
-------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-------------------------------------------------
-- Plugins
-------------------------------------------------
require("lazy").setup({

  -- Tema
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Barra de status
  { "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup{
        options = { theme = "catppuccin" },
      }
    end,
  },

  -- Neo-Tree
  { "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        filesystem = {
          filtered_items = { hide_dotfiles = false, hide_gitignored = true },
          follow_current_file = true,
          hijack_netrw = true,
        },
        window = { position = "left", width = 35 },
      })
    end,
  },

  -- Terminal
  { "akinsho/toggleterm.nvim", version = "*", config = true },

  -- Autopairs
  { "windwp/nvim-autopairs", config = true },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "c", "cpp", "javascript", "css", "html", "lua", "markdown" },
      highlight = { enable = true },
    },
  },

  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require'cmp'
      cmp.setup{
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>']      = cmp.mapping.confirm({ select = true }),
          ['<Tab>']     = cmp.mapping.select_next_item(),
          ['<S-Tab>']   = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = 'buffer' },
          { name = 'path' },
        })
      }
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

})

-------------------------------------------------
-- Tema
-------------------------------------------------
vim.cmd.colorscheme "catppuccin-mocha"

-- transparência
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })

-------------------------------------------------
-- Atalhos
-------------------------------------------------
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { desc = 'Abrir/fechar NeoTree' })
vim.keymap.set('n', '<C-t>', ':ToggleTerm<CR>',   {desc = 'Abrir/fechar terminal'})
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {desc = 'Buscar arquivos'})
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep,  {desc = 'Buscar no conteúdo'})


