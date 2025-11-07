return {
  "jalvesaq/zotcite",
  branch = "no_pynvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("zotcite").setup({
      dir = "/home/samtrek/.local/share/nvim/lazy/zotcite/",
      SQL_path = "/home/samtrek/Zotero/zotero.sqlite",
    })
  end,
}
