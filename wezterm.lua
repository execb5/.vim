local wezterm = require 'wezterm'

return {
	initial_rows = 55,
	initial_cols = 120,
	-- color_scheme = "Atelier Lakeside (base16)",
	-- color_scheme = 'terafox',
	-- color_scheme = 'rose-pine-moon',
	color_scheme = 'wal',
	color_schemes = {
		['wal'] = {
			-- BEGIN_COLORS
			background = '#160c16',
			foreground = '#e4d4da',
			ansi = {
				'#160c16',
				'#628C95',
				'#9D909D',
				'#9CA4AE',
				'#A8ADB5',
				'#D3A1A2',
				'#BBBCC4',
				'#e4d4da',
			},
			brights = {
				'#9f9498',
				'#628C95',
				'#9D909D',
				'#9CA4AE',
				'#A8ADB5',
				'#D3A1A2',
				'#BBBCC4',
				'#e4d4da',
			},
			-- END_COLORS
		},
	},
	font = wezterm.font_with_fallback {
		'Dank Mono',
		'DejaVu Sans Mono',
	},
	hide_tab_bar_if_only_one_tab = true,
	font_size = 15.0,
	keys = {
		{
			key = 'F1',
			action = wezterm.action.SendString '\x02',
		},
		{
			key = 'r',
			mods = 'CMD|SHIFT',
			action = wezterm.action.ReloadConfiguration,
		},
	},
}
