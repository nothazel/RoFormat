-- Example usage on a module 
--[[
local Module = require(path.to.module)
local TextLabel = MainFrame.TextHolder.TextLabel
local Text = "This is an **example** text that utilizes bold format type."
TextLabel.Text = Module.formatText(Text)
]]


local module = {}

function module.formatText(text)
	local formattedText = text

	-- Bold: Enclose text in double asterisks ** to make it bold
	-- Example: This is **bold** text
	formattedText = string.gsub(formattedText, "%*%*(.-)%*%*", "<b>%1</b>")

	-- Italic: Enclose text in underscores _ to make it italic
	-- Example: This is _italic_ text
	formattedText = string.gsub(formattedText, "_(.-)_", "<i>%1</i>")

	-- Underline: Enclose text in double underscores __ to make it underlined
	-- Example: This is __underlined__ text
	formattedText = string.gsub(formattedText, "__(.-)__", "<u>%1</u>")

	-- Strikethrough: Enclose text in tildes ~ to make it strikethrough
	-- Example: This is ~strikethrough~ text
	formattedText = string.gsub(formattedText, "~(.-)~", "<s>%1</s>")

	-- Color: Use a [color] tag with a color attribute to specify the color of the text
	-- Example: This is [color=#FF0000]colored[/color] or [color=rgb(255,0,0)]colored[/color]
	formattedText = string.gsub(formattedText, "%[color=(.-)%](.-)%[/color%]", function(color, text)
		return "<font color=\"" .. color .. "\">" .. text .. "</font>"
	end)

	-- List: Start a line with a hyphen - followed by a space to create a list item
	-- Example: This is a list:\n- Item 1\n- Item 2\n- Item 3
	formattedText = string.gsub(formattedText, "%- (.-)\n", "• %1\n")

	-- Code: Enclose text in triple backticks ``` to make it a code snippet
	-- Example: This is a code snippet:\n```\nlocal x = 1 + 2\n```
	formattedText = string.gsub(formattedText, "```\n(.-)```", function(code)
		return "<font face=\"RobotoMono\" size=\"8\">" .. code .. "</font>"
	end)

	return formattedText
end

return module
