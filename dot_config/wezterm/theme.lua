local wezterm = require("wezterm")

local M = {}

function M.apply(config)
	config.color_scheme = "GruvboxDarkHard"

	config.colors = {
		tab_bar = {
			background = "#1d2021",

			active_tab = {
				bg_color = "#504945",
				fg_color = "#ebdbb2",
				intensity = "Bold",
			},

			inactive_tab = {
				bg_color = "#3c3836",
				fg_color = "#ebdbb2",
			},

			inactive_tab_hover = {
				bg_color = "#504945",
				fg_color = "#d79921",
				italic = true,
			},

			new_tab = {
				bg_color = "#3c3836",
				fg_color = "#98971a",
			},

			new_tab_hover = {
				bg_color = "#504945",
				fg_color = "#d79921",
				italic = true,
			},
		},
	}

	config.inactive_pane_hsb = {
		saturation = 0.5, -- diminui um pouco a saturação
		brightness = 0.4, -- escurece bastante o pane inativo
	}

	config.window_background_opacity = 0.95
	config.font = wezterm.font("JetBrains Mono")
	config.font_size = 13.5
end

return M
