-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ~/.config/nvim/lua/plugins/snacks_explorer.lua
return {
  "folke/snacks.nvim",
  opts = {
    -- Ensure the explorer extension is enabled
    explorer = {
      enabled = true,
    },

    -- Configure the picker that drives the explorer
    picker = {
      sources = {
        explorer = {
          hidden = true, -- show all dotfiles
          ignored = true, -- show files even if git-ignored
          -- exclude = { -- still hide these entries
          --   "node_modules",
          --   ".git",
          -- },
        },
      },
    },
  },
}
