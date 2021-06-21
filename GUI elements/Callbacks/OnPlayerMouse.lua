--[[---------------------------------------------------------]]--
--[[    Made by:       DocNight                              ]]--
--[[    Script:        GUI callbacks                         ]]--
--[[---------------------------------------------------------]]--

function OnPlayerMouse(playerid, button, pressed, posX, posY)
	local p_posX = posX;
	local p_posY = posY;
	for j, k in ipairs(GUI_Playa[playerid].Buttons) do
		if k.visible == true then 
			if pressed == 0 then
				if k.virt_pixel == 1 then
					SetPlayerDrawPos(playerid, GUI_Playa[playerid].Buttons_draws[k.name], (k.x + 20), (k.max_y - ((k.max_y - k.y)/1.5)))
					if k.center == 1 then
						local stling = string.len(k.text)*50;
						SetPlayerDrawPos(playerid, GUI_Playa[playerid].Buttons_draws[k.name], ((k.max_x - (k.max_x - k.x)/2) - ((stling)/2)), (k.max_y - ((k.max_y - k.y)/1.5)))
					end
					SetPlayerDrawColor(playerid, GUI_Playa[playerid].Buttons_draws[k.name], k.rgb.unpressed[1], k.rgb.unpressed[2], k.rgb.unpressed[3], k.rgb.unpressed[4])
					if k.texture == "NULL" then
						UpdateTexture(GUI_Playa[playerid].Buttons_texture[k.name], 0, 0, 0, 0, k.texture)
					else
						UpdateTexture(GUI_Playa[playerid].Buttons_texture[k.name], k.x, k.y, k.max_x, k.max_y, k.texture)
					end
				else
					SetPlayerDrawPos(playerid, GUI_Playa[playerid].Buttons_draws[k.name], anx(playerid, (k.x + 4)), any(playerid, (k.max_y - ((k.max_y - k.y)/1.5))))
					if k.center == 1 then
						local stling = string.len(k.text)*10;
						SetPlayerDrawPos(playerid, GUI_Playa[playerid].Buttons_draws[k.name], anx(playerid, (k.max_x - (k.max_x - k.x)/2) - ((stling)/2)), any(playerid, (k.max_y - ((k.max_y - k.y)/1.5))))
					end
					SetPlayerDrawColor(playerid, GUI_Playa[playerid].Buttons_draws[k.name], k.rgb.unpressed[1], k.rgb.unpressed[2], k.rgb.unpressed[3], k.rgb.unpressed[4])
					if k.texture == "NULL" then
						UpdateTexture(GUI_Playa[playerid].Buttons_texture[k.name], 0, 0, 0, 0, k.texture)
					else
						UpdateTexture(GUI_Playa[playerid].Buttons_texture[k.name], anx(playerid, k.x), any(playerid, k.y), anx(playerid, k.max_x), any(playerid ,k.max_y), k.texture)
					end
				end
				k.pressed = false;
			end
			if k.virt_pixel == 0 then
				posX = nax(playerid, posX);
				posY = nay(playerid, posY);
			else
				posX = p_posX;
				posY = p_posY;
			end
			if k.x < posX and k.y < posY and k.max_x > posX and k.max_y > posY then
				OnTakedInput(playerid, k.name);
				if pressed == 1 then
					if k.virt_pixel == 1 then
						SetPlayerDrawPos(playerid, GUI_Playa[playerid].Buttons_draws[k.name], (k.x + 33), (k.max_y - ((k.max_y - k.y)/1.5)+12))
						if k.center == 1 then
							local stling = string.len(k.text)*50;
							SetPlayerDrawPos(playerid, GUI_Playa[playerid].Buttons_draws[k.name], ((k.max_x - (k.max_x - k.x)/2) - ((stling)/2)+33), (k.max_y - ((k.max_y - k.y)/1.5))+12)
						end
						SetPlayerDrawColor(playerid, GUI_Playa[playerid].Buttons_draws[k.name], k.rgb.pressed[1], k.rgb.pressed[2], k.rgb.pressed[3], k.rgb.pressed[4])
						if k.texture == "NULL" then
							UpdateTexture(GUI_Playa[playerid].Buttons_texture[k.name], 0, 0, 0, 0, k.texture_pressed)
						else
							UpdateTexture(GUI_Playa[playerid].Buttons_texture[k.name], k.x, k.y, k.max_x, k.max_y, k.texture_pressed)
						end
					else
						SetPlayerDrawPos(playerid, GUI_Playa[playerid].Buttons_draws[k.name], anx(playerid, (k.x + 6)), any(playerid, (k.max_y - ((k.max_y - k.y)/1.5)+1)))
						if k.center == 1 then
							local stling = string.len(k.text)*10;
							SetPlayerDrawPos(playerid, GUI_Playa[playerid].Buttons_draws[k.name], anx(playerid, (k.max_x - (k.max_x - k.x)/2) - ((stling)/2) + 6), any(playerid, (k.max_y - ((k.max_y - k.y)/1.5))+1))
						end
						SetPlayerDrawColor(playerid, GUI_Playa[playerid].Buttons_draws[k.name], k.rgb.pressed[1], k.rgb.pressed[2], k.rgb.pressed[3], k.rgb.pressed[4])
						if k.texture == "NULL" then
							UpdateTexture(GUI_Playa[playerid].Buttons_texture[k.name], 0, 0, 0, 0, k.texture_pressed)
						else
							UpdateTexture(GUI_Playa[playerid].Buttons_texture[k.name], anx(playerid, k.x), any(playerid, k.y), anx(playerid, k.max_x), any(playerid ,k.max_y), k.texture_pressed)
						end
					end
				elseif pressed == 0 then
					if k.virt_pixel == 1 then
						SetPlayerDrawPos(playerid, GUI_Playa[playerid].Buttons_draws[k.name], (k.x + 20), (k.max_y - ((k.max_y - k.y)/1.5)))
						if k.center == 1 then
							local stling = string.len(k.text)*50;
							SetPlayerDrawPos(playerid, GUI_Playa[playerid].Buttons_draws[k.name], ((k.max_x - (k.max_x - k.x)/2) - ((stling)/2)), (k.max_y - ((k.max_y - k.y)/1.5)))
						end
						SetPlayerDrawColor(playerid, GUI_Playa[playerid].Buttons_draws[k.name], k.rgb.unpressed[1], k.rgb.unpressed[2], k.rgb.unpressed[3], k.rgb.unpressed[4])
						if k.texture == "NULL" then
							UpdateTexture(GUI_Playa[playerid].Buttons_texture[k.name], 0, 0, 0, 0, k.texture)
						else
							UpdateTexture(GUI_Playa[playerid].Buttons_texture[k.name], k.x, k.y, k.max_x, k.max_y, k.texture)
						end
					else
						SetPlayerDrawPos(playerid, GUI_Playa[playerid].Buttons_draws[k.name], anx(playerid, (k.x + 4)), any(playerid, (k.max_y - ((k.max_y - k.y)/1.5))))
						if k.center == 1 then
							local stling = string.len(k.text)*10;
							SetPlayerDrawPos(playerid, GUI_Playa[playerid].Buttons_draws[k.name], anx(playerid, (k.max_x - (k.max_x - k.x)/2) - ((stling)/2)), any(playerid, (k.max_y - ((k.max_y - k.y)/1.5))))
						end
						SetPlayerDrawColor(playerid, GUI_Playa[playerid].Buttons_draws[k.name], k.rgb.unpressed[1], k.rgb.unpressed[2], k.rgb.unpressed[3], k.rgb.unpressed[4])
						if k.texture == "NULL" then
							UpdateTexture(GUI_Playa[playerid].Buttons_texture[k.name], 0, 0, 0, 0, k.texture)
						else
							UpdateTexture(GUI_Playa[playerid].Buttons_texture[k.name], anx(playerid, k.x), any(playerid, k.y), anx(playerid, k.max_x), any(playerid ,k.max_y), k.texture)
						end
					end
					if k.func ~= false then
						k.func(playerid, button, k.name); --// call function
					end
					k.pressed = true;
				end
			end
			OnMissecInput(playerid, k.name);
			posX = p_posX;
			posY = p_posY;
		end
	end
end