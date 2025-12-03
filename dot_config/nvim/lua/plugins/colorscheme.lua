return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent_mode = true,
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      float = {
        transparent = true, -- enable transparent floating windows
        solid = true, -- use solid styling for floating windows, see |winborder|
      },
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-mocha",
      colorscheme = "gruvbox",
    },
  },
}
