return {
  {
    "4e554c4c/darkman.nvim",
    build = "go build -o bin/darkman.nvim",
    config = function()
      require("darkman").setup()
    end,
    opt = {
      change_background = true,
      send_user_event = false,
      colorscheme = { light = "tokyonight-day", dark = "tokyonight-storm" }, -- can be { dark = "x", light = "y" }
    },
  },
}
