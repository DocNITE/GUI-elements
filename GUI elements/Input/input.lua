--[[---------------------------------------------------------]]--
--[[    Made by:       DocNight                              ]]--
--[[    Script:        inputs                                ]]--
--[[---------------------------------------------------------]]--

local TEXT_LINE = "|";

for i = 0, GetMaxPlayers() do
	GUI_Playa[i].Input = {};
	GUI_Playa[i].Input_title = false;
	GUI_Playa[i].Input_taked = "null  yeah";
end

function GUI_KEY_FUNC_PRESSED(pid, button, nameid)
	GUI_KEY_FUNC_PRESSED_TWO(pid, button, nameid)
end

function AddInput(button)
	if button.name and button.virt_pixel and button.center and button.x and button.y and button.max_x and button.max_y and button.texture and button.text and button.rgb then
		print("Input '"..button.name.."' has been added.")
		--print(""..tostring(button.func).." ")
		for i = 0, GetMaxPlayers() do
			table.insert(GUI_Playa[i].Input, {name = button.name, virt_pixel = button.virt_pixel, center = button.center, x = button.x, y = button.y, max_x = button.max_x, max_y = button.max_y, texture = button.texture, text = button.text, rgb = button.rgb, visible = false, pressed = false})
		end
		AddButton({name = button.name.."_iput", virt_pixel = button.virt_pixel,center = 0,x = button.x,y = button.y,max_x = button.max_x,max_y = button.max_y,texture = button.texture,texture_pressed = button.texture,text = button.text,rgb = {pressed = button.rgb,unpressed = button.rgb},func = GUI_KEY_FUNC_PRESSED})
	else
		print("[ERROR]: Wrong syntax!")
	end
end

function SetTextInput(pid, button, text)
	for j, k in ipairs(GUI_Playa[pid].Input) do
		if k.name == button then
			SetNameButton(pid, button.."_iput", text)
		end
	end
end

function GetTextInput(pid, button)
	for j, k in ipairs(GUI_Playa[pid].Input) do
		if k.name == button then
			return GetNameButton(pid, button.."_iput");
		end
	end
end

function GetSizeInput(pid, input)
	for j, k in ipairs(GUI_Playa[pid].Input) do
		if k.name == input then
			return GetSizeButton(pid, input.."_iput");
		end
	end
end

function GetPosInput(pid, input)
	for j, k in ipairs(GUI_Playa[pid].Input) do
		if k.name == input then
			return GetPosButton(pid, input.."_iput");
		end
	end
end

function SetPosInput(pid, input, pix, x, y)
	for j, k in ipairs(GUI_Playa[pid].Input) do
		if k.name == input then
			SetPosButton(pid, input.."_iput", pix, x, y);
		end
	end
end

function ShowInput(pid, button)  --// Show input
	for j, k in ipairs(GUI_Playa[pid].Input) do
		if k.name == button then
			k.visible = true;
			OpenButton(pid, button.."_iput");
			local tetti = GetTextInput(pid, button);
			SetTextInput(pid, button, tetti)
			return;
		end
	end
end

function HideInput(pid, input)  --// Hide input
	for j, k in ipairs(GUI_Playa[pid].Input) do
		if k.name == input then
			k.visible = false;
			k.pressed = false;
			CloseButton(pid, button.."_iput");
			return;
		end
	end
end

OpenInput = ShowInput;
CloseInput = HideInput;

function IsInputVisible(pid, input)
	for j, k in ipairs(GUI_Playa[pid].Input) do
		if k.name == input then
			return k.visible;
		end
	end
end

--   ALARM!!!!   --

function GUI_KEY_FUNC_PRESSED_TWO(pid, button, nameid)
	local linii = string.len(nameid);
	local but_text = string.sub(nameid, 0, linii-5)
	for j, k in ipairs(GUI_Playa[pid].Input) do
		if k.visible == true then
			if k.name ~= but_text then
				k.pressed = false;
				SetTextInput(pid, but_text, GetTextInput(pid, but_text));
			elseif k.name == but_text then
				if k.pressed == true then
					SetTextInput(pid, k.name, string.gsub(GetTextInput(pid, k.name), TEXT_LINE, ""))
				end
				k.pressed = true;
				SetTextInput(pid, but_text, GetTextInput(pid, but_text)..TEXT_LINE)
			end
		end
	end
end

function GUI_KEY_WORD(pid, keydown, keyup)
	if keydown == 255 then
		return;
	end
	
	for j, k in ipairs(GUI_Playa[pid].Input) do
		if k.visible == true then
			if k.pressed == true then
				if keydown ~= KEY_BACK and keydown ~= KEY_ESCAPE and keydown ~= KEY_RETURN then
					SetTextInput(pid, k.name, string.gsub(GetTextInput(pid, k.name), TEXT_LINE, ""))
					SetTextInput(pid, k.name, GetTextInput(pid, k.name)..GetWord(pid, keydown)..TEXT_LINE)
				elseif keydown == KEY_BACK then
					local mathi_sub = string.len(string.gsub(GetTextInput(pid, k.name), TEXT_LINE, ""));
					SetTextInput(pid, k.name, string.gsub(GetTextInput(pid, k.name), TEXT_LINE, ""))
					SetTextInput(pid, k.name, string.sub(GetTextInput(pid, k.name), 0, mathi_sub-1));
					SetTextInput(pid, k.name, GetTextInput(pid, k.name)..TEXT_LINE)
				elseif keydown == KEY_ESCAPE or keydown == KEY_RETURN then
					k.pressed = false;
					SetTextInput(pid, k.name, string.gsub(GetTextInput(pid, k.name), TEXT_LINE, ""))
					--SetTextInput(pid, k.name, GetTextInput(pid, k.name));
				end
			end
		end
	end
end

function OnTakedInput(pid, nameid)
	local linii = string.len(nameid);
	local but_text = string.sub(nameid, 0, linii-5)
	for j, k in ipairs(GUI_Playa[pid].Input) do
		if k.visible == true then
				if k.pressed == true then
					SetTextInput(pid, k.name, string.gsub(GetTextInput(pid, k.name), TEXT_LINE, ""))
				end
		end
	end
	GUI_Playa[pid].Input_taked = but_text;
end

function OnMissecInput(pid)
	for j, k in ipairs(GUI_Playa[pid].Input) do
		if k.visible == true then
			if GUI_Playa[pid].Input_taked ~= k.name then
				if k.pressed == true then
					SetTextInput(pid, k.name, string.gsub(GetTextInput(pid, k.name), TEXT_LINE, ""))
					k.pressed = false;
				end
			elseif GUI_Playa[pid].Input_taked == nameid then
				GUI_Playa[pid].Input_taked = "null yeah";
			end
		end
	end
end
