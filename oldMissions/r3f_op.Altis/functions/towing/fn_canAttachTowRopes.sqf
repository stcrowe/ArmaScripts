params ["_cargo"];

private ["_canTow", "_vehicle", "_rules"];

_rules = [
	["Tank","CAN_TOW","Tank"],
	["Tank","CAN_TOW","Car"],
	["Tank","CAN_TOW","Ship"],
	["Tank","CAN_TOW","Air"],
	["Car","CAN_TOW","Tank"],
	["Car","CAN_TOW","Car"],
	["Car","CAN_TOW","Ship"],
	["Car","CAN_TOW","Air"],
	["Ship","CAN_TOW","Ship"]
];


_vehicle = player getVariable ["SA_Tow_Ropes_Vehicle", objNull];
_canTow = false;
if(not isNull _vehicle && not isNull _cargo) then {
	{
		if(_vehicle isKindOf (_x select 0)) then {
			if(_cargo isKindOf (_x select 2)) then {
				if( (toUpper (_x select 1)) == "CAN_TOW" ) then {
					_canTow = true;
				} else {
					_canTow = false;
				};
			};
		};
	} forEach (missionNamespace getVariable ["SA_TOW_RULES_OVERRIDE",_rules]);
};


if(!isNull _vehicle && !isNull _cargo) then
{
	(_canTow && vehicle player == player && player distance _cargo < 10 && _vehicle != _cargo)
}
else
{
	false
};