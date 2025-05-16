return {
  "saghen/blink.cmp",
  dependencies = { "R-nvim/cmp-r", "jalvesaq/cmp-zotcite", "saghen/blink.compat" },
  opts = {
    sources = {
      compat = { "cmp_r", "cmp_zotcite" },
    },
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
  },
}
