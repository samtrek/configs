local wezterm = require("wezterm")

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Frappe"
	else
		return "Catppuccin Latte"
	end
end

return {
	-- ...your existing config
	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.85,
	text_background_opacity = 0.3,
	font_size = 10,
	font = wezterm.font("JetbrainsMono NF"),
}
