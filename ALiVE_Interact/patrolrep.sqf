//ALiVE Combat Support
//call with null = this execVM "csupport.sqf";
params ["_object"];

[
_object, /* 0 object */
"Submit Patrol Report", /* 1 action title */
"\a3\ui_f_exp_a\Data\RscTitles\RscEGProgress\downloadicon_ca.paa", /* 2 idle icon */
"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\upload_ca.paa", /* 3 progress icon */
"true", /* 4 condition to show */
"true", /* 5 condition for action */
{["Control Center", "Connection requested."] call BIS_fnc_showSubtitle}, /* 6 code executed on start */
{hint "Identity verified"}, /* 7 code executed per tick */
{createDialog "RscDisplayALIVEPATROLREP"}, /* 8 code executed on completion */
{["Control Center", "Connection interrupted."] call BIS_fnc_showSubtitle}, /* 9 code executed on interruption */
["Connected"], /* 10 arguments */
3, /* 11 action duration */
0, /* 12 priority */
false, /* 13 remove on completion */
false /* 14 show unconscious */
] call bis_fnc_holdActionAdd;