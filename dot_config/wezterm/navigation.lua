local wezterm = require("wezterm")
local M = {}

local directions = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function is_vim(pane)
	local info = pane:get_foreground_process_info()
	local name = info and info.name
	return name == "nvim" or name == "vim"
end

local function nav(mode, key)
	return {
		key = key,
		mods = (mode == "resize") and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				win:perform_action({
					SendKey = { key = key, mods = (mode == "resize") and "META" or "CTRL" },
				}, pane)
				return
			end

			if mode == "resize" then
				win:perform_action({ AdjustPaneSize = { directions[key], 3 } }, pane)
			else
				win:perform_action({ ActivatePaneDirection = directions[key] }, pane)
			end
		end),
	}
end

function M.apply(config)
	config.keys = config.keys or {}

	for _, key in ipairs({ "h", "j", "k", "l" }) do
		table.insert(config.keys, nav("move", key))
		table.insert(config.keys, nav("resize", key))
	end
end

return M
