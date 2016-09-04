params ["_target", "_caller", ["_amount", 0]];


_townelder = _target getVariable ["townelder", false];
_major = _target getVariable ["major", false];
_muezzin = _target getVariable ["muezzin", false];
_priest = _target getVariable ["priest", false];
_politician = _target getVariable ["politician", false];

_pos = getposATL _target;
_value = 10;

if (_townelder) then {_value = 35};
if (_major) then {_value = 30};
if (_muezzin) then {_value = 25};
if (_priest) then {_value = 20};
if (_politician) then {_value = 15};

if (_amount > 0) then
{
	_value = _amount;
};



[_pos,[str(side _caller)], _value * -1] call ALiVE_fnc_updateSectorHostility;
[_pos,["EAST","WEST","GUER"] - [str(side _caller)], _value] call ALiVE_fnc_updateSectorHostility;