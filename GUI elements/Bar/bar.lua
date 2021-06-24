--// BARS \\--

for i = 0, GetMaxPlayers() do
	GUI_Playa[i].Bar = {};
	GUI_Playa[i].Bar_texture_progress = {};
	GUI_Playa[i].Bar_texture_background = {};
end

function InitBars()
	for i = 0, GetMaxPlayers() do
		for j, k in ipairs(GUI_Playa[i].Bar) do
			GUI_Playa[i].Bar_texture_background[k.name] = CreateTexture(666, 666, 666, 666, "RUSH A")
			GUI_Playa[i].Bar_texture_progress[k.name] = CreateTexture(666, 666, 666, 666, "RUSH B")
		end
	end
end

function AddBar(button)
	if button.name and button.virt_pixel and button.background and button.progress then
		print("Bar '"..button.name.."' has been added.")
		--print(""..tostring(button.func).." ")
		for i = 0, GetMaxPlayers() do
			table.insert(GUI_Playa[i].Bar, {name = button.name, virt_pixel = button.virt_pixel, alignment = button.alignment, background = button.background, progress = button.progress, visible = false})
		end
	elseif button.name and button.virt_pixel and button.progress then
		print("Bar '"..button.name.."' has been added.")
		for i = 0, GetMaxPlayers() do
			table.insert(GUI_Playa[i].Bar, {name = button.name, virt_pixel = button.virt_pixel, alignment = button.alignment, background = false, progress = button.progress, visible = false})
		end
	else
		print("[ERROR]: Wrong syntax!")
	end
end

local function CalculateBar(k)
	
	if k.progress.value > k.progress.max_value then
		k.progress.value = k.progress.max_value;
	end
	
	local calculate = 100 * k.progress.value/k.progress.max_value;
	calculate = (calculate/100) * k.progress.width;

	return calculate;
end

function SetBarValue(pID, pBar, pValue, pAmount) --// pValue: MAX_VALUE - Max value; MIN_VALUE = min value; MAIN_VALUE
	
	local pid = pID;
	
	for j, k in ipairs(GUI_Playa[pid].Bar) do
	
		if k.name == pBar then
		
			if pValue == MAX_VALUE then
				k.progress.max_value = pValue;
			elseif pValue == MIN_VALUE then
				k.progress.min_value = pValue;
			elseif pValue == MAIN_VALUE then
				k.progress.value = pValue;
			end
			
			if k.visible == true then
				
				local calculate = CalculateBar(k);
				
				if k.virt_pixel == 0 then
			
					if k.texture == "NULL" then
						UpdateTextureSize(GUI_Playa[pid].Bar_texture_background[pBar], 0, 0, 0, 0, k.background.texture)
						UpdateTextureSize(GUI_Playa[pid].Bar_texture_progress[pBar], 0, 0, 0, 0, k.progress.texture)
					else
						UpdateTextureSize(GUI_Playa[pid].Bar_texture_background[pBar], anx(pid, k.background.x), any(pid, k.background.y), anx(pid, k.background.width), any(pid ,k.background.height), k.background.texture)
						UpdateTextureSize(GUI_Playa[pid].Bar_texture_progress[pBar], anx(pid, k.progress.x), any(pid, k.progress.y), anx(pid, calculate), any(pid ,k.progress.height), k.progress.texture)
					end
					
				else

					if k.texture == "NULL" then
						UpdateTextureSize(GUI_Playa[pid].Bar_texture_background[pBar], 0, 0, 0, 0, k.background.texture)
						UpdateTextureSize(GUI_Playa[pid].Bar_texture_progress[pBar], 0, 0, 0, 0, k.progress.texture)
					else
						UpdateTextureSize(GUI_Playa[pid].Bar_texture_background[pBar], k.background.x, k.background.y, k.background.width, k.background.height, k.background.texture)
						UpdateTextureSize(GUI_Playa[pid].Bar_texture_progress[pBar], k.progress.x, k.progress.y, calculate, k.progress.height, k.progress.texture)
					end
					
				end
				
			end
			
			return;
		end
	
	end
	
end

function GetBarValue(pID, pBar, pValue) --// pValue: MAX_VALUE - Max value; MIN_VALUE = min value; MAIN_VALUE

	for j, k in ipairs(GUI_Playa[pID].Bar) do
	
		if k.name == pBar then
		
			if pValue == MAX_VALUE then
				return k.progress.max_value;
			elseif pValue == MIN_VALUE then
				return k.progress.min_value;
			elseif pValue == MAIN_VALUE then
				return k.progress.value;
			end
			
		end
		
	end
	
end

function ShowBar(pID, pBar)
	
	local pid = pID;
	
	for j, k in ipairs(GUI_Playa[pid].Bar) do
	
		if k.name == pBar then
		
			k.visible = true;
			ShowTexture(pid, GUI_Playa[pid].Bar_texture_background[pBar])
			ShowTexture(pid, GUI_Playa[pid].Bar_texture_progress[pBar])
			
			local calculate = CalculateBar(k);
			
			if k.virt_pixel == 0 then
			
				if k.texture == "NULL" then
					UpdateTextureSize(GUI_Playa[pid].Bar_texture_background[pBar], 0, 0, 0, 0, k.background.texture)
					UpdateTextureSize(GUI_Playa[pid].Bar_texture_progress[pBar], 0, 0, 0, 0, k.progress.texture)
				else
					UpdateTextureSize(GUI_Playa[pid].Bar_texture_background[pBar], anx(pid, k.background.x), any(pid, k.background.y), anx(pid, k.background.width), any(pid ,k.background.height), k.background.texture)
					UpdateTextureSize(GUI_Playa[pid].Bar_texture_progress[pBar], anx(pid, k.progress.x), any(pid, k.progress.y), anx(pid, calculate), any(pid ,k.progress.height), k.progress.texture)
				end
				
			else

				if k.texture == "NULL" then
					UpdateTextureSize(GUI_Playa[pid].Bar_texture_background[pBar], 0, 0, 0, 0, k.background.texture)
					UpdateTextureSize(GUI_Playa[pid].Bar_texture_progress[pBar], 0, 0, 0, 0, k.progress.texture)
				else
					UpdateTextureSize(GUI_Playa[pid].Bar_texture_background[pBar], k.background.x, k.background.y, k.background.width, k.background.height, k.background.texture)
					UpdateTextureSize(GUI_Playa[pid].Bar_texture_progress[pBar], k.progress.x, k.progress.y, calculate, k.progress.height, k.progress.texture)
				end
				
			end
			return;
		end
	
	end
	
end

function HideBar(pID, pBar)
	
	local pid = pID;
	
	for j, k in ipairs(GUI_Playa[pid].Bar) do
	
		if k.name == pBar then
		
			k.visible = false;
			HideTexture(pid, GUI_Playa[pid].Bar_texture_progress[pBar])
			HideTexture(pid, GUI_Playa[pid].Bar_texture_background[pBar])
			
			return;
		end
	
	end
	
end

--[[

процент между макс и мин
Выч процент между длиной и высотой
ставим в процентах, в пикселях
100* 5/25 = 20% 

 print((50/100)*200)
]]

AddBar({
	name = "test",
	virt_pixel = 0,
	alignment = DOWN,
	background = {
		x = 50,
		y = 50,
		width = 300,
		height = 80,
		texture = "menu_choice_back"
	},
	progress = {
		max_value = 100;
		min_value = 0;
		value = 100;
		alignment = LEFT;
		x = 50,
		y = 50,
		width = 280,
		height = 60,
		texture = "map_newworld"
	},
})