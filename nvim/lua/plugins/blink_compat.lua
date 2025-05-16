return {
  "saghen/blink.cmp",
  dependencies = { "R-nvim/cmp-r", "saghen/blink.compat" },
  opts = {
    sources = {
      compat = { "cmp_r" },
    },
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
  },
}
