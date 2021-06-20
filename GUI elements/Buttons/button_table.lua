--[[---------------------------------------------------------]]--
--[[    Made by:       DocNight                              ]]--
--[[    Script:        Table file (not optional)             ]]--
--[[---------------------------------------------------------]]--
--[[    ���� �� ������ ��������� ���� ������, � �����        ]]--
--[[    ����������� �������. ��� �� �����������, ������      ]]--
--[[    ��� ��� ��������. ����� ����. =)                     ]]--
--[[                                                         ]]--
--[[    �� ������ ��������� �� � � ������ ������,            ]]--
--[[	���� � ���.											 ]]--
--[[                                                         ]]--
--[[    ��������� ������ ���������� ����� OpenCursor();      ]]--
--[[    ��������� ��� �� ����� CloseCursor();                ]]--
--[[---------------------------------------------------------]]--

function TestFunction(playerid, button, id) 
	if IsButtonVisible(playerid, "CHECK_HP") == false and IsButtonVisible(playerid, "CLOSE_BUTTONS") == false then
		SendPlayerMessage(playerid, 0, 255, 0, "���, �� ������ ������! =)")
		OpenButton(playerid, "CHECK_HP")    
		OpenButton(playerid, "CLOSE_BUTTONS")
		OpenButton(playerid, "CLEAR_CHAT")
	end
end

function ZacritKnopki(playerid, button, id)
	SendPlayerMessage(playerid, 255, 0, 0, "�� �������� ������! =(")
	CloseButton(playerid, "CHECK_HP")
	CloseButton(playerid, "CLOSE_BUTTONS")
	CloseButton(playerid, "CLEAR_CHAT")
	if IsTextBoxVisible(playerid, "Test") == true then
		CloseTextBox(playerid, "Test")
	end
end

function ClearChat(playerid, button, id)
	for i = 0, 32 do
		SendPlayerMessage(playerid, 255, 0, 0, " ")
	end
	if IsTextBoxVisible(playerid, "Test") == false then
		OpenTextBox(playerid, "Test")
	end
end

AddButton({
	name = "mu",   						   	  --// ��� ������, � �������� ������������.
	virt_pixel = 0,
	x = 200,
	y = 47,
	max_x = 284,  							  --// ���������� ��������. X � Y - ��������� �����, MAX_X � MAX_Y - �������� �����.
	max_y = 84,
	texture = "button",   				      --// ������������ ��������, ����� ��� �� ������.
	texture_pressed = "button_highlighted",   --// �������� ������, ����� ��� ������ �������.
	text = "Open",    						  --// ������������ �����. ���� �� ����������, �� ������ �������� ������ ���� " ".
	rgb = 
	{
		pressed = {230, 100, 100, 230},       --// ����� � ���� �������: ��� ������� � ���. ��������� �������� - ��� alpha �����, �������� �� ������������.
		unpressed = {255, 255, 255, 230}
	},
	func = TestFunction,   					  --// ���������� ������� �������. ���� �� ����� ��������, �� ������ ������� ��� ������.
})

function CheckHealPoint(playerid, button, id)
	SendPlayerMessage(playerid, 255, 255, 255, " ��������: "..GetPlayerHealth(playerid)..", ����. ��������: "..GetPlayerMaxHealth(playerid))
end

AddButton({
	name = "CHECK_HP",
	virt_pixel = 1,
	center = 1,
	x = 2500,
	y = 500,
	max_x = 3000,
	max_y = 900,
	texture = "button",
	texture_pressed = "button_highlighted",
	text = "Check HP",
	rgb = 
	{
		pressed = {230, 100, 100, 230},
		unpressed = {255, 255, 255, 230}
	},
	func = CheckHealPoint,
})

AddButton({
	name = "CLOSE_BUTTONS",
	virt_pixel = 1,
	center = 0,
	x = 2000,
	y = 500,
	max_x = 2500,
	max_y = 900,
	texture = "button",
	texture_pressed = "button_highlighted",
	text = "Close",
	rgb = 
	{
		pressed = {230, 100, 100, 230},
		unpressed = {255, 255, 255, 230}
	},
	func = ZacritKnopki,
})

AddButton({
	name = "CLEAR_CHAT",
	virt_pixel = 1,
	center = 0,
	x = 3000,
	y = 500,
	max_x = 3500,
	max_y = 900,
	texture = "button",
	texture_pressed = "button_highlighted",
	text = "Clear",
	rgb = 
	{
		pressed = {230, 100, 100, 230},
		unpressed = {255, 255, 255, 230}
	},
	func = ClearChat,
})