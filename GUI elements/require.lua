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

require "GUI elements/functions"
require "GUI elements/Buttons/button"
require "GUI elements/Textbox/textbox"
require "GUI elements/Callbacks/OnPlayerMouse"

function InitElements() --// Вставьте в OnGamemodeInit()
	InitButtons()
	InitTextBox()
end


print("-=================================-\n        GUI elements v0.1")