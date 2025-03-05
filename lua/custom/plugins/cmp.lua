return {
  {
    'saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {},
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      { 'rafamadriz/friendly-snippets' },
      { 'R-nvim/cmp-r' },
      { 'jmbuhr/otter.nvim', dependencies = {
        'nvim-treesitter/nvim-treesitter',
      } },
    },
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'cmp_r', 'otter' },
        providers = {
          cmp_r = {
            name = 'cmp_r',
            module = 'blink.compat.source',
            opts = {},
          },
          otter = {
            name = 'otter',
            module = 'blink.compat.source',
            opts = {},
          },
        },
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
  },
}
