params [["_speaker", objNull]];

// Set speaker to busy
_speaker setVariable ["acs_busy", true, true];

//Stop the speaker
doStop _speaker;

//Speaker rotate to caller
//Rotator only glances at the player and then goes back to facing the way they were looking
/*_dirToCaller= [_speaker, player] call BIS_fnc_dirTo;

_speaker setDir _dirToCaller;*/

player setVariable ["acs_speaker", _speaker];


//_speakerGroup = (group _speaker);


disableSerialization;
createDialog "AdvancedConversationSystem";

ctrlSetText[1000, name _speaker];
ctrlSetText[1001, ""];

// Setup topics

_topics = _speaker getVariable ["acs_topics", []];

if (count _topics > 0) then
{
	[_topics, _speaker] call ACS_fnc_setupTopics;
};

// Setup up intro
_intros = _speaker getVariable ["acs_intro", []];


_generalIntros = ["Hello sir.", "Nice day.", "How can I help you?"];

_random = floor (random (count _generalIntros));

_speakIntro = _generalIntros select _random;


if (count _intros > 0) then
{

	_random = floor (random (count _intros));
	_intro = _intros select _random;
	_speakIntro = _intro;

};


[_speakIntro, _speaker] call ACS_fnc_displayBody;


/*

[

	[title topic,{condition code}, {excution code}, [ [body text, time], [body text, time] ], [children array] ]


]


*/