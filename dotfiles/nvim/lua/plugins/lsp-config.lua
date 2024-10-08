return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "astro",
          "bashls",
          "clangd", -- C
          "cssls",
          "denols",
          "dockerls",
          "gopls",
          "jsonls",
          "lua_ls",
          -- "nil", -- Nix
          "phpactor",
          "pylsp",
          "rust_analyzer",
          "tsserver", -- JS/TS
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({})
      lspconfig.html.setup({})
      lspconfig.lua_ls.setup({})

      -- normal mode keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
