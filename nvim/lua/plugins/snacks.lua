-- lazy.nvim
return {
  "folke/snacks.nvim",
  pririty = 10000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    image = {
      enabled = true,
      -- your image configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
