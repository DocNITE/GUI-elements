--[[---------------------------------------------------------]]--
--[[    Made by:       DocNight                              ]]--
--[[    Script:        GUI elements buttons                  ]]--
--[[---------------------------------------------------------]]--

for i = 0, GetMaxPlayers() do
	GUI_Playa[i].Buttons = {};
	GUI_Playa[i].Buttons_texture = {};
	GUI_Playa[i].Buttons_draws = {};
end

function InitButtons()
	for i = 0, GetMaxPlayers() do
		for j, k in ipairs(GUI_Playa[i].Buttons) do
			GUI_Playa[i].Buttons_texture[k.name] = CreateTexture(666, 666, 666, 666, "nothing")
		end
	end
end

function AddButton(button)
	if button.name and button.virt_pixel and button.center and button.x and button.y and button.max_x and button.max_y and button.texture and button.texture_pressed and button.text and button.rgb and type(button.func) == "function" then
		print("Button '"..button.name.."' has been added.")
		--print(""..tostring(button.func).." ")
		for i = 0, GetMaxPlayers() do
			table.insert(GUI_Playa[i].Buttons, {name = button.name, virt_pixel = button.virt_pixel, center = button.center, x = button.x, y = button.y, max_x = button.max_x, max_y = button.max_y, texture = button.texture, texture_pressed = button.texture_pressed, text = button.text, rgb = button.rgb, func = button.func, visible = false, pressed = false})
		end
	elseif button.name and button.x and button.y and button.max_x and button.max_y and button.texture and button.texture_pressed and button.text and button.rgb then
		print("Button '"..button.name.."' has been added.")
		for i = 0, GetMaxPlayers() do
			table.insert(GUI_Playa[i].Buttons, {name = button.name, virt_pixel = button.virt_pixel, center = button.center, x = button.x, y = button.y, max_x = button.max_x, max_y = button.max_y, texture = button.texture, texture_pressed = button.texture_pressed, text = button.text, rgb = button.rgb, func = false, visible = false, pressed = false})
		end
	else
		print("[ERROR]: Wrong syntax!")
	end
end

function DestroyButton(button)
	--GUI_Playa[i].Buttons[button]
end

function GetPressedButton(pid, button)
	for j, k in ipairs(GUI_Playa[pid].Buttons) do
		if k.name == button then
			return k.pressed;
		end
	end
end

function SetNameButton(pid, button, nameid)
	for j, k in ipairs(GUI_Playa[pid].Buttons) do
		if k.name == button then
			k.text = nameid;
			if k.virt_pixel == 0 then
				UpdatePlayerDraw(pid, GUI_Playa[pid].Buttons_draws[button], anx(pid, (k.x + 4)), any(pid, (k.max_y - ((k.max_y - k.y)/1.5))), nameid, "Font_Old_10_White_Hi.tga", k.rgb.pressed[1], k.rgb.pressed[2], k.rgb.pressed[3], k.rgb.pressed[4])
			else
				UpdatePlayerDraw(pid, GUI_Playa[pid].Buttons_draws[button], (k.x + 20), (k.max_y - ((k.max_y - k.y)/1.5)), nameid, "Font_Old_10_White_Hi.tga", k.rgb.pressed[1], k.rgb.pressed[2], k.rgb.pressed[3], k.rgb.pressed[4])
			end
		end
	end
end

function GetNameButton(pid, button)
	for j, k in ipairs(GUI_Playa[pid].Buttons) do
		if k.name == button then
			return k.text;
		end
	end
end

function GetSizeButton(pid, button)
	for j, k in ipairs(GUI_Playa[pid].Buttons) do
		if k.name == button then
			return (k.max_x - k.x), (k.max_y - k.y);
		end
	end
end

function GetPosButton(pid, button)
	for j, k in ipairs(GUI_Playa[pid].Buttons) do
		if k.name == button then
			return (k.x), (k.y);
		end
	end
end

function SetPosButton(pid, button, pix, x, y)
	for j, k in ipairs(GUI_Playa[pid].Buttons) do
		if k.name == button then
			if pix == 1 then
				local size_x, size_y = GetSizeButton(pid, button);
				k.max_x = x + size_x
				k.max_y = y + size_y
				k.x = x;
				k.y = y;
			end
		end
	end
end

function ShowButton(pid, button)  --// Show button
	for j, k in ipairs(GUI_Playa[pid].Buttons) do
		if k.name == button then
			k.visible = true;
			ShowTexture(pid, GUI_Playa[pid].Buttons_texture[button])
			if k.virt_pixel == 0 then
				GUI_Playa[pid].Buttons_draws[button] = CreatePlayerDraw(pid, anx(pid, (k.x + 4)), any(pid, (k.max_y - ((k.max_y - k.y)/1.5))), k.text, "Font_Old_10_White_Hi.tga", 255, 255, 255)
				ShowPlayerDraw(pid, GUI_Playa[pid].Buttons_draws[button])
				if k.texture == "NULL" then
					UpdateTexture(GUI_Playa[pid].Buttons_texture[button], 0, 0, 0, 0, k.texture)
				else
					UpdateTexture(GUI_Playa[pid].Buttons_texture[button], anx(pid, k.x), any(pid, k.y), anx(pid, k.max_x), any(pid ,k.max_y), k.texture)
				end
				
				local stling = string.len(k.text)*10;
				if k.center == 1 then
					SetPlayerDrawPos(pid, GUI_Playa[pid].Buttons_draws[button], anx(pid, (k.max_x - (k.max_x - k.x)/2) - ((stling)/2)), any(pid, (k.max_y - ((k.max_y - k.y)/1.5))))
				end
				
			else
				GUI_Playa[pid].Buttons_draws[button] = CreatePlayerDraw(pid, (k.x + 20), (k.max_y - ((k.max_y - k.y)/1.5)), k.text, "Font_Old_10_White_Hi.tga", 255, 255, 255)
				ShowPlayerDraw(pid, GUI_Playa[pid].Buttons_draws[button])
				if k.texture == "NULL" then
					UpdateTexture(GUI_Playa[pid].Buttons_texture[button], 0, 0, 0, 0, k.texture)
				else
					UpdateTexture(GUI_Playa[pid].Buttons_texture[button], k.x, k.y, k.max_x, k.max_y, k.texture)
				end
				
				local stling = string.len(k.text)*50;
				if k.center == 1 then
					SetPlayerDrawPos(pid, GUI_Playa[pid].Buttons_draws[button], ((k.max_x - (k.max_x - k.x)/2) - ((stling)/2)), (k.max_y - ((k.max_y - k.y)/1.5)))
				end
			end
			return;
		end
	end
end

function HideButton(pid, button)  --// Hide button
	for j, k in ipairs(GUI_Playa[pid].Buttons) do
		if k.name == button then
			k.visible = false;
			HideTexture(pid, GUI_Playa[pid].Buttons_texture[button])
			HidePlayerDraw(pid, GUI_Playa[pid].Buttons_draws[button])
			DestroyPlayerDraw(pid, GUI_Playa[pid].Buttons_draws[button])
			return;
		end
	end
end

-- Hook --
OpenButton = ShowButton;
CloseButton = HideButton;

function IsButtonVisible(pid, button)
	for j, k in ipairs(GUI_Playa[pid].Buttons) do
		if k.name == button then
			return k.visible;
		end
	end
end

require "GUI elements/Buttons/button_table"