return {
  "geg2102/nvim-python-repl",
  ft = { "python", "lua", "scala" },
  config = function()
    require("nvim-python-repl").setup({
      execute_on_send = true,
      vsplit = true,
      spawn_command = {
        python = "ptpython",
      },
    })
    vim.keymap.set("n", "<Enter>", function()
      require("nvim-python-repl").send_statement_definition()
    end, { desc = "Send semantic unit to REPL" })

    vim.keymap.set("v", "<localleader>v", function()
      require("nvim-python-repl").send_visual_to_repl()
    end, { desc = "Send visual selection to REPL" })

    vim.keymap.set("n", "<localleader>b", function()
      require("nvim-python-repl").send_buffer_to_repl()
    end, { desc = "Send entire buffer to REPL" })

    vim.keymap.set("n", "<localleader>t", function()
      require("nvim-python-repl").toggle_execute()
    end, { desc = "Automatically execute command in REPL after sent" })

    vim.keymap.set("n", "<space>rv", function()
      require("nvim-python-repl").toggle_vertical()
    end, { desc = "Create REPL in vertical or horizontal split" })

    vim.keymap.set("n", "<localleader>ra", function()
      require("nvim-python-repl").open_repl()
    end, { desc = "Opens the REPL in a window split" })
  end,
}
