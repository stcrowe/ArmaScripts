params [["_man", objNull]];

if (isNull _man) exitWith {};

if (isPlayer _man) exitWith {};

myaction = ["sc_talk"," Talk","\a3\Ui_f\data\IGUI\Cfg\Actions\talk_ca.paa",{[_this select 0] spawn ACS_fnc_preOpenDialog;},{alive(_this select 0) && !((_this select 0) getVariable ["ACE_isUnconscious", false])},{}] call ace_interact_menu_fnc_createAction;

[_man, 0, ["ACE_MainActions"], myaction] call ace_interact_menu_fnc_addActionToObject;

_man spawn
{
	sleep 0.5;
	removeAllActions _this;
};
