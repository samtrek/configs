return {
  {
    "4e554c4c/darkman.nvim",
    build = "go build -o bin/darkman.nvim",
    config = function()
      require("darkman").setup({
        change_background = true,
        send_user_event = false,
        colorscheme = { light = "catppuccin", dark = "catppuccin-frappe" }, -- can be { dark = "x", light = "y" }
      })
    end,
  },
}
