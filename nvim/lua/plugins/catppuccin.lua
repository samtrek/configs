return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  opts = {
    flavour = "latte", -- latte, frappe, macchiato, mocha
    background = { -- :h background
      light = "latte",
      dark = "frappe",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = false, -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    integrations = {
      dashboard = true,
      cmp = true,
      gitsigns = true,
      treesitter = true,
      notify = true,
      mini = true,
      lsp_trouble = true,
      mason = true,
      flash = true,
      illuminate = true,
      neotest = true,
      noice = true,
      neotree = true,
      markdown = true,
      rainbow_delimiters = true,
      semantic_tokens = true,
      telescope = true,
      which_key = true,
      indent_blankline = { enabled = true },
      navic = { enabled = true, custom_bg = "lualine" },
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  },
}
