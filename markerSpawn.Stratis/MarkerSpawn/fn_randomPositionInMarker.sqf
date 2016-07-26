params [["_marker", nil], ["_centerSeeking", false]];

_marker = param [0, nil];
_newPosition = nil;

if (!isNil "_marker") then
{

	// Check if maker exist
	if (getMarkerColor _marker == "") exitWith
	{
		_message = format ["%1 (marker) does not exist", _marker];

	};

	// Get random position based on marker shape

	_shape = markerShape _marker;
	_center = getMarkerPos _marker;
	_size = getMarkerSize _marker;


	switch (_shape) do
	{
		case "RECTANGLE":
		{
			// Get random x
			_cenX = _center select 0;
			_sizeX = _size select 0;

			_minX = _cenX - (_sizeX);

			_varX = 0;

			if (_centerSeeking) then
			{
				_varX = random [0, _sizeX, (_sizeX*2)];
			}
			else
			{
				_varX = random (_sizeX*2);
			};

			_posX = _minX + _varX;

			// Get random y
			_cenY = _center select 1;
			_sizeY = _size select 1;

			_minY = _cenY - (_sizeY);

			_varY = 0;

			if (_centerSeeking) then
			{
				_varY = random [0, _sizeY, (_sizeY*2)];
			}
			else
			{
				_varY = random (_sizeY*2);
			};

			_posY = _minY + _varY;

			_newPosition = [_posX, _posY, 0];
		};

		default
		{
			/* STATEMENT */
			format ["BUTT"] remoteExecCall ['hint',[0,-2] select (isMultiplayer && isDedicated)];
		};
	};

	// Is marker rotated?
	_angle = markerDir _marker;

	if (_angle != 0 && !(isNil "_newPosition")) then
	{
		_newPosition = [_center, _newPosition, _angle] call MS_fnc_rotateVector2d;
	};

};

_newPosition;