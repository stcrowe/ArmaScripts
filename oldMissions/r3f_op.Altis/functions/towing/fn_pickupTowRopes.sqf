
params ["_vehicle","_player"];

if (!local _vehicle) then
{
	private ["_time_demande_setOwner"];
	_time_demande_setOwner = time;

	[_vehicle, clientOwner] remoteExec ["AdvLog_fnc_setOwner", 2];

};


private ["_attachedObj","_helper"];
{
	_attachedObj = _x;
	{
		_attachedObj ropeDetach _x;
	} forEach (_vehicle getVariable ["SA_Tow_Ropes",[]]);
	deleteVehicle _attachedObj;
} forEach ropeAttachedObjects _vehicle;

_helper = "Land_CanOpener_F" createVehicle position _player;
{
	[_helper, [0, 0, 0], [0,0,-1]] ropeAttachTo _x;
	_helper attachTo [_player, [-0.1, 0.1, 0.15], "Pelvis"];
} forEach (_vehicle getVariable ["SA_Tow_Ropes",[]]);

//hideObject _helper;
hideObjectGlobal _helper;

_player setVariable ["SA_Tow_Ropes_Vehicle", _vehicle,true];
_player setVariable ["SA_Tow_Ropes_Pick_Up_Helper", _helper,true];

orderAction = ['AdvTow_drop','Drop Tow Ropes','',{[player getVariable ["SA_Tow_Ropes_Vehicle", objNull], player] call AdvLog_fnc_dropTowRopes;},{!isNull (player getVariable ["SA_Tow_Ropes_Vehicle", objNull])}] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "ACE_Equipment"], orderAction] call AdvLog_fnc_globalAddAction;