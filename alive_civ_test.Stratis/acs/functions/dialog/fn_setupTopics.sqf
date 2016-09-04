params [["_topics", []], ["_speaker", objNull]];

player setVariable ["acs_currentTopics", _topics];

if (isNull _speaker) exitWith {};

if (!(typeName _topics == "ARRAY")) exitWith {};

_control = ((findDisplay 69) displayCtrl 1500);

lbClear _control;

{
	_topicHeader = _x select 0;
	_topicBody = _x select 1;
	_condition = _x select 2;
	_action = _x select 3;


	_show = [_speaker] call _condition;

	if (_show) then
	{
		_control lbAdd _topicHeader;
		_control lbSetData[(lbSize _control)-1,(str _forEachIndex)];
	};
} forEach _topics;