

for i = 0, GetMaxPlayers() do
	GUI_Playa[i].Bar = {};
	GUI_Playa[i].Bar_texture = {};
end

function InitBars()
	for i = 0, GetMaxPlayers() do
		for j, k in ipairs(GUI_Playa[i].Bar) do
			GUI_Playa[i].Bar_texture[k.name] = CreateTexture(666, 666, 666, 666, "RUSH B")
		end
	end
end
--[[
and button.virt_pixel
 and button.alignment -- progress
 and button.x and button.y 
 and button.width and 
 button.height and 
 button.texture]]

function AddBar(button)
	if button.name and button.virt_pixel and button.background and button.progress then
		print("Bar '"..button.name.."' has been added.")
		--print(""..tostring(button.func).." ")
		for i = 0, GetMaxPlayers() do
			table.insert(GUI_Playa[i].Bar, {name = button.name, virt_pixel = button.virt_pixel, background = button.background, progress = button.progress})
		end
	elseif button.name and button.virt_pixel and button.progress then
		print("Bar '"..button.name.."' has been added.")
		for i = 0, GetMaxPlayers() do
			table.insert(GUI_Playa[i].Bar, {name = button.name, virt_pixel = button.virt_pixel, background = false, progress = button.progress})
		end
	else
		print("[ERROR]: Wrong syntax!")
	end
end

AddBar({
	name = "test",
	virt_pixel = 1,
	background = {
		x = 0,
		y = 0,
		width = 0,
		height = 0,
		texture = 0
	},
	progress = {
		max_value = 100;
		min_value = 0;
		alignment = LEFT;
		x = 0,
		y = 0,
		width = 0,
		height = 0,
		texture = 0
	},
})