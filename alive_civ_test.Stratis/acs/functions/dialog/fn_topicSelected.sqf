disableSerialization;

_speaker = player getVariable ["acs_speaker", objNull];

if (isNull _speaker) exitWith {};

_control = ((findDisplay 69) displayCtrl 1500);

if(lbCurSel _control == -1) exitWith {};

_topicSelected = parseNumber (_control lbData (lbCurSel _control));

_topics = _speaker getVariable ["acs_topics", []];

if (count _topics == 0) exitWith {};

_topic = _topics select _topicSelected;

_topicHeader = _topic select 0;
_topicBody = _topic select 1;



[_topicBody, _speaker] call ACS_fnc_displayBody;



if (count _topic > 3) then
{
	_action = _topic select 3;

	[_speaker] call _action;

	if (count _topic > 4) then
	{
		_subtopics = _topic select 4;

		_subtopics append ["<- Go Back", "", {true}, {}, _topics];

		_topics = _subtopics;
	};
};

[_topics, _speaker] call ACS_fnc_setupTopics;
