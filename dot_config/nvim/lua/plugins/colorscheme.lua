return {
  "rose-pine/neovim",
  name = "rose-pine",
  opts = {
    variant = "main", -- Ou "main", "dawn", "auto"
    styles = {
      bold = true,
      italic = true,
      transparency = false, -- ATIVE A TRANSPARÊNCIA AQUI
    },
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    -- Opcional: Ajustar a opacidade se o seu terminal permitir
    -- Alguns terminais precisam de configurações extras no próprio terminal
  },
  config = function(_, opts)
    require("rose-pine").setup(opts)
    vim.cmd("colorscheme rose-pine-moon") -- Ou a variante que você preferir
  end,
}
