return {
  "jalvesaq/zotcite",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("zotcite").setup({
      scripts_path = "/home/samtrek/.local/share/nvim/lazy/zotcite/lua",
    })
  end,
}
