--[[---------------------------------------------------------]]--
--[[    Made by:       DocNight                              ]]--
--[[    Script:        GUI elements framework (buttons)      ]]--
--[[    version:       GMP 1.4.0 and later                   ]]--
--[[---------------------------------------------------------]]--

local GUI_VERSION = "0.4";

GUI_Playa = {}

for i = 0, GetMaxPlayers() do
	GUI_Playa[i] = {}
	GUI_Playa[i].IsOpen = false
end

require "GUI elements/constants"

-- Menu --
require "GUI elements/functions"
require "GUI elements/Buttons/button"
require "GUI elements/Textbox/textbox"
-- Key --
require "GUI elements/Input/key"
require "GUI elements/Input/input"
-- Bar --
require "GUI elements/Bar/bar"

require "GUI elements/Callbacks/OnPlayerMouse"

function InitElements() --// Вставьте в OnGamemodeInit()
	InitButtons();
	InitTextBox();
	InitBars();
end

function KeyElements(pID, pKeyDown, pKeyUp) --// Вставьте в OnPlayerKey()
	GUI_KEY_WORD(pID, pKeyDown, pKeyUp);
	GUI_KEY_PRESSED(pID, pKeyDown, pKeyUp);
end


print("-=================================-\n        GUI elements v"..GUI_VERSION)