
local KEY = {};

--// Initializete
for i = 0, GetMaxPlayers() do
	KEY[i] = {};
	KEY[i].KEY_LAYOUT = 1; --// 2 - RU layout, 1 - ENG layout
	KEY[i].KEY_SHIFT = false;
	KEY[i].KEY_SHIFT_cout = 0;
end

local KEYS = {

	--		English		--
{
	{DOWN = "", UP = ""}, --// KEY_ESCAPE
	{DOWN = "1", UP = "!"}, --// KEY_1
	{DOWN = "2", UP = "@"}, --// KEY_2
	{DOWN = "3", UP = "#"}, --// KEY_3
	{DOWN = "4", UP = "$"}, --// KEY_4
	{DOWN = "5", UP = "%"}, --// KEY_5
	{DOWN = "6", UP = "^"}, --// KEY_6
	{DOWN = "7", UP = "&"}, --// KEY_7
	{DOWN = "8", UP = "*"}, --// KEY_8
	{DOWN = "9", UP = "("}, --// KEY_9
	{DOWN = "0", UP = ")"}, --// KEY_0
	{DOWN = "-", UP = "_"}, --// KEY_MINUS
	{DOWN = "=", UP = "+"}, --// KEY_EQUALS
	{DOWN = "", UP = ""}, --// KEY_BACK
	{DOWN = "	", UP = " "}, --// KEY_TAB
	{DOWN = "q", UP = "Q"}, --// KEY_Q
	{DOWN = "w", UP = "W"}, --// KEY_W
	{DOWN = "e", UP = "E"}, --// KEY_E
	{DOWN = "r", UP = "R"}, --// KEY_R
	{DOWN = "t", UP = "T"}, --// KEY_T
	{DOWN = "y", UP = "Y"}, --// KEY_Y
	{DOWN = "u", UP = "U"}, --// KEY_U
	{DOWN = "i", UP = "I"}, --// KEY_I
	{DOWN = "o", UP = "O"}, --// KEY_O
	{DOWN = "p", UP = "P"}, --// KEY_P
	{DOWN = "[", UP = "{"}, --// KEY_LBRACKET
	{DOWN = "]", UP = "}"}, --// KEY_RBRACKET
	{DOWN = "", UP = ""}, --// KEY_RETURN
	{DOWN = "", UP = ""}, --// KEY_LCONTROL
	{DOWN = "a", UP = "A"}, --// KEY_A
	{DOWN = "s", UP = "S"}, --// KEY_S
	{DOWN = "d", UP = "D"}, --// KEY_D
	{DOWN = "f", UP = "F"}, --// KEY_F
	{DOWN = "g", UP = "G"}, --// KEY_G
	{DOWN = "h", UP = "H"}, --// KEY_H
	{DOWN = "j", UP = "J"}, --// KEY_J
	{DOWN = "k", UP = "K"}, --// KEY_K
	{DOWN = "l", UP = "L"}, --// KEY_L
	{DOWN = ";", UP = ":"}, --// KEY_SEMICOLON
	{DOWN = "'", UP = "'"}, --// KEY_APOSTROPHE
	{DOWN = "`", UP = "~"}, --// KEY_TILDE
	{DOWN = "", UP = ""}, --// KEY_LSHIFT
	{DOWN = "", UP = ""}, --// KEY_BACKSLASH
	{DOWN = "z", UP = "Z"}, --// KEY_Z
	{DOWN = "x", UP = "X"}, --// KEY_X
	{DOWN = "c", UP = "C"}, --// KEY_C
	{DOWN = "v", UP = "V"}, --// KEY_V
	{DOWN = "b", UP = "B"}, --// KEY_B
	{DOWN = "n", UP = "N"}, --// KEY_N
	{DOWN = "m", UP = "M"}, --// KEY_M
	{DOWN = ",", UP = "<"}, --// KEY_COMMA
	{DOWN = ".", UP = ">"}, --// KEY_PERIOD
	{DOWN = "/", UP = "?"}, --// KEY_SLASH
	{DOWN = "", UP = ""}, --// KEY_RSHIFT
	{DOWN = "", UP = ""}, --// KEY_MULTIPLY
	{DOWN = "", UP = ""}, --// KEY_LMENU
	{DOWN = " ", UP = " "}, --// KEY_SPACE
	{DOWN = "", UP = ""}, --// KEY_CAPITAL
	{DOWN = "", UP = ""}, --// KEY_F1
	{DOWN = "", UP = ""}, --// KEY_F2
	{DOWN = "", UP = ""}, --// KEY_F3
	{DOWN = "", UP = ""}, --// KEY_F4
	{DOWN = "", UP = ""}, --// KEY_F5
	{DOWN = "", UP = ""}, --// KEY_F6
	{DOWN = "", UP = ""}, --// KEY_F7
	{DOWN = "", UP = ""}, --// KEY_F8
	{DOWN = "", UP = ""}, --// KEY_F9
	{DOWN = "", UP = ""}, --// KEY_F10
	{DOWN = "", UP = ""}, --// KEY_NUMLOCK
	{DOWN = "", UP = ""}, --// KEY_SCROLL
	{DOWN = "", UP = ""}, --// KEY_NUMPAD7
	{DOWN = "", UP = ""}, --// KEY_NUMPAD8
	{DOWN = "", UP = ""}, --// KEY_NUMPAD9
	{DOWN = "", UP = ""}, --// KEY_SUBTRACT
	{DOWN = "", UP = ""}, --// KEY_NUMPAD4
	{DOWN = "", UP = ""}, --// KEY_NUMPAD5
	{DOWN = "", UP = ""}, --// KEY_NUMPAD6
	{DOWN = "", UP = ""}, --// KEY_ADD
	{DOWN = "", UP = ""}, --// KEY_NUMPAD1
	{DOWN = "", UP = ""}, --// KEY_NUMPAD2
	{DOWN = "", UP = ""}, --// KEY_NUMPAD3
	{DOWN = "", UP = ""}, --// KEY_NUMPAD0
	{DOWN = "", UP = ""}, --// KEY_DECIMAL
	{DOWN = "", UP = ""}, --// KEY_F11
	{DOWN = "", UP = ""}, --// KEY_F12
	{DOWN = "", UP = ""}, --// KEY_NUMPADENTER
	{DOWN = "", UP = ""}, --// KEY_RCONTROL
	{DOWN = "", UP = ""}, --// KEY_DIVIDE
	{DOWN = "", UP = ""}, --// KEY_RMENU
	{DOWN = "", UP = ""}, --// KEY_PAUSE
	{DOWN = "", UP = ""}, --// KEY_HOME
	{DOWN = "", UP = ""}, --// KEY_UP
	{DOWN = "", UP = ""}, --// KEY_PRIOR
	{DOWN = "", UP = ""}, --// KEY_LEFT
	{DOWN = "", UP = ""}, --// KEY_RIGHT
	{DOWN = "", UP = ""}, --// KEY_END
	{DOWN = "", UP = ""}, --// KEY_DOWN
	{DOWN = "", UP = ""}, --// KEY_NEXT
	{DOWN = "", UP = ""}, --// KEY_INSERT
	{DOWN = "", UP = ""}, --// KEY_DELETE
	{DOWN = "", UP = ""}, --// KEY_POWER
	{DOWN = "", UP = ""}, --// KEY_SLEEP
	{DOWN = "", UP = ""}, --// KEY_WAKE
},

	--		Russian		-- 			//need ASCI encoding

{
	{DOWN = "", UP = ""},
	{DOWN = "1", UP = "!"},
	{DOWN = "2", UP = "'"},
	{DOWN = "3", UP = "№"},
	{DOWN = "4", UP = ";"},
	{DOWN = "5", UP = "%"},
	{DOWN = "6", UP = ":"},
	{DOWN = "7", UP = "?"},
	{DOWN = "8", UP = "*"},
	{DOWN = "9", UP = "("},
	{DOWN = "0", UP = ")"},
	{DOWN = "-", UP = "_"},
	{DOWN = "=", UP = "+"},
	{DOWN = "", UP = ""},
	{DOWN = " ", UP = " "},
	{DOWN = "й", UP = "Й"},
	{DOWN = "ц", UP = "Ц"},
	{DOWN = "у", UP = "У"},
	{DOWN = "к", UP = "К"},
	{DOWN = "е", UP = "Е"},
	{DOWN = "н", UP = "Н"},
	{DOWN = "г", UP = "Г"},
	{DOWN = "ш", UP = "Ш"},
	{DOWN = "щ", UP = "Щ"},
	{DOWN = "з", UP = "З"},
	{DOWN = "х", UP = "Х"},
	{DOWN = "ъ", UP = "Ъ"},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "ф", UP = "Ф"},
	{DOWN = "ы", UP = "Ы"},
	{DOWN = "в", UP = "В"},
	{DOWN = "а", UP = "А"},
	{DOWN = "п", UP = "П"},
	{DOWN = "р", UP = "Р"},
	{DOWN = "о", UP = "О"},
	{DOWN = "л", UP = "Л"},
	{DOWN = "д", UP = "Д"},
	{DOWN = "ж", UP = "Ж"},
	{DOWN = "э", UP = "Э"},
	{DOWN = "ё", UP = "Ё"},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "я", UP = "Я"},
	{DOWN = "ч", UP = "Ч"},
	{DOWN = "с", UP = "С"},
	{DOWN = "м", UP = "М"},
	{DOWN = "и", UP = "И"},
	{DOWN = "т", UP = "Т"},
	{DOWN = "ь", UP = "Ь"},
	{DOWN = "б", UP = "Б"},
	{DOWN = "ю", UP = "Ю"},
	{DOWN = ".", UP = ","},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = " ", UP = " "},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	{DOWN = "", UP = ""},
	}
}

