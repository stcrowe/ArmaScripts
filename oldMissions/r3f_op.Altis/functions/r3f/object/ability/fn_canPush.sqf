private ["_can_be_moved_by_player"];

params [["_object", objNull]];

if (isNull _object) exitWith {["Error: Object is Null"] call AdvLog_fnc_globalMessage;};

_class_heritage = [_object] call AdvLog_fnc_getObjectHeritage;

// Can object be moved by player?
_can_be_moved_by_push = false;
{
	if (_x in R3F_LOG_CFG_can_be_pushed_by_player) exitWith {_can_be_moved_by_push = true;};
} forEach _class_heritage;


_can_be_moved_by_push