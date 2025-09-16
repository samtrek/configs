-- obsidian setup
return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  -- event = {
  --   "BufReadPre /home/samtrek/Documents/Obsidian Vault/**.md",
  --   "BufNewFile /home/samtrek/Documents/Obsidian Vault/**.md",
  -- },
  -- -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    dir = "~/Documents/Obsidian Vault", -- no need to call 'vim.fn.expand' here

    -- Optional, if you keep notes in a specific subdirectory of your vault.
    notes_subdir = "notes",
    ui = {
      enable = false,
    },

    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "notes/dailies",
      -- Optional, if you want to change the date format for daily notes.
      date_format = "%Y-%m-%d",
      template = "Plan for the day.md",
    },
  },
}
