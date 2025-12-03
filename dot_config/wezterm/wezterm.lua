-- Módulos separados
local theme = require("theme")
local statusbar = require("statusbar")
local navigation = require("navigation")
local tabs = require("tabs")
local keymaps = require("keymaps")
local settings = require("settings")

-- Config principal
local config = {}

-- Carregar módulos
theme.apply(config)
statusbar.apply(config)
navigation.apply(config)
tabs.apply(config)
keymaps.apply(config)
settings.apply(config)

return config
