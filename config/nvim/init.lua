-------------------------------------------------------------------------------
-- CONFIGURAÇÃO DO NEOVIM 
-------------------------------------------------------------------------------

-- 1. OPÇÕES BÁSICAS
vim.opt.number          = true
--vim.opt.relativenumber  = true
vim.opt.clipboard       = "unnamedplus"
vim.opt.mouse           = "a"
vim.opt.termguicolors   = true
vim.g.mapleader         = " "

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- 2. LAZY.NVIM (Instalação Automática)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath } )
end
vim.opt.rtp:prepend(lazypath)

-- 3. PLUGINS
require("lazy").setup({
  -- TEMA: Gruvbox
  {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "hard", -- opções: "soft", "medium", "hard"
      
      palette_overrides = {},
      overrides = {},
      
      bold = true,
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
      
      transparent_mode = false,
    })

    vim.cmd("colorscheme gruvbox")
  end
},

  -- TEMA: Catppuccin

--[[
  {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- mais contraste

      transparent_background = false, -- IMPORTANTE: aumenta contraste real

      dim_inactive = {
        enabled = false,
      },

      styles = {
        comments = {},
        conditionals = {},
      },

      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
        },
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end
},

]]--#region


    {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",

      transparent_background = false,

      dim_inactive = {
        enabled = false,
      },

      styles = {
        comments = { "bold" }, -- comentários mais visíveis
        conditionals = { "bold" },
        keywords = { "bold" },
      },

      color_overrides = {
        mocha = {
          -- fundo mais profundo
          base = "#1a1c2b",
          mantle = "#181926",
          crust = "#11111b",

          -- texto mais forte
          text = "#ffffff",
          subtext1 = "#e6e9ff",
          subtext0 = "#cdd6f4",

          -- cores MUITO mais vivas
          blue   = "#6ea8ff",
          red    = "#ff6b6b",
          green  = "#8be28b",
          yellow = "#ffd166",
          mauve  = "#c77dff",
          teal   = "#5fd7ff",
          peach  = "#ff9f43",
        },
      },

      highlight_overrides = {
        mocha = function(colors)
          return {
            Normal = { fg = colors.text, bg = colors.base },

            Comment = { fg = "#7a819c", italic = false }, -- visível mas não apagado

            Keyword = { fg = colors.mauve, bold = true },
            String  = { fg = colors.green },
            Function= { fg = colors.blue, bold = true },
            Variable= { fg = colors.text },

            -- LSP
            DiagnosticError = { fg = colors.red, bold = true },
            DiagnosticWarn  = { fg = colors.yellow, bold = true },
            DiagnosticInfo  = { fg = colors.blue },
            DiagnosticHint  = { fg = colors.teal },
          }
        end
      },

      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
        },
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end
},

  -- DASHBOARD: Alpha-nvim
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')
        dashboard.section.header.val = {
            [[      .--.                                                                  .--.      ]],
            [[     |o_o |          ██████╗  ██████╗  ██████╗   █████╗  ███████╗          |o_o |     ]],
            [[     |:_/ |         ██╔════╝ ██╔═══██╗ ██╔══██╗ ██╔══██╗ ██╔════╝          |:_/ |     ]],
            [[    //   \ \        ██║      ██║   ██║ ██║  ██║ ███████║ ███████╗         //   \ \    ]],
            [[   (|     | )       ██║      ██║   ██║ ██║  ██║ ██╔══██║ ╚════██║        (|     | )   ]],
            [[  /'\_   _/`\       ╚██████╗ ╚██████╔╝ ██████╔╝ ██║  ██║ ███████║       /'\_   _/`\   ]],
            [[  \___)=(___/________╚═════╝__╚═════╝__╚═════╝__╚═╝__╚═╝_╚══════╝_______\___)=(___/  ]],
        }
        dashboard.section.buttons.val = {
            dashboard.button("f", "  Buscar Arquivo", ":Telescope find_files <CR>"),
            dashboard.button("e", "  Novo Arquivo", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", "  Arquivos Recentes", ":Telescope oldfiles <CR>"),
            dashboard.button("q", "  Sair", ":qa<CR>"),
        }
        alpha.setup(dashboard.opts)
    end
  },

  -- Barra de status (Lualine)
  { 
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup{ options = { theme = "auto" } }
    end,
  },

  -- Menu lateral (Neo-tree)
  { 
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = { hide_dotfiles = false },
          follow_current_file = true,
          hijack_netrw = true,
        },
        window = { position = "left", width = 35 },
      })
    end,
  },

  -- Terminal integrado (ToggleTerm)
  { "akinsho/toggleterm.nvim", version = "*", config = true },
 





  -- Fecha chaves automaticamente (Autopairs)
  { "windwp/nvim-autopairs", config = true },

  -- Realce de sintaxe (Treesitter)
  { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local status, ts = pcall(require, "nvim-treesitter.configs")
      if status then
        ts.setup({
          ensure_installed = { 
            "c", "lua", "markdown", "markdown_inline","dart",
            "javascript", "typescript", "html", "css", "json" 
          },
          highlight = { enable = true },
        })
      end
    end,
  },

  -- Busca rápida (Telescope)
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('telescope').setup({
        defaults = {
          preview = {
            treesitter = false,
          }
        }
      })
    end
  },

  -- 4. LSP E AUTOCOMPLETE
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "ts_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local servers = { "lua_ls", "clangd", "ts_ls" }
      
      for _, lsp in ipairs(servers) do
        if vim.lsp.config then
          vim.lsp.config(lsp, { capabilities = capabilities })
          vim.lsp.enable(lsp)
        else
          require('lspconfig')[lsp].setup({ capabilities = capabilities })
        end
      end
    end,
  },

  -- FLUTTER TOOLS 
  -- Adicione isso na lista de plugins
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- Melhora a interface de seleção
    },
    config = function()
      require("flutter-tools").setup({
        lsp = {
          color = { enabled = true },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
          }
        }
      })
    end,
  },




  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require'cmp'
      cmp.setup({
        snippet = {
          expand = function(args) require('luasnip').lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>']      = cmp.mapping.confirm({ select = true }),
          ['<Tab>']     = cmp.mapping.select_next_item(),
          ['<S-Tab>']   = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        })
      })
    end,
  },
})

-- 4. CONFIGURAÇÃO INICIAL DO TEMA
vim.o.background = "dark"
vim.cmd.colorscheme "catppuccin"

-- Função para aplicar transparência (chamada após trocar o tema)
local function apply_transparency()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
  vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end

--apply_transparency()

-- 5. FUNÇÃO PARA ALTERNAR TEMAS (TOGGLE)
function _G.toggle_theme()
  if vim.g.colors_name == "gruvbox" then
    vim.cmd.colorscheme("catppuccin-frappe")
    print("Tema: Catppuccin Frappe")
  else
    vim.cmd.colorscheme("gruvbox")
    print("Tema: Gruvbox")
  end
  --apply_transparency()
end

-- 6. ATALHOS
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { desc = 'Abrir/fechar NeoTree' })
vim.keymap.set('n', '<C-t>', ':ToggleTerm<CR>',   {desc = 'Abrir/fechar terminal'})
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', {desc = 'Buscar arquivos'})
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>',  {desc = 'Buscar no conteúdo'})




-- ATALHO PERSONALIZADO FLUTTER: Ctrl+f para Salvar e Reload
--vim.keymap.set('n', '<C-f>', function()
  --vim.cmd('write')
  --vim.cmd('FlutterReload')
  --print("Salvo e Hot Reload!")
--end, { desc = 'Salvar e Hot Reload Flutter' })

-- ATALHO PARA INICIAR APP/EMULADOR: leader + fr
--vim.keymap.set('n', '<leader>fr', ':FlutterRun<CR>', { desc = 'Iniciar Flutter (Emulador/App)' })








-- Função para iniciar o emulador e rodar o app Flutter no painel inferior
local function run_flutter_on_pixel_7()
  vim.cmd('write') -- Salva o arquivo atual
  
  print("Iniciando processo Flutter...")

  -- 1. Comando: Abre emulador -> Espera conexão ADB -> Roda o App
  -- O 'sleep 5' após o wait-for-device dá uma margem extra para o sistema carregar
  local cmd = "flutter emulators --launch Pixel_7 && " ..
              "echo 'Aguardando o dispositivo responder...' && " ..
              "adb wait-for-device && sleep 5 && " ..
              "flutter run -d Pixel_7"

  -- 2. Executa via ToggleTerm no painel inferior (horizontal)
  -- Parâmetros: cmd, id, size, label, direction
  require("toggleterm").exec(cmd, 1, 15, nil, "horizontal")
end

-- ATALHO: leader + fr
vim.keymap.set("n", "<leader>fr", run_flutter_on_pixel_7, { desc = "Iniciar Flutter (Painel Inferior)" })

-- ATALHO: Ctrl + f (Hot Reload)
vim.keymap.set('n', '<C-f>', function()
  vim.cmd('write')
  -- Envia o sinal de reload para o processo do flutter
  vim.fn.system("pkill -USR1 -f flutter_tools.snapshot")
  print("Hot Reload enviado!")
end, { desc = 'Flutter: Save & Reload' })
















-- Atalho para alternar temas: Spaço + t + h
vim.keymap.set('n', '<leader>th', ':lua toggle_theme()<CR>', { desc = 'Alternar Gruvbox/Catppuccin' })

-- Atalhos LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})
