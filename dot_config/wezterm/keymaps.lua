local wezterm = require("wezterm")
local M = {}

function M.apply(config)
	config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }

	config.keys = config.keys or {}

	-- Copiar
	table.insert(config.keys, {
		key = "C",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CopyTo("Clipboard"),
	})

	-- Colar
	table.insert(config.keys, {
		key = "v",
		mods = "CTRL",
		action = wezterm.action.PasteFrom("Clipboard"),
	})

	-- Nova aba
	table.insert(config.keys, {
		key = "c",
		mods = "LEADER",
		action = wezterm.action.SpawnCommandInNewTab({ args = { "/usr/bin/fish" } }),
	})

	-- Zoom de pane
	table.insert(config.keys, {
		key = "z",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	})

	-- Split Horizonta
	table.insert(config.keys, {
		key = "|",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal,
	})

	-- Split Vertical
	table.insert(config.keys, {
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical,
	})

	-- Reload config
	table.insert(config.keys, { key = "r", mods = "LEADER", action = wezterm.action.ReloadConfiguration })

	-- Pane Select (swap)
	table.insert(
		config.keys,
		{ key = "v", mods = "ALT", action = wezterm.action.PaneSelect({ mode = "SwapWithActive" }) }
	)
end

return M
