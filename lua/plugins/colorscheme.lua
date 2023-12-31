return {
  -- add gruvbox
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    -- config = function()
    --   require("catppuccin").setup({
    --     flavour = "frappe",
    --     transparent_background = true,
    --   })
    -- end,
    opts = {
      flavour = "frappe",
      transparent_background = true,
      styles = {
        functions = { "italic" },
        keywords = { "bold" },
      },
      integrations = {
        cmp = true,
        flash = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
