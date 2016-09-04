[] spawn
{
	waitUntil {!isNull player && player == player};
	waitUntil{!isNil "BIS_fnc_init"};
	waitUntil {!(isNull (findDisplay 46))};

	 _action = ["open_tfaos", "TFA OS", "", {execVM "TFAOs\TFAOsMain.sqf";}, {(backpack player) in ["tf_rt1523g_black"]}] call ace_interact_menu_fnc_createAction;

	[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToObject;
};