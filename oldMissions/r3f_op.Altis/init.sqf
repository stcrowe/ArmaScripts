execVM "R3F_LOG\init.sqf";

[] execVM "VCOMAI\init.sqf";


// Turn off ACE cargo
if (isServer) then
{
	[] spawn {

		waitUntil {!(isNil "ace_cargo_enable")};
		["ace_cargo_enable", false, true, true] call ace_common_fnc_setSetting;

	};
};

if (!isDedicated AND hasInterface) then
{

	[] spawn
	{


		if(!isNull player && isPlayer player) then {

			waituntil {!(IsNull (findDisplay 46))};

			orderAction = ['AdvTow_drop','Drop Tow Ropes','',{[player getVariable ["SA_Tow_Ropes_Vehicle", objNull], player] call AdvLog_fnc_dropTowRopes;},{!isNull (player getVariable ["SA_Tow_Ropes_Vehicle", objNull])}] call ace_interact_menu_fnc_createAction;

			[player, 1, ["ACE_SelfActions", "ACE_Equipment"], orderAction] call AdvLog_fnc_globalAddAction;


		};
	};



};

AdvLog_Init = true;

publicVariable "AdvLog_Init";