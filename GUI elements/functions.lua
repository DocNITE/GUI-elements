--[[---------------------------------------------------------]]--
--[[    Made by:       DocNight                              ]]--
--[[    Script:        GUI functions                         ]]--
--[[---------------------------------------------------------]]--


local VIEW_MAX = 8192; --// Virt. view res.

local CURSOR_TEX = "LO.TGA"; --// Cursor texture


function GetPPI(playerid)
	local a, b = GetPlayerResolution(playerid); 
	local pix = 37.79527559055; 
	local inc = 0.39; 
	local dia = math.sqrt(a*a + b*b); 
	local dia_to_sm = (dia/pix); 
	local sm_to_inc = (tonumber(dia_to_sm) * inc); 
	local ppi = dia/sm_to_inc;
	return tonumber(ppi)
end

function OpenCursor(playerid, freeze)  --// Show cursor
	SetCursorVisible(playerid, 1)
	SetCursorTexture(playerid, CURSOR_TEX)
	if freeze == true then
		FreezeCamera(playerid, 1)
		FreezePlayer(playerid, 1)
	end
	GUI_Playa[playerid].IsOpen = true;
end

function CloseCursor(playerid, freeze)   --// SHow cursor
	SetCursorVisible(playerid, 0)
	if freeze == true then
		FreezeCamera(playerid, 0)
		FreezePlayer(playerid, 0)
	end
	GUI_Playa[playerid].IsOpen = false;
end

local function rnd(x)
	if x > 0 then
		return x + 0.5
	else
		return x - 0.5
	end
end

function UpdateTextureSize(argument, x1, y1, x2, y2, texture)
	UpdateTexture(argument, x1, y1, (x1 + x2), (y1 + y2), texture)
end

function nax(pid, x)
	local psizex, psizey = GetPlayerResolution(pid)
    return rnd((x * psizex) / VIEW_MAX);
end

function nay(pid, y)
	local psizex, psizey = GetPlayerResolution(pid)
    return rnd((y * psizey) / VIEW_MAX);
end

function anx(pid, x)
	local psizex, psizey = GetPlayerResolution(pid)
	return rnd((x * VIEW_MAX) / psizex); 
end

function any(pid, y)
	local psizex, psizey = GetPlayerResolution(pid)
	return rnd((y * VIEW_MAX) / psizey); 
end

function UpdatePixelTexture(pid, argument, pix1, piy1, pix2, piy2, texture) --// Texture pixel size
	UpdateTexture(argument, anx(pid, pix1), any(pid, piy1), anx(pid, pix2), any(pid, piy2), texture)
end

function SetPlayerDrawPixel(pid, argument, x, y) --// Set player draw pixel
	local psizex, psizey = GetPlayerResolution(pid)
	local oneX = rnd((x * VIEW_MAX) / psizex);
	local twoY = rnd((y * VIEW_MAX) / psizey); 
	SetPlayerDrawPos(pid, argument, oneX, twoY);
end

function SetDrawPixel(pid, argument, x, y) --// Set draw pixel
	local psizex, psizey = GetPlayerResolution(pid)
	local oneX = rnd((x * VIEW_MAX) / psizex);
	local twoY = rnd((y * VIEW_MAX) / psizey); 
	SetDrawPos(argument, oneX, twoY);
end

function UpdateDrawPixelCenter(pid, argument, posX, posY) --// Set draw size pixel for center
	local resX, resY = GetPlayerResolution(pid);
	local x1 = (resX/2) + posX;
	local y1 = (resY/2) + posY;
	SetDrawPos(argument, anx(pid, x1), any(pid, y1))
end

function PlayerUpdateDrawPixelCenter(pid, argument, posX, posY) --// Set player draw size pixel for center
	local resX, resY = GetPlayerResolution(pid);
	local x1 = (resX/2) + posX;
	local y1 = (resY/2) + posY;
	SetPlayerDrawPos(pid, argument, anx(pid, x1), any(pid, y1))
end

--// Resize texture for center
function UpdatePixelTextureCenter(pid, argument, sizeX, sizeY, backX, backY, texture) --// Set texture pixel for center
	local resX, resY = GetPlayerResolution(pid);
	local x1 = (resX/2) - (sizeX/2) + backX;
	local y1 = (resY/2) - (sizeY/2) + backY;
	UpdateTexture(argument, anx(pid, x1), any(pid, y1), anx(pid, x1 + sizeX), any(pid, y1 + sizeY), texture)
end