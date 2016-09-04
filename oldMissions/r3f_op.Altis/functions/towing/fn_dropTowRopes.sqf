params ["_vehicle","_player"];
if(local _vehicle) then {
	private ["_helper"];
	_helper = (_player getVariable ["SA_Tow_Ropes_Pick_Up_Helper", objNull]);
	if(!isNull _helper) then {
		{
			//_helper ropeDetach _x;

			//_ropehelper = "Land_CanOpener_F" createVehicle position player;


			//_x ropeAttachedTo _ropehelper;

/*
			_myaction = ["AdvTow_takeRopes", "Take Tow Ropes","",{_this call SA_Take_Tow_Ropes_Action;},{_this call SA_Can_Take_Tow_Ropes},{}] call ace_interact_menu_fnc_createAction;

			[_ropehelper, 0, ["ACE_MainActions"], _myaction] call ace_interact_menu_fnc_addActionToObject;*/

		} forEach (_vehicle getVariable ["SA_Tow_Ropes",[]]);
		detach _helper;
		_helper hideObjectGlobal false;

		_helper setVariable ["AdvLog_Tow_Ropes_Vehicle", _vehicle];

		if !(_helper getVariable ["AdvLog_ACE_pickup_added", false]) then
		{
			_myaction = ["AdvTow_pickup", "Pickup Tow Rope","",{[(_this select 0) getVariable ["AdvLog_Tow_Ropes_Vehicle",objNull], player] call AdvLog_fnc_pickupTowRopes;},{_this call AdvLog_fnc_canPickupTowRopes},{}] call ace_interact_menu_fnc_createAction;

			[_helper, 0, ["ACE_MainActions"], _myaction] call AdvLog_fnc_globalAddAction;

			_helper setVariable ["AdvLog_ACE_pickup_added", true];
		};

	};
	_player setVariable ["SA_Tow_Ropes_Vehicle", nil,true];
	_player setVariable ["SA_Tow_Ropes_Pick_Up_Helper", nil,true];
}
else
{
	_this remoteExecCall  ["AdvLog_fnc_dropTowRopes",_vehicle];
};