local wibox = require("wibox")
local beautiful = require("beautiful")

return function(display_text)
	local text = wibox.widget({
		id = "percent_text",
		font = beautiful.font,
		align = "center",
		valign = "center",
		widget = wibox.widget.textbox,
		text = display_text .. " ",
	})

	local option = {
		text,
		fg = beautiful.fg_occupied,
		widget = wibox.container.background
	}

	local widget = wibox.widget({
		option,
		spacing = beautiful.spacing,
		layout = wibox.layout.fixed.horizontal,
	})
	return widget
end
