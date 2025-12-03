local wezterm = require("wezterm")

local colors = {
	bg1 = "#3c3836",
	fg = "#ebdbb2",
	orange = "#d65d0e",
	blue = "#458588",
	green = "#98971a",
	yellow = "#d79921",
	aqua = "#689d6a",
}

local M = {}

function M.apply(config)
	config.status_update_interval = 1

	wezterm.on("update-right-status", function(window, pane)
		local workspace = window:active_workspace()
		local host = wezterm.hostname()
		local date = wezterm.strftime("%H:%M")
		local proc = pane:get_foreground_process_name() or "?"
		proc = proc:match("([^/]+)$")

		local prefix = window:leader_is_active() and " ⌨ PREFIX " or ""

		window:set_right_status(wezterm.format({
			{ Background = { Color = colors.bg1 } },
			{ Foreground = { Color = colors.orange } },
			{ Text = " " .. prefix .. " " },

			{ Foreground = { Color = colors.blue } },
			{ Text = " " .. workspace .. "  " },

			{ Foreground = { Color = colors.green } },
			{ Text = "󰆍 " .. proc .. "  " },

			{ Foreground = { Color = colors.yellow } },
			{ Text = "󰇥 " .. host .. "  " },

			{ Foreground = { Color = colors.aqua } },
			{ Text = " " .. date .. " " },
		}))
	end)
end

return M