function SetKeyLayout(pID, pMode) 
	KEY[pID].KEY_LAYOUT = pMode;
end

function GetKeyLayout(pID)
	return KEY[pID].KEY_LAYOUT;
end

function GetWord(pID, pButton)
	if KEY[pID].KEY_SHIFT == true then
		return KEYS[KEY[pID].KEY_LAYOUT][pButton + 1].UP;
	elseif KEY[pID].KEY_SHIFT == false then
		return KEYS[KEY[pID].KEY_LAYOUT][pButton + 1].DOWN;
	end
	return "What the fuck?";
end

function GUI_KEY_PRESSED(pID, keydown, keyup)
	if keydown == KEY_LMENU then
		KEY[pID].KEY_SHIFT_cout = KEY[pID].KEY_SHIFT_cout + 1;
	elseif keydown == KEY_LSHIFT then
		KEY[pID].KEY_SHIFT_cout = KEY[pID].KEY_SHIFT_cout + 1;
	elseif keyup == KEY_LMENU then
		KEY[pID].KEY_SHIFT_cout = KEY[pID].KEY_SHIFT_cout - 1;
	elseif keyup == KEY_LSHIFT then
		KEY[pID].KEY_SHIFT_cout = KEY[pID].KEY_SHIFT_cout - 1;
	end
	
	if KEY[pID].KEY_SHIFT_cout == 2 then
		if KEY[pID].KEY_LAYOUT == 1 then
			SetKeyLayout(pID, 2) 
		elseif KEY[pID].KEY_LAYOUT == 2 then
			SetKeyLayout(pID, 1) 
		end
	end
	
	if keydown == KEY_RSHIFT or keydown == KEY_LSHIFT then
		KEY[pID].KEY_SHIFT = true;
	elseif keyup == KEY_RSHIFT or keyup == KEY_LSHIFT then
		KEY[pID].KEY_SHIFT = false;
	end
end