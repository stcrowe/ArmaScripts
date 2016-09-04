params [["_vehicle", objNull]];

if (isNull _vehicle) exitWith {};


_myaction = ["AdvTow_takeRopes", "Deploy Tow Ropes","",{_this call AdvLog_fnc_takeTowRopes;},{_this call AdvLog_fnc_canTakeTowRopes},{}] call ace_interact_menu_fnc_createAction;

[_vehicle, 0, ["ACE_MainActions"], _myaction] call ace_interact_menu_fnc_addActionToObject;


_myaction = ["AdvTow_putAwayRopes", "Put Away Tow Ropes","",{_this call AdvLog_fnc_putAwayTowRopes;},{_existingTowRopes = (_this select 0) getVariable ["SA_Tow_Ropes",[]]; (count _existingTowRopes) > 0},{}] call ace_interact_menu_fnc_createAction;

[_vehicle, 0, ["ACE_MainActions"], _myaction] call ace_interact_menu_fnc_addActionToObject;


_myaction = ["AdvTow_RopeLength", "Rope Length","",{},{_existingTowRopes = (_this select 0) getVariable ["SA_Tow_Ropes",[]]; count _existingTowRopes > 0},{}] call ace_interact_menu_fnc_createAction;

[_vehicle, 0, ["ACE_MainActions"], _myaction] call ace_interact_menu_fnc_addActionToObject;

_myaction = ["AdvTow_Ten", "10 Meter","",{[_this, 10] call AdvLog_fnc_windTowRope;},{_existingTowRopes = (_this select 0) getVariable ["SA_Tow_Ropes",[]]; _ropeLength = (_this select 0) getVariable ["SA_RopeLength", 0];(count _existingTowRopes > 0 AND _ropeLength <= 7)},{}] call ace_interact_menu_fnc_createAction;

[_vehicle, 0, ["ACE_MainActions", "AdvTow_RopeLength"], _myaction] call ace_interact_menu_fnc_addActionToObject;


_myaction = ["AdvTow_Five", "5 Meter","",{[_this, 5] call AdvLog_fnc_windTowRope;},{_existingTowRopes = (_this select 0) getVariable ["SA_Tow_Ropes",[]]; _ropeLength = (_this select 0) getVariable ["SA_RopeLength", 0];(count _existingTowRopes > 0 AND (_ropeLength >= 6 OR _ropeLength <= 4))},{}] call ace_interact_menu_fnc_createAction;

[_vehicle, 0, ["ACE_MainActions", "AdvTow_RopeLength"], _myaction] call ace_interact_menu_fnc_addActionToObject;


_myaction = ["AdvTow_Three", "3 Meter","",{[_this, 3] call AdvLog_fnc_windTowRope;},{_existingTowRopes = (_this select 0) getVariable ["SA_Tow_Ropes",[]]; _ropeLength = (_this select 0) getVariable ["SA_RopeLength", 0];(count _existingTowRopes > 0 AND _ropeLength >= 4)},{}] call ace_interact_menu_fnc_createAction;

[_vehicle, 0, ["ACE_MainActions", "AdvTow_RopeLength"], _myaction] call ace_interact_menu_fnc_addActionToObject;


// _ropeLength = (_this select 0) getVariable ["SA_RopeLength", 0];(count _existingTowRopes > 0 AND _ropeLength >= 8)