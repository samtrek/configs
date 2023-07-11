return {
  {
    "4e554c4c/darkman.nvim",
    build = "go build -o bin/darkman.nvim",
    config = function()
      require("darkman").setup()
    end,
    opts = {
      change_background = true,
      send_user_event = false,
      colorscheme = { light = "catppuccin", dark = "cattppuccin-frappe" }, -- can be { dark = "x", light = "y" }
    },
  },
}
