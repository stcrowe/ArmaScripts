/*
	File: TFAOsWindowManager.sqf
	Creator: Niky
	Date: 11.03.2015
*/

GUI_GRID_W = 0.025;
GUI_GRID_H = 0.04;
GUI_GRID_X = 0;
GUI_GRID_Y = 0;
TFAMouseX = 0;
TFAMouseY = 0;
isMouseDown = 0;
TFAWindowId = 1801;

GUI_TOP = -4.85;
GUI_LEFT = -11.8;
GUI_WIDTH  = 63.3;
GUI_HEIGHT = 30;
GUI_RIGHT = (GUI_WIDTH + GUI_LEFT) * GUI_GRID_W;
GUI_BOTTOM = (GUI_HEIGHT + GUI_TOP) * GUI_GRID_H;

TFADisplay displayAddEventHandler ["MouseMoving",
{
	[_this]call checkAndMoveWindow;
	TFAMouseX = _this select 1;
	TFAMouseY = _this select 2;
}];

TFADisplay displayAddEventHandler ["MouseButtonUp",
{
	isMouseDown = 0;
}];

checkAndMoveWindow =
{
	if(isMouseDown == 1) then
	{
		_TFAActiveControl = missionNamespace getVariable "TFAActiveControl";
		_toMove = _TFAActiveControl select 0;
		_pos = ctrlPosition _toMove;

		_width = missionNamespace getVariable format["%1%2", _toMove, "width"];
		_height = missionNamespace getVariable format["%1%2", _toMove, "height"];

		_movementSpeed = 0.36 / diag_fps;

		_newX = (_pos select 0) + (TFAMouseX * _movementSpeed);
		_newY = (_pos select 1) + (TFAMouseY * (_movementSpeed * 1.28));

		if(_newX + _width > GUI_RIGHT) then
		{
			_newX = GUI_RIGHT - _width;
		};
		if(_newX < GUI_LEFT * GUI_GRID_W) then
		{
			_newX = GUI_LEFT * GUI_GRID_W;
		};
		if(_newY + _height > GUI_BOTTOM) then
		{
			_newY = GUI_BOTTOM - _height;
		};
		if(_newY < GUI_TOP * GUI_GRID_H) then
		{
			_newY = GUI_TOP * GUI_GRID_H;
		};
		_toMove ctrlSetPosition [_newX, _newY, _pos select 2, _pos select 3];
		_toMove ctrlCommit 0;

		{
			if(_x != _toMove) then
			{
				_xVersatz = missionNamespace getVariable format["%1xPlus", str(_x)];
				_yVersatz = missionNamespace getVariable format["%1yPlus", str(_x)];
				_subPos = ctrlPosition _x;
				_controlType = [_x, "type"] call fnTFA_getVariableToControl;
				if(_controlType == "basic") then
				{
					_x ctrlSetPosition [_newX + _xVersatz , _newY + _yVersatz , _subPos select 2, _subPos select 3];
				}
				else
				{
					_x ctrlSetPosition [_newX + _xVersatz , _newY + _yVersatz + (1.45 * GUI_GRID_H) , _subPos select 2, _subPos select 3];
				};
				_x ctrlCommit 0;
			};

			if(ctrlText _x == "cmd") then
			{
				[_x] call fnTFA_FocusWindow;
			};
		} foreach _TFAActiveControl;
	};
};

addCtrl =
{
	_type = _this select 0;
	_text = _this select 1;
	_x = (_this select 2) * GUI_GRID_W + GUI_GRID_X;
	_y = (_this select 3) * GUI_GRID_H + GUI_GRID_Y;
	_w = (_this select 4) * GUI_GRID_W;
	_h = (_this select 5) * GUI_GRID_H;
	_toCreate = TFADisplay ctrlCreate [_type, TFAWindowId];
	TFAWindowId = TFAWindowId + 1;

	if(_text != "") then
	{
		_toCreate ctrlSetText _text;
	};
	_toCreate ctrlSetPosition [_x, _y, _w, _h];

	if(count _this > 6) then
	{
		_toCreate ctrlAddEventHandler ["MouseEnter",
		{
			(_this select 0) ctrlSetBackgroundColor [1, 1, 1, 0.3];
			(_this select 0) ctrlCommit 0;
		}];
		_toCreate ctrlAddEventHandler ["MouseExit",
		{
			(_this select 0) ctrlSetBackgroundColor [0, 0, 0, 0];
			(_this select 0) ctrlCommit 0;
		}];
	};

	_toCreate ctrlCommit 0;

	missionNamespace setVariable [format["%1%2", _toCreate, "width"], _w];
	missionNamespace setVariable [format["%1%2", _toCreate, "height"], _h];

	_toCreate
};

