/* ----------------------------------------------------------------------------
Function: TA_fnc_rotateVector2d
Description: Returns a  new instance positon rotated through angle _angle along the z-axis in the anti-clockwise direction
Military objectives

Parameters:
Vector3 - origin of axis (position of marker)
Vector3 - original point prior to translation
Scalar - angle of rotation of the axis
Boolean - true if rotation is clockwise, false if rotation is anti-clockwise [defualt: true]

Returns:
Vector3 - the new instance positon rotated through angle _angle


Examples:
[position marker, position player, 45] call TA_fnc_rotateVector2d; -- will move player 45 degrees from current position around the center of the marker


Author:
S.Crowe
---------------------------------------------------------------------------- */


params [["_origin", nil], ["_point", nil], ["_angle", nil], ["_clockwise", true]];

if ((isNil "_origin") OR (isNil "_point") OR (isNil "_angle")) exitWith {["Incorrect params for TA_fnc_rotateTranslation"] call TA_fnc_debugLog;};

// Get origin x,y
_originX = _origin select 0;
_originY = _origin select 1;


// Get old point x,y
_pointX = _point select 0;
_pointY = _point select 1;
_pointZ = _point select 2;

// Translate to center (0,0)
_translateX = _pointX - _originX;
_translateY = _pointY - _originY;

// Get radius
_radius = sqrt ((_translateX * _translateX) +  (_translateY * _translateY));


// If clockwise, switch it to counterclockwise
if (_clockwise) then
{
	_angle = 360 - _angle;
};


// Treat Like Circle

// What is our current angle from 0?
_currentAngle = _translateY atan2 _translateX;


// If angle is between 181 and 356, the results will be negative - so for angle of 225, it gets returned as -135
if (_currentAngle < 0) then
{
	_currentAngle = _currentAngle + 360;
};

// Rotate are angle by _angle
_newAngle = _currentAngle + _angle;

// Now get our rotated point
_newX = _radius * (cos _newAngle);
_newY = _radius * (sin _newAngle);

// Translate the point back to (_originX, _originY)
_newX = _newX + _originX;
_newY = _newY + _originY;

// Return new vector
[_newX, _newY, _pointZ]