/*
	File: TFAOsPlayer.sqf
	Creator: Niky
	Date: 11.03.2015
*/

_file = _this select 0;
_processId = _this select 1;

fnTFA_startplayer =
{
	_programWindow = [1,1,30,15, _file select 0] call fnTFA_DrawWindow;
	[_programWindow select 0, _processId, "processID"] call fnTFA_addVariableToControl;

	_renderSurface = ["RscPicture", "", 0,0,0,0] call addCtrl;
	[_programWindow select 0, _renderSurface, [0,0,30,15 - 1.5]] call fnTFA_addControlToWindow;
	_renderSurface ctrlSetText format["%1", _file select 5];
};

fnTFA_stopplayer =
{
	//TFAVideoPlayer ctrlSetText "";
};

call fnTFA_startplayer;