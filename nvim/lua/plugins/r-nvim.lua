return {
  lazy = false,
  "R-nvim/R.nvim",
  config = function()
    -- Create a table with the options to be passed to setup()
    ---@type RConfigUserOpts
    local opts = {
      R_args = { "--no-save", "--quiet", "--no-restore", "--no-site-file" },
      R_app = "radian",
      R_cmd = "R",
      bracketed_paste = true,
      -- assignment_keymap = "M-->",
      auto_start = "always",
      Rout_more_colors = true,
      open_html = "open and focus",
      open_pdf = "open and focus",
      -- pipe_keymap = "<C-S-m>",
      pdfviewer = "papers",
      close_term = true,
      editing_mode = "vi",
      hl_term = false,
      esc_term = false,
      silent_term = true,
      objbr_mappings = {
        p = "plot",
        c = "class",
        s = "summary",
        l = "length",
        v = function()
          -- Run lua functions
          require("r.browser").toggle_view()
        end,
      },

      view_df = {
        save_fun = "function(obj, obj_name) {f <- paste0('/tmp/',obj_name, '.tsv'); data.table::fwrite(obj, f, sep = '\t') ; f}",
        open_app = "kitten @ --to unix:/tmp/kitty_sock launch --type tab csvlens -d auto --colorful",
        -- open_app = "ghostty -e vd",
        -- open_app = "localc",
      },

      hook = {
        on_filetype = function()
          -- This function will be called at the FileType event
          -- of files supported by R.nvim. This is an
          -- opportunity to create mappings local to buffers.
          vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
          vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
          -- Pipe operator
          vim.api.nvim_buf_set_keymap(0, "i", ",,", " |>", {})
        end,
      },
      min_editor_width = 18,
      rconsole_width = 50,
      disable_cmds = {
        "RClearConsole",
        "RCustomStart",
        "RSPlot",
        "RSaveClose",
        "RInsertPipe",
      },
    }
    -- Check if the environment variable "R_AUTO_START" exists.
    -- If using fish shell, you could put in your config.fish:
    -- alias r "R_AUTO_START=true nvim"
    if vim.env.R_AUTO_START == "true" then
      opts.auto_start = "always"
      opts.objbr_auto_start = true
    end
    require("r").setup(opts)
  end,
}
