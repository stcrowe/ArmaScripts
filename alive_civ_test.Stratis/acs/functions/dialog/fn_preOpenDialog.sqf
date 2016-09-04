params [["_speaker", objNull]];

if (isNull _speaker) exitWith {systemChat "NULL SPEAKER";};

//Is ALIVE active
/*
if (isNil "ACS_ALiVE_CHECK") then
{
	missionNamespace setVariable ["ACS_ALiVE_CHECK", isClass (configFile >> "CfgPatches" >> "ALIVE_main"), true];
};*/

if (_speaker getVariable ["agentID", ""] != "") then
{
	[_speaker] call ACS_fnc_civTopicSetup;
};




if (count (_speaker getVariable ["acs_intro", []]) > 0) then
{
	_busy = _speaker getVariable ["acs_busy", false];

	if (_busy) exitWith {[Name _speaker, "Is Busy"] call BIS_fnc_showSubtitle;};

	if (combatMode (group _speaker) == "RED") exitWith {[Name _speaker, "Is Busy"] call BIS_fnc_showSubtitle;};

	[_speaker] spawn ACS_fnc_openDialog;
}
else
{
	[name _speaker, "Has Nothing to Say"] call BIS_fnc_showSubtitle;
};