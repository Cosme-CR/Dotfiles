-------------------------------------------------------------------------------
-- BÁSICo
-------------------------------------------------------------------------------

-- Mostra número das linhas
vim.opt.number = true

-- Mostra número relativo (bom para navegação)
--vim.opt.relativenumber = true

-- Usa clipboard do sistema
vim.opt.clipboard = "unnamedplus"

-- Habilita mouse
vim.opt.mouse = "a"

-- Habilita cores truecolor
vim.opt.termguicolors = true

-- Define leader key como espaço
vim.g.mapleader = " "

-- Configuração de tabulação
vim.opt.expandtab = true   -- converte TAB em espaços
vim.opt.tabstop = 4        -- tamanho do TAB
vim.opt.shiftwidth = 4     -- identação
vim.opt.softtabstop = 4

-------------------------------------------------------------------------------
-- INSTALA AUTOMÁTICAMENTE O LAZY.NVIM (GERENCIADOR DE PLUGINS)
-------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Se lazy.nvim não existir ele será clonado
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end

-- Adiciona lazy ao runtimepath
vim.opt.rtp:prepend(lazypath)

-------------------------------------------------------------------------------
-- 3. PLUGINS
-------------------------------------------------------------------------------

require("lazy").setup({

  ---------------------------------------------------------------------------
  -- TEMA: GRUVBOX
  ---------------------------------------------------------------------------
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()

      -- define background escuro
      vim.o.background = "dark"

      -- ativa modo transparente
      require("gruvbox").setup({
        transparent_mode = true
      })

      -- aplica o tema
      vim.cmd.colorscheme("gruvbox")
    end
  },

  ---------------------------------------------------------------------------
  -- DASHBOARD INICIAL
  ---------------------------------------------------------------------------
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Arte ASCII do header
      dashboard.section.header.val = {
          [[      .--.                                                                  .--.      ]],
          [[     |o_o |          ██████╗  ██████╗  ██████╗   █████╗  ███████╗          |o_o |     ]],
          [[     |:_/ |         ██╔════╝ ██╔═══██╗ ██╔══██╗ ██╔══██╗ ██╔════╝          |:_/ |     ]],
          [[    //   \ \        ██║      ██║   ██║ ██║  ██║ ███████║ ███████╗         //   \ \    ]],
          [[   (|     | )       ██║      ██║   ██║ ██║  ██║ ██╔══██║ ╚════██║        (|     | )   ]],
          [[  /'\_   _/`\       ╚██████╗ ╚██████╔╝ ██████╔╝ ██║  ██║ ███████║       /'\_   _/`\   ]],
          [[  \___)=(___/________╚═════╝__╚═════╝__╚═════╝__╚═╝__╚═╝_╚══════╝_______\___)=(___/  ]],
      }




      -- Botões do dashboard
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Buscar Arquivo", ":Telescope find_files <CR>"),
        dashboard.button("e", "  Novo Arquivo", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  Arquivos Recentes", ":Telescope oldfiles <CR>"),
        dashboard.button("q", "  Sair", ":qa<CR>"),
      }

      alpha.setup(dashboard.opts)
    end
  },


  --Gitsigns (mostra alterações do Git na lateral)
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "+" },
          change       = { text = "~" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
        },
      })
    end
  },



  --Which-key (mostra atalhos) Quando pressiona leader (space), ele mostra os comandos disponíveis.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({})
    end
  },


  --Indent-Blankline (linhas de identação)
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- BARRA DE STATUS
  ---------------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox"
        }
      })
    end
  },

  ---------------------------------------------------------------------------
  -- GERENCIADOR DE ARQUIVOS (MENU LATERAL)
  ---------------------------------------------------------------------------
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

          -- não esconder arquivos ocultos
          filtered_items = {
            hide_dotfiles = false
          },

          -- segue o arquivo atual
          follow_current_file = true,

          -- substitui netrw
          hijack_netrw = true
        },

        window = {
          position = "left",
          width = 35
        }

      })
    end
  },

  ---------------------------------------------------------------------------
  -- TERMINAL INTEGRADO
  ---------------------------------------------------------------------------
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true
  },

  ---------------------------------------------------------------------------
  -- AUTOPAIRS (FECHA PARÊNTESES AUTOMATICAMENTE)
  ---------------------------------------------------------------------------
  {
    "windwp/nvim-autopairs",
    config = true
  },

  ---------------------------------------------------------------------------
  -- TREESITTER (HIGHLIGHT AVANÇADO)
  ---------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()

      local ok, ts = pcall(require, "nvim-treesitter.configs")

      if ok then
        ts.setup({

          -- linguagens instaladas
          ensure_installed = {
            "c",
            "lua",
            "markdown",
            "markdown_inline"
          },

          highlight = {
            enable = true
          }

        })
      end
    end
  },

  ---------------------------------------------------------------------------
  -- TELESCOPE (BUSCA DE ARQUIVOS E TEXTO)
  ---------------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",

    dependencies = {
      "nvim-lua/plenary.nvim"
    },

    config = function()

      require("telescope").setup({

        defaults = {
          preview = {
            treesitter = false
          }
        }

      })

    end
  },

  ---------------------------------------------------------------------------
  -- MASON (INSTALADOR DE LSP)
  ---------------------------------------------------------------------------
  {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup()
    end
  },

  ---------------------------------------------------------------------------
  -- INTEGRAÇÃO MASON + LSPCONFIG
  ---------------------------------------------------------------------------
  {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
      "williamboman/mason.nvim"
    },

    config = function()

      require("mason-lspconfig").setup({

        -- servidores LSP instalados automaticamente
        ensure_installed = {
          "lua_ls",
          "clangd",
          "ts_ls"
        }

      })

    end
  },

  ---------------------------------------------------------------------------
  -- CONFIGURAÇÃO DOS LSP
  ---------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp"
    },

    config = function()

      -- capacidades do autocomplete
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- servidores LSP utilizados
      local servers = {
        "lua_ls",
        "clangd",
        "ts_ls"
      }

      -- loop que ativa todos os servidores
      for _, lsp in ipairs(servers) do

        if vim.lsp.config then

          -- API nova do Neovim 0.11+
          vim.lsp.config(lsp, {
            capabilities = capabilities
          })

          vim.lsp.enable(lsp)

        else

          -- API antiga
          require("lspconfig")[lsp].setup({
            capabilities = capabilities
          })

        end
      end
    end
  },

  ---------------------------------------------------------------------------
  -- AUTOCOMPLETE (Nvim-cmp)
  ---------------------------------------------------------------------------
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

      local cmp = require("cmp")

      cmp.setup({

        -- suporte a snippets
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end
        },

        -- atalhos do autocomplete
        mapping = cmp.mapping.preset.insert({

          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),

        }),

        -- fontes de sugestão
        sources = cmp.config.sources({

          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },

        })

      })
    end
  },

})

-------------------------------------------------------------------------------
-- 4. TRANSPARÊNCIA MANUAL
-------------------------------------------------------------------------------

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })

-------------------------------------------------------------------------------
-- 5. ATALHOS
-------------------------------------------------------------------------------

-- abrir / fechar explorer
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { desc = "Abrir NeoTree" })

-- abrir terminal
vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>", { desc = "Terminal integrado" })

-- buscar arquivos
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Buscar arquivos" })

-- buscar texto no projeto
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Buscar texto" })

-------------------------------------------------------------------------------
-- 6. ATALHOS DO LSP
-------------------------------------------------------------------------------

vim.api.nvim_create_autocmd("LspAttach", {

  callback = function(ev)

    local opts = { buffer = ev.buf }

    -- ir para definição
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    -- documentação
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    -- renomear símbolo
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    -- ações rápidas
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  end

})