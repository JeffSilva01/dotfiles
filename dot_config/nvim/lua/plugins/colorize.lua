return {
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      user_default_options = {
        RGB = true, -- #RGB
        RRGGBB = true, -- #RRGGBB
        names = false, -- "red", "blue", etc
        tailwind = false,
        mode = "background", -- ou "foreground"
      },
    },
  },
}
