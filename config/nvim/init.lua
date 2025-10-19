-- CONFIGURAÇÕES BÁSICAS DO NEOVIM
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true

-- GERENCIADOR DE PLUGINS: Lazy.nvim
local lazypath = vim.fn.stdpath("config") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Tema
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Barra de status
  "nvim-lualine/lualine.nvim",

  -- Ícones
  "nvim-tree/nvim-web-devicons",

  -- Explorador de arquivos
  { "nvim-tree/nvim-tree.lua", cmd = { "NvimTreeToggle", "NvimTreeOpen" } },

  -- Autocompletar
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Autopairs
  "windwp/nvim-autopairs",

  -- Comentários
  "numToStr/Comment.nvim",

  -- Abas (Bufferline)
  { "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },

  -- Live Server
  { "barrett-ruth/live-server.nvim", build = "npm install -g live-server" },

}, {
  checker = { enabled = true },
})

-- TEMA
require("catppuccin").setup({ flavour = "mocha" })
vim.cmd.colorscheme "catppuccin"

-- LUALINE
require("lualine").setup({
  options = {
    theme = "catppuccin",
    icons_enabled = true,
  },
})

-- TREESITTER
require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
  indent = { enable = true },
  ensure_installed = { "python", "c", "cpp", "html", "css", "lua", "javascript" },
  auto_install = true,
})

-- NVIM-TREE
require("nvim-tree").setup({
  view = { width = 30, side = "left" },
})

-- NVIM-CMP
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }),
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "cmdline" },
    { name = "path" },
  },
})

-- AUTOPAIRS
require("nvim-autopairs").setup {}
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- LSP
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "clangd", "html", "cssls" },
})

local lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, bufopts)
end

lsp.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
lsp.clangd.setup({ on_attach = on_attach, capabilities = capabilities })
lsp.html.setup({ on_attach = on_attach, capabilities = capabilities })
lsp.cssls.setup({ on_attach = on_attach, capabilities = capabilities })

-- COMMENT.NVIM
require("Comment").setup()

-- TELESCOPE
require("telescope").setup {}

-- BUFFERLINE
require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    separator_style = "slant",
  },
})
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- LIVE SERVER
require("live-server").setup()
vim.keymap.set("n", "<F8>", "<cmd>LiveServerStart<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F9>", "<cmd>LiveServerStop<CR>", { noremap = true, silent = true })

-- MAPEAMENTOS
vim.g.mapleader = " "
vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true })

-- EXECUTAR PYTHON (F6)
vim.keymap.set("n", "<F6>", function()
  local file = vim.fn.expand("%")
  vim.cmd("w")
  vim.cmd("split | terminal python3 " .. file)
end, { noremap = true, silent = true })

-- COMPILAR E EXECUTAR C++ (F7)
vim.keymap.set("n", "<F7>", function()
  local file = vim.fn.expand("%")
  local output = vim.fn.expand("%:r")
  vim.cmd("w")
  vim.cmd("split | terminal g++ -std=c++17 " .. file .. " -o " .. output .. " && ./" .. output)
end, { noremap = true, silent = true })


