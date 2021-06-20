--[[---------------------------------------------------------]]--
--[[    Made by:       DocNight                              ]]--
--[[    Script:        GUI elements framework (buttons)      ]]--
--[[    version:       GMP 1.4.0 and later                   ]]--
--[[---------------------------------------------------------]]--

GUI_Playa = {}

for i = 0, GetMaxPlayers() do
	GUI_Playa[i] = {}
	GUI_Playa[i].IsOpen = false
end

require "Doc Engine/GUI elements/functions"
require "Doc Engine/GUI elements/Buttons/button"
require "Doc Engine/GUI elements/Textbox/textbox"
require "Doc Engine/GUI elements/Callbacks/OnPlayerMouse"

function InitHundler()
	InitButtons()
	InitTextBox()
end
addEvent("OnGamemodeInit", InitHundler)

print("-=================================-\n        GUI elements v0.1")