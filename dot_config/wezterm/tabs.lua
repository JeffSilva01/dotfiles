local wezterm = require("wezterm")
local M = {}

function M.apply(config)
	config.use_fancy_tab_bar = false
	config.tab_bar_at_bottom = true
	config.enable_tab_bar = true

	config.keys = config.keys or {}

	-- Navegação estilo tmux
	table.insert(config.keys, { key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) })
	table.insert(config.keys, { key = "p", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) })

	-- Renomear aba
	table.insert(config.keys, {
		key = ",",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Renomear aba",
			action = wezterm.action_callback(function(win, pane, line)
				if line then
					win:perform_action(wezterm.action.RenameTab(line), pane)
				end
			end),
		}),
	})

	-- Fechar aba
	table.insert(config.keys, {
		key = "x",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	})

	-- Leader + número
	for i = 1, 9 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "LEADER",
			action = wezterm.action.ActivateTab(i - 1),
		})
	end
end

return M