//Draws the Background Image. Should be called before any Windows or the Desktop are added
fnTFA_drawBackgroundImage =
{
	_backgroundControl = ["RscPicture",
	MISSION_ROOT + "TFAOs\Images\background.jpg",
	GUI_LEFT,
	GUI_TOP,
	GUI_WIDTH,
	GUI_HEIGHT] call addCtrl;
};

//Changes the path of the Explorer
//_this select 0 -> the Command that should be excecuted (for example "cd Arma")
//_this select 1 -> the old Explorer Window
fnTFA_changeExplorerPath =
{
	_command = _this select 0;
	_newWindow = _this select 1;
	[_newWindow select 0] call fnTFA_CloseWindow;
	_newWindow = [5, 5, 20, 12, "Explorer - C:\"] call fnTFA_DrawWindow;
	[_command] call fnTFA_excecuteCommandFromNonConsole;
	_folders = ["ls"] call fnTFA_excecuteCommandFromNonConsole;
	_yIndex = 0;
	_breaker = 3;
	_counter = 0;
	_folders = [[".."]] + _folders;
	{
		_cur = (_folders select _forEachIndex);

		_imageName = "folder";
		if(count _cur > 6) then
		{
			if(_cur select 6 == "image") then
			{
				_imageName = "image";
			};
			if(_cur select 6 == "exe") then
			{
				_imageName = "exe";
			};
		};
		_folderCtrl = ["RscPicture", MISSION_ROOT + "TFAOs\Images\" + _imageName + ".paa", 0,0,0,0] call addCtrl;
		_folderCtrl ctrlEnable true;
		[_folderCtrl, _cur, "folderStructure"] call fnTFA_addVariableToControl;
		_folderCtrl ctrlAddEventHandler ["MouseButtonDblClick",
		{

			_folderInfo = [_this select 0, "folderStructure"] call fnTFA_getVariableToControl;
			if(count _folderInfo > 4) then
			{
				if(_folderInfo select 4 == 1) then
				{
					_folders = [_this select 0] call fnTFA_getWindowFromControl;
					[format["cd %1", (_folderInfo select 0)], _folders] call fnTFA_changeExplorerPath;
				}
				else
				{
					[format["open %1", (_folderInfo select 0)]] call fnTFA_excecuteCommandFromNonConsole;
				};
			}
			else
			{
				_folders = [_this select 0] call fnTFA_getWindowFromControl;
				[format["cd %1", (_folderInfo select 0)], _folders] call fnTFA_changeExplorerPath;
			};
		}];

		_name = (_cur select 0);
		_folderCtrlText = ["RscText", _name, 0,0,0,0] call addCtrl;
		_folderCtrlText ctrlSetFontHeight 0.03;
		_folderCtrlText ctrlSetTextColor [0,0,0,1];
		_folderCtrlText ctrlSetTooltip _name;

		[_newWindow select 0, _folderCtrl,
		[0.5 + _counter * 4 + 1 * _counter,_yIndex * 5 + 0.2,4,4]] call fnTFA_addControlToWindow;

		[_newWindow select 0, _folderCtrlText,
		[0.5 + _counter * 4 + 1 * _counter,_yIndex * 5 + 3.8,4,1]] call fnTFA_addControlToWindow;

		if(_breaker == _counter) then
		{
			_yIndex = _yIndex + 1;
			_counter = 0;
		}
		else
		{
			_counter = _counter + 1;
		};
	}
	foreach _folders;
};

//Adds a single Desktop Icon
//_this select 0 -> x
//_this select 1 -> y
//_this select 2 -> picture path
//_this select 3 -> name
//_this select 4 -> Text X Correction
//Returns: the Control of the Icon and the control of the Text : Array
fnTFA_AddDesktopIcon =
{
	_picture = _this select 2;
	_name = _this select 3;
	_xAnpasser = _this select 4;

	_icon = ["RscPicture",
	MISSION_ROOT + _picture,
	_this select 0, _this select 1, 4, 3] call addCtrl;
	_icon ctrlEnable true;

	_windowName = ["RscText",
	_name,
	(_this select 0) + _xAnpasser,
	(_this select 1) + 2.4,
	4, 1.5] call addCtrl;
	_windowName ctrlEnable true;

	_returned = [_icon, _windowName];

	_returned
};

//Draws the Taskbar
fnTFA_DrawTaskBar =
{
	_taskBar = ["RscBackground", "", GUI_LEFT, GUI_HEIGHT - 6.4, GUI_WIDTH, 1.5] call addCtrl;
	_r = 24;
	_g = 31;
	_b = 28;
	_taskBar ctrlSetBackgroundColor [_r/255, _g/255, _b/255, 1];
	_taskBar ctrlSetForegroundColor [_r/255, _g/255, _b/255, 1];

	_taskBarTime = ["RscText", "", (GUI_LEFT + GUI_WIDTH) - 4.4,GUI_HEIGHT - 6.5, 5, 1.5] call addCtrl;

	[_taskBarTime] spawn fnTFA_drawTime;
};

//Draws the Ingame time on the bottom right Corner
fnTFA_drawTime =
{
	_timeControl = _this select 0;
	while { (dialog) and (alive player) } do
	{
		_hour = floor daytime;
		_strHour = str(_hour);
		if(_hour < 10) then
		{
			_strHour = format["0%1", _hour];
		};

		_minute = floor ((daytime - _hour) * 60);
		_strMinute = str(_minute);
		if(_minute < 10) then
		{
			_strMinute = format["0%1", _minute];
		};

		_second = floor (((((daytime) - (_hour))*60) - _minute)*60);
		_strSecond = str(_second);
		if(_second < 10) then
		{
			_strSecond = format["0%1", _second];
		};

		_time24 = format ["%1:%2:%3",_strHour,_strMinute,_strSecond];
		_timeControl ctrlSetText _time24;
		sleep 1;
	};
};

//Draws the Desktop
fnTFA_DrawDesktop =
{
	_explorer = [GUI_LEFT + 2, GUI_TOP + 2, "TFAOs\Images\Hard-Drive-icon.paa", "C:\", 1.1] call fnTFA_AddDesktopIcon;
	(_explorer select 0) ctrlAddEventHandler ["MouseButtonDblClick",
	{
		_newWindow = [5,5,20,12, "Explorer - C:\"] call fnTFA_DrawWindow;
		["", _newWindow] call fnTFA_changeExplorerPath;
	}];


	_cmd = [GUI_LEFT + 8, GUI_TOP + 2, "TFAOs\Images\cmd.paa", "cmd", 0.9] call fnTFA_AddDesktopIcon;
	(_cmd select 0) ctrlAddEventHandler ["MouseButtonDblClick",
	{
		_newWindow = [5,5,20,12, "cmd"] call fnTFA_DrawWindow;
		[_newWindow select 0, TFAConsole, [0,0,20,10.5]] call fnTFA_addControlToWindow;
	}];

	_browser = [GUI_LEFT + 14, GUI_TOP + 2, "TFAOs\Images\browser.paa", "Browser", 0] call fnTFA_AddDesktopIcon;
	(_browser select 0) ctrlAddEventHandler ["MouseButtonDblClick",
	{
		_width = 60;
		_height = 25;
		_standartURL = TFADefaultWebPage;
		_newWindow = [-9,-4,_width,_height, "Browser"] call fnTFA_DrawWindow;

		_browserCtrl = ["RscHTML", "", 0,0,0,0] call addCtrl;
		_browserCtrl ctrlSetBackgroundColor [0,0,0,1];
		[_newWindow select 0, _browserCtrl,
		[0.2,1.7,_width - 0.2,_height - 3]] call fnTFA_addControlToWindow;

		_browserCtrl htmlLoad _standartURL;

		_url = ["RscEdit", _standartURL, 0,0,0,0] call addCtrl;
		[_newWindow select 0, _url,
		[0.4,0.2,_width - 5.5,1.5]] call fnTFA_addControlToWindow;

		_changeSiteButton = ["RscButton", "Los", 0,0,0,0] call addCtrl;
		[_newWindow select 0, _changeSiteButton,
		[_width - 5,0.2,5,1.5]] call fnTFA_addControlToWindow;
		_changeSiteButton ctrlAddEventHandler ["MouseButtonDown",
		{
			_browserCtrl = missionNamespace getVariable format["%1browser", str(_this select 0)];
			_url = missionNamespace getVariable format["%1url", str(_this select 0)];

			_browserCtrl htmlLoad (ctrlText _url);
		}];

		missionNamespace setVariable [ format["%1browser", str(_changeSiteButton)], _browserCtrl];
		missionNamespace setVariable [ format["%1url", str(_changeSiteButton)], _url];
	}];

	call fnTFA_DrawTaskBar;
};

setXYVersatz =
{
	missionNamespace setVariable [ format["%1xPlus", str(_this select 0)], (_this select 1) * GUI_GRID_W];
	missionNamespace setVariable [ format["%1yPlus", str(_this select 0)], (_this select 2) * GUI_GRID_H];
};

//Closes the given Window
//_this select 0 -> Any control from the window
fnTFA_CloseWindow =
{
	_control = _this select 0;
	_window = [_control] call fnTFA_getWindowFromControl;

	_processId = [_window select 0, "processID"] call fnTFA_getVariableToControl;
	if(str(_processId) != "<null>") then
	{
		[format["close %1", _processId]] call fnTFA_excecuteCommandFromNonConsole;
	};

	{
		ctrlDelete _x;
	}
	foreach _window;
};

//Draws a Window on the Screen. The returned Window will already have a close button and will be dragable
//_this select 0 -> x
//_this select 1 -> y
//_this select 2 -> width
//_this select 3 -> height
//_this select 4 -> name
//Returns: All controls in the Window : Array
fnTFA_DrawWindow =
{
	_width = 20;
	_height = 12;
	if(count _this > 2) then
	{
		_width = _this select 2;
		if(count _this > 3) then
		{
			_height = _this select 3;
		};
	};
	_windowBackground = ["RscPicture",
	MISSION_ROOT + "TFAOs\Images\windowBackground.jpg",
	(_this select 0),
	(_this select 1),
	_width,
	_height] call addCtrl;
	[_windowBackground, 0, 0] call setXYVersatz;

	_topBar = ["RscBackground",
	"",
	(_this select 0),
	(_this select 1),
	_width,
	1.5] call addCtrl;
	[_topBar, 0, 0] call setXYVersatz;
	_topBar ctrlEnable true;
	_r = 24;
	_g = 31;
	_b = 28;
	_topBar ctrlSetBackgroundColor [_r/255, _g/255, _b/255, 1];
	_topBar ctrlSetForegroundColor [_r/255, _g/255, _b/255, 1];
	_topBar ctrlAddEventHandler ["MouseButtonDown",
	{
		isMouseDown = 1;
		[_this select 0] call fnTFA_FocusWindow;
		_TFAActiveControl = [_this select 0] call fnTFA_getWindowFromControl;
		missionNamespace setVariable ["TFAActiveControl", _TFAActiveControl];
	}];

	_windowName = ["RscText",
	(_this select 4),
	(_this select 0),
	(_this select 1),
	_width - 1.5,
	1.5] call addCtrl;
	[_windowName, 0, 0] call setXYVersatz;
	_windowName ctrlEnable true;
	_windowName ctrlAddEventHandler ["MouseButtonDown",
	{
		isMouseDown = 1;
		[_this select 0] call fnTFA_FocusWindow;
		_TFAActiveControl = [_this select 0] call fnTFA_getWindowFromControl;
		missionNamespace setVariable ["TFAActiveControl", _TFAActiveControl];
	}];

	_close = ["RscPicture",
	MISSION_ROOT + "TFAOs\Images\close.paa",
	((_this select 0) + (_width - 1.5)),
	(_this select 1),
	1.5,
	1.5] call addCtrl;
	[_close, _width - 1.5, 0] call setXYVersatz;
	_close ctrlEnable true;
	_close ctrlAddEventHandler ["MouseButtonDown",
	{
		[_this select 0] call fnTFA_CloseWindow;
	}];

	_allControls = [_windowBackground, _topBar, _close, _windowName];
	{
		_x setVariable ["otherElements", _allControls];
		_x ctrlCommit 0;
		[_x, _allControls] call fnTFA_addVariableToControl;
		[_x, "Basic", "type"] call fnTFA_addVariableToControl;
	}
	foreach _allControls;
	_allControls
};

//currently crashes arma after a few trys
//Deletes all Controls that were customly added to the control.
//_this select 0 -> the Background of the window.
fnTFA_clearWindow =
{
	_windowControl = _this select 0;
	_controls = [_windowControl] call fnTFA_getWindowFromControl;
	{
		_controlType = [_x, "type"] call fnTFA_getVariableToControl;
		if(_controLType == "added") then
		{
			ctrlDelete _x;
		};
	} foreach _controls;
};

//Add a variable to a given Control
//_this select 0 -> the Control that will get the variable
//_this select 1 -> the Value of the Variable
//(Optional) _this select 2 -> The Name of the Variable
fnTFA_addVariableToControl =
{
	_control = _this select 0;
	_variable = _this select 1;
	_varName = "";
	if(count _this > 2) then
	{
		_varName = _this select 2;
	};
	missionNamespace setVariable [format["%1%2", str(_control), _varName], _variable];
};

//get a variable from the given Control
//_this select 0 -> The Control
//(Optional) _this select 1 -> the name of the variable. - If no parameter is given, it will return the value set from fnTFA_addVariableToControl with no given paramter
//Returns: The variable : Any
fnTFA_getVariableToControl =
{
	_control = _this select 0;
	_varName = "";
	if(count _this > 1) then
	{
		_varName = _this select 1;
	};
	_variable = missionNamespace getVariable format["%1%2", str(_control), _varName];
	_variable
};

//Returns a array with all Controls of the window to the given control
//_this select 0 -> the Control who's window you want
//Returns: All Controls in the Window : Array
fnTFA_getWindowFromControl =
{
	_window = missionNamespace getVariable str(_this select 0);
	_window
};

//Set the given Window as Focused.
//_this select 0 -> the background control of the window.
fnTFA_FocusWindow =
{
	_control = _this select 0;
	_window = [_control] call fnTFA_getWindowFromControl;
	{
		ctrlSetFocus _x;
	} foreach _window;
	ctrlSetFocus _control;
};

//_this select 0 -> wo es hinzugef?gt werden soll
//_this select 1 -> das control das hinzugef?gt werden soll
//(Optional) _this select 2 -> [x,y,h,w] wobei 0,0 oben links im window des Controls aus _this select 0 ist
fnTFA_addControlToWindow =
{
	_control = _this select 0;
	_toAddControl = _this select 1;

	_allControls = missionNamespace getVariable str(_control);
	_allControls = _allControls + [_toAddControl];


	_window = [_control] call fnTFA_getWindowFromControl;

	[_toAddControl, "added", "type"] call fnTFA_addVariableToControl;
	{
		_x setVariable ["otherElements", _allControls];
		[_x, _allControls] call fnTFA_addVariableToControl;
	} foreach _window;

	if(count _this > 2) then
	{
		_pos = _this select 2;
		_zeroPos = ctrlPosition (_allControls select 0);

		_newX = (_zeroPos select 0) + ((_pos select 0) * GUI_GRID_W);
		_newY = (_zeroPos select 1) + (1.5 * GUI_GRID_H) + ((_pos select 1) * GUI_GRID_H);
		_newW = (_pos select 2) * GUI_GRID_W;
		_newH = (_pos select 3) * GUI_GRID_H;

		_toAddControl ctrlSetPosition[_newX, _newY, _newW, _newH];
		[_toAddControl, (_zeroPos select 0) + (_pos select 0), (_zeroPos select 1) + (_pos select 1)] call setXYVersatz;

		_toAddControl ctrlCommit 0;
	};
};

//Shows a basic Dialog (UNFINISHED)
//_this select 0 -> The text
//_this select 1 -> The header Text
fnTFA_showDialog =
{
	_text = _this select 0;
	_headerText = _this select 1;

	_newWindow = [5, 5, 20, 12, _headerText] call fnTFA_DrawWindow;
	_textRsc = ["RscText", _text, 0, 0, 10, 5] call addCtrl;
	[_newWindow select 0, _textRsc, [0, 0, 20, 10.5]] call fnTFA_addControlToWindow;
};
















