return {
  "R-nvim/R.nvim",
  config = function()
    -- Create a table with the options to be passed to setup()
    local opts = {
      R_args = { "--quiet", "--no-save" },
      R_app = "radian",
      bracketed_paste = true,
      csv_app = "kitten @ --to unix:/tmp/kitty_sock launch --type tab sc-im",
      auto_start = "always",
      Rout_more_colors = true,
      hook = {
        on_filetype = function()
          -- This function will be called at the FileType event
          -- of files supported by R.nvim. This is an
          -- opportunity to create mappings local to buffers.
          vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
          vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
          -- Pipe operator
          vim.api.nvim_buf_set_keymap(0, "i", "<C-S-m>", " |>", {})
        end,
      },
      min_editor_width = 18,
      rconsole_width = 50,
      disable_cmds = {
        "RClearConsole",
        "RCustomStart",
        "RSPlot",
        "RSaveClose",
      },
    }
    -- Check if the environment variable "R_AUTO_START" exists.
    -- If using fish shell, you could put in your config.fish:
    -- alias r "R_AUTO_START=true nvim"
    if vim.env.R_AUTO_START == "true" then
      opts.auto_start = 1
      opts.objbr_auto_start = true
    end
    require("r").setup(opts)
  end,
  lazy = false,
}
