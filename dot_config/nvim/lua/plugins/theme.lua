-- stylua: ignore
if true then return {} end

return {
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
