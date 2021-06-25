--[[---------------------------------------------------------]]--
--[[    Made by:       DocNight                              ]]--
--[[    Script:        GUI elements menu box                 ]]--
--[[---------------------------------------------------------]]--

for i = 0, GetMaxPlayers() do
	GUI_Playa[i].TextBox = {};
	GUI_Playa[i].TextBox_texture = {};
	GUI_Playa[i].TextBox_draws = {};
end

function InitTextBox()
	for i = 0, GetMaxPlayers() do
		for j, k in ipairs(GUI_Playa[i].TextBox) do
			GUI_Playa[i].TextBox_texture[k.name] = CreateTexture(666, 666, 666, 666, "nothing")
		end
	end
end

function AddTextBox(box)
	if box.name and box.virt_pixel and box.x and box.y and box.max_x and box.max_y and box.texture and box.center and box.text then
		print("Text box '"..box.name.."' has been added.")
		for i = 0, GetMaxPlayers() do
			table.insert(GUI_Playa[i].TextBox, {name = box.name, virt_pixel = box.virt_pixel, x = box.x, y = box.y, max_x = box.max_x, max_y = box.max_y, texture = box.texture, center = box.center, text = box.text, rgb = box.rgb, visible = false})
		end
	else
		print("[ERROR]: Wrong syntax!")
	end
end

function ShowTextBox(pid, box)
	for j, k in ipairs(GUI_Playa[pid].TextBox) do
		if k.name == box then
			k.visible = true;
			local Palas = k.center;
			ShowTexture(pid, GUI_Playa[pid].TextBox_texture[box])
			local hight = k.y;
			local weight = k.x;
			local max_weight = k.max_x;
			local rgb = k.rgb;
			GUI_Playa[pid].TextBox_draws[box] = {}
			if k.virt_pixel == 0 then
				hight = hight - 10
				for j, k in ipairs(k.text) do
					hight = hight + 24
					local stling = string.len(k)*10
					GUI_Playa[pid].TextBox_draws[box][j] = CreatePlayerDraw(pid, anx(pid, (weight + 4)), any(pid, hight), k, "Font_Old_10_White_Hi.tga", rgb[1], rgb[2], rgb[3], rgb[4])
					ShowPlayerDraw(pid, GUI_Playa[pid].TextBox_draws[box][j])
					
					if Palas == 1 then
						SetPlayerDrawPos(pid, GUI_Playa[pid].TextBox_draws[box][j], anx(pid, (max_weight - (max_weight - weight)/2) - ((stling)/2)), any(pid, hight))
					end
				end
				if k.texture == "NULL" then
					UpdateTexture(GUI_Playa[pid].TextBox_texture[box], 0, 0, 0, 0, k.texture)
				else
					UpdateTexture(GUI_Playa[pid].TextBox_texture[box], anx(pid, k.x), any(pid, k.y), anx(pid, k.max_x), any(pid ,k.max_y), k.texture)
				end
			else
				for j, k in ipairs(k.text) do
					hight = hight + 200
					local stling = string.len(k)*50
					GUI_Playa[pid].TextBox_draws[box][j] = CreatePlayerDraw(pid, (weight + 20), hight, k, "Font_Old_10_White_Hi.tga", rgb[1], rgb[2], rgb[3], rgb[4])
					ShowPlayerDraw(pid, GUI_Playa[pid].TextBox_draws[box][j])
					
					if Palas == 1 then
						SetPlayerDrawPos(pid, GUI_Playa[pid].TextBox_draws[box][j], (max_weight - (max_weight - weight)/2) - ((stling)/2), hight)
					end
				end
				if k.texture == "NULL" then
					UpdateTexture(GUI_Playa[pid].TextBox_texture[box], 0, 0, 0, 0, k.texture)
				else
					UpdateTexture(GUI_Playa[pid].TextBox_texture[box], k.x, k.y, k.max_x, k.max_y, k.texture)
				end
			end
			return;
		end
	end
end

function HideTextBox(pid, box)
	for j, k in ipairs(GUI_Playa[pid].TextBox) do
		if k.name == box then
			k.visible = false;
			HideTexture(pid, GUI_Playa[pid].TextBox_texture[box])
			for j, k in ipairs(k.text) do
				HidePlayerDraw(pid, GUI_Playa[pid].TextBox_draws[box][j])
				DestroyPlayerDraw(pid, GUI_Playa[pid].TextBox_draws[box][j])
			end
			GUI_Playa[pid].TextBox_draws[box] = nil;
			return;
		end
	end
end

OpenTextBox = ShowTextBox;
CloseTextBox = HideTextBox;

function IsTextBoxVisible(pid, box)
	for j, k in ipairs(GUI_Playa[pid].TextBox) do
		if k.name == box then
			return k.visible;
		end
	end
end

AddTextBox({
	name = "Test",
	virt_pixel = 1,
	x = 300,
	y = 100,
	max_x = 2000,
	max_y = 900,
	texture = "menu_ingame",
	center = 1,
	text = {"Zdarova!", "Welcome to my server!"},
	rgb = {255, 255, 255, 255}
})

