params [["_object", objNull]];

if (isNull _object) exitWith {["Error: Object is Null"] call AdvLog_fnc_globalMessage;};

_class_heritage = [_object] call AdvLog_fnc_getObjectHeritage;

_can_be_towed = false;
{
		if (_x in R3F_LOG_CFG_can_be_towed) exitWith {_can_be_towed = true;};
} forEach _class_heritage;

_can_be_towed