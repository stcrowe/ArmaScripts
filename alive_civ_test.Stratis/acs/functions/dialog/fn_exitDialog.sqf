_speaker = player getVariable ["acs_speaker", objNull];

if (isNull _speaker) exitWith {};

_speaker setVariable ["acs_busy", false, true];

player setVariable ["acs_speaker", objNull];

_damage = (getAllHitPointsDamage _civ) select 2;
_damaged = false;
{
	if (_x > 0.1) exitWith {_damaged = true;}
} forEach _damage;

if (!_damaged) then
{
	_distance = random 30;
}
else
{
	_distance = 0.1;
};

_position = getPosASL player vectorAdd (eyeDirection player vectorMultiply (_distance + 1));

_speaker setUnitPos "AUTO";
_speaker doMove _position;


//See https://github.com/acemod/ACE3/blob/419b5254582882c8447ac19cc4e39b1b723f094f/addons/interaction/XEH_postInit.sqf