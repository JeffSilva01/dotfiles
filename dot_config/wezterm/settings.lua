local M = {}

function M.apply(config)
	config.default_workspace = "main"
	config.default_prog = { "/usr/bin/fish", "-l" }
	config.scrollback_lines = 4000

	config.window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	}

	config.window_decorations = "NONE"
	config.window_close_confirmation = "AlwaysPrompt"

	config.set_environment_variables = {
		TERM = "xterm-256color",
		WINIT_X11_SCALE_FACTOR = "1.0",
	}
end

return M
