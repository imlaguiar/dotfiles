local wibox = require("wibox")
local beautiful = require("beautiful")
local utils = require("utils")
local option_widget = require("widgets.option_text")

local current_level = 50
local current_status = "on"

local set_icon = function(percentage, level)
	percentage.text = level .. "%"
end

return function()
	local percentage_text = wibox.widget({
		id = "percent_text",
		font = beautiful.font,
		align = "center",
		valign = "center",
		widget = wibox.widget.textbox,
	})

	local percentage = wibox.container.background(percentage_text)

	local widget = wibox.widget({
		option_widget("vol"),
		percentage,
		spacing = beautiful.spacing,
		layout = wibox.layout.fixed.horizontal,
	})

	widget:connect_signal("volume::update", function(_, level, status)
		if current_level ~= level or current_status ~= status then
      set_icon(percentage_text, level)
		end

		current_level = level
		current_status = status
		if current_status == "off" then
			percentage_text.text = "muted"
		end
	end)

	utils.volume.get_level(function(level, status)
    set_icon(percentage_text, level)
	end)

	return widget
end
