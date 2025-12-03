local wezterm = require("wezterm")

local M = {}

function M.dump(tbl)
	print(wezterm.json_encode(tbl))
end

return M
