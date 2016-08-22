/*
	File: TFAOsHandler.sqf
	Creator: Niky
	Date: 11.03.2015
*/

TFAVideoPlayer = nil;
TFALifeFeed = nil;
TFADisplay = nil; //not working because of serialisation error...
TFAConsole = nil;

myDrinkLoad =
{
	private ["_display","_idc","_ctrl"];
	_display = _this select 0;
	TFADisplay = _display;
	_idc = -1;
	_ctrl = _display displayCtrl _idc;
	_this select 0 displayCtrl -1 ctrlEnable false;
	execVM "TFAOs\Drawing\TFAOsWindowManager.sqf"
	call fnTFA_drawBackgroundImage;
	call fnTFA_DrawDesktop;

	TFAConsole = ((_display) displayCtrl 1400);
	TFAConsole ctrlSetPosition [100, 100, 0,0];
	TFAConsole ctrlCommit 0;

	//setModelTo:
	//_control3D = _display displayCtrl 1002;
	//_control3D ctrlSetModel "\a3\Ui_f\objects\Compass.p3d";

	_keyDown = _display displayAddEventHandler ["KeyDown",
	{
		_key = _this select 1;
			ctrlSetText[2001, "got here 0"];
		if((_key == 28)) then //enter
		{
			_input = ctrlText 1400;
			_command = [_input] call fnTFA_getLastInsert;
			[_command] call fnTFA_excecuteCommand;
			_consoleText = ctrlText 1400;
			[_consoleText] call fnTFA_removeTopLine;
		};
		//tfar befehle zum merken aus der fn_ClientInit.sqf
		//call TFAR_fnc_onSwTangentPressed; call TFAR_fnc_onSwTangentReleased;
	}];
	_keyUp = _display displayAddEventHandler ["KeyUp",
	{

	}];
};
