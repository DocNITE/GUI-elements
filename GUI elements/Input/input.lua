--[[---------------------------------------------------------]]--
--[[    Made by:       DocNight                              ]]--
--[[    Script:        GUI elements buttons                  ]]--
--[[---------------------------------------------------------]]--

local Text_Line = "_";

for i = 0, GetMaxPlayers() do
	GUI_Playa[i].Input = {};
	GUI_Playa[i].Input_title = false;
	GUI_Playa[i].Input_draws = {};
	GUI_Playa[i].Input_texture = {};
end