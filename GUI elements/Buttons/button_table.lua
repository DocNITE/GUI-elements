--[[---------------------------------------------------------]]--
--[[    Made by:       DocNight                              ]]--
--[[    Script:        Table file (not optional)             ]]--
--[[---------------------------------------------------------]]--
--[[    Сюда вы можете добавлять свои кнопки, а также        ]]--
--[[    привязывать функции. Это не обязательно, скорее      ]]--
--[[    Это для удобства. Такие дела. =)                     ]]--
--[[                                                         ]]--
--[[    Вы можете добавлять их и в других файлах,            ]]--
--[[	даже в ГМе.											 ]]--
--[[                                                         ]]--
--[[    Открывать курсор желательно через OpenCursor();      ]]--
--[[    Закрывать так же через CloseCursor();                ]]--
--[[---------------------------------------------------------]]--

function TestFunction(playerid, button, id) 
	if IsButtonVisible(playerid, "CHECK_HP") == false and IsButtonVisible(playerid, "CLOSE_BUTTONS") == false then
		SendPlayerMessage(playerid, 0, 255, 0, "Хей, ты открыл кнопки! =)")
		OpenButton(playerid, "CHECK_HP")    
		OpenButton(playerid, "CLOSE_BUTTONS")
		OpenButton(playerid, "CLEAR_CHAT")
	end
end

function ZacritKnopki(playerid, button, id)
	SendPlayerMessage(playerid, 255, 0, 0, "Вы спрятали кнопки! =(")
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
	name = "mu",   						   	  --// Имя кнопки, в качестве индефикатора.
	virt_pixel = 0,
	x = 200,
	y = 47,
	max_x = 284,  							  --// Размещение текстуры. X и Y - начальные точки, MAX_X и MAX_Y - конечные точки.
	max_y = 84,
	texture = "button",   				      --// Отображаемая текстура, когда она не нажата.
	texture_pressed = "button_highlighted",   --// Текстура кнопки, когда она зажата кнопкой.
	text = "Open",    						  --// Отображаемый текст. Если не обязателен, то просто сделайте пустое поле " ".
	rgb = 
	{
		pressed = {230, 100, 100, 230},       --// Цвета в двух режимах: при нажатии и нет. Четвертый аргумент - это alpha канал, отвечает за прозрачность.
		unpressed = {255, 255, 255, 230}
	},
	func = TestFunction,   					  --// Вызываемая функция кнопкой. Если не нужно вызывать, то просто уберите эту строку.
})

function CheckHealPoint(playerid, button, id)
	SendPlayerMessage(playerid, 255, 255, 255, " Здоровья: "..GetPlayerHealth(playerid)..", Макс. здоровья: "..GetPlayerMaxHealth(playerid))
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