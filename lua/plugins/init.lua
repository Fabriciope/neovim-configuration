return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "intelephense"
      }
    }
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css", "javascript",
        "php", "golang"
  		},
  	},
  },
  -- Highlight todo, notes, etc in comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local todo_comments = require("todo-comments")

      vim.keymap.set("n", "]t", function()
        todo_comments.jump_next()
      end, { desc = "Next todo comment" })

      vim.keymap.set("n", "[t", function()
        todo_comments.jump_prev()
      end, { desc = "Previous todo comment" })

      todo_comments.setup({})
    end,
  }
}
