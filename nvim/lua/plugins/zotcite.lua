return {
  "jalvesaq/zotcite",
  -- branch = "no_pynvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("zotcite").setup({
      SQL_path = "/home/samtrek/Zotero/zotero.sqlite",
    })
  end,
}
