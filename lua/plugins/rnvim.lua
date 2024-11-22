return {
  {
    "R-nvim/R.nvim",
    lazy = false,
    opts = {
      -- Create a table with the options to be passed to setup()

      R_args = { "--quiet", "--no-save" },
      clear_line = true,
      external_term = "tmux split-window -v -l 10",
      auto_start = "on startup",
      start_libs = "base,stats,graphics,grDevices,utils,methods,tidyverse,lubridate",
      auto_quit = true,
      hook = {
        on_filetype = function()
          -- This function will be called at the FileType event
          -- of files supported by R.nvim. This is an
          -- opportunity to create mappings local to buffers.
          vim.keymap.set("n", "<C-L>", "<Plug>RDSendLine", { buffer = true })
          vim.keymap.set("v", "<C-L>", "<Plug>RSendSelection", { buffer = true })
          vim.keymap.set("i", "<C-L>", "<Esc><Plug>RSendLine i", { buffer = true })
          vim.keymap.set("i", "<C-T>", "|><enter>", { buffer = true })

          local wk = require("which-key")
          wk.add({
            buffer = true,
            { "<localleader>a", group = "all" },
            { "<localleader>b", group = "between marks" },
            { "<localleader>c", group = "chunks" },
            { "<localleader>f", group = "functions" },
            { "<localleader>g", group = "goto" },
            { "<localleader>i", group = "install" },
            { "<localleader>k", group = "knit" },
            { "<localleader>p", group = "paragraph" },
            { "<localleader>q", group = "quarto" },
            { "<localleader>r", group = "r general" },
            { "<localleader>s", group = "split or send" },
            { "<localleader>t", group = "terminal" },
            { "<localleader>v", group = "view" },
          })
        end,
      },
      pdfviewer = "",
    },
    config = function(_, opts)
      vim.g.rout_follow_colorscheme = true
      require("r").setup(opts)
      require("r.pdf.generic").open = vim.ui.open
    end,
  },
  { "R-nvim/cmp-r" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "r", "rnoweb" } },
  },

  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = { "R-nvim/cmp-r" },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "cmp_r" })
    end,
  },
}
