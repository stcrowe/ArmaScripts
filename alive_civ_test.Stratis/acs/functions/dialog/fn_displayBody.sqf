params [
	["_string", ""],
	["_speaker", objNull],
	["_fade", true]
];

disableSerialization;
if (isNull _speaker) exitWith {};


_array = toArray(_string);

_growBox = ((count _array) / 60);

if (_growBox > 1) then
{
	_control = ((findDisplay 69) displayCtrl 1001);

	_position = ctrlPosition _control;

	_height = 0.05 * (round _growBox);

	_control ctrlSetPosition [_position select 0, _position select 1, _position select 2, _height];

	_control ctrlCommit 0.1;
};

_speaker setRandomLip true;

_bodytext = "";

if (_fade) then
{
	{
		((findDisplay 69) displayCtrl _x) ctrlSetFade 0.75;
		((findDisplay 69) displayCtrl _x) ctrlCommit 0.5;
		ctrlEnable [_x, false];
	} forEach [1500, 1000];
};

for "_i" from 0 to (count _array)-1 do
{
	if (player getVariable ["acs_speaker", objNull] == _speaker) then
	{
		_bodytext = _bodytext + toString([_array select _i]);
		ctrlSetText[1001, _bodytext];

		sleep 0.05;
	};
};

if (_fade) then
{
	{
		((findDisplay 69) displayCtrl _x) ctrlSetFade 0;
		((findDisplay 69) displayCtrl _x) ctrlCommit 0.5;
		ctrlEnable [_x, true];
	} forEach [1500, 1000];
};

_speaker setRandomLip false;
