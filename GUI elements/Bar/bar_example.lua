function m_showbar(playerid)
	ShowBar(playerid, "test")
	local a, b = GetPlayerResolution(playerid);
	SetBarPos(playerid, "test", 200, b - 30, true)
end

function ChangeBar(playerid) --SetBarValue
	local abdshda = GetBarValue(playerid, "test", VALUE)
	if abdshda > 0 then
		abdshda = abdshda - 0.2;
	else
		abdshda = 100;
	end

	SetBarValue(playerid, "test", VALUE, abdshda)
end

function Exm_Init(playerid)
	m_showbar(playerid);
	SetTimer(ChangeBar, 20, 1, playerid)
end

