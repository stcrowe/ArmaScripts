params ["_markerName", "_faction", "_blacklistClass", "_max", "_min"];


_top = _min;

if (_min < _max) then
{
	_top = _max - _min
};

_amount = random _top;

_amount = _amount + _min;


// Create civilians in city
while {_amount > 0} do
{
	_newPosition = [_markerName] call MS_fnc_randomPositionInMarker;

	_civilian = [_faction, _blacklistClass] call MS_fnc_getRandomClass;

	if (!(isNil "_newPosition")) then
	{
		//_unit = _civilian createUnit [_newPosition, _newGroup, ""];

		_newGroup = createGroup civilian;
		_unit = _newGroup createUnit [_civilian, _newPosition, [], 0, "NONE"];

		{_x addCuratorEditableObjects [[_unit],true]} forEach allCurators;
	};

	_amount = _amount - 1;
};