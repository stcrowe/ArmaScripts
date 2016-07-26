if (isServer) then
{
	MS_fnc_rotateVector2d = compile preprocessFileLineNumbers "MarkerSpawn\fn_rotateVector2d.sqf";
	MS_fnc_randomPositionInMarker = compile preprocessFileLineNumbers "MarkerSpawn\fn_randomPositionInMarker.sqf";
	MS_fnc_getRandomClass = compile preprocessFileLineNumbers "MarkerSpawn\fn_getRandomClass.sqf";
	MS_fnc_SpawnInMarker = compile preprocessFileLineNumbers "MarkerSpawn\fn_SpawnInMarker.sqf";

	waitUntil {!(isNil "ALIVE_profileHandler")};

	["city", "BLU_F", [], 40, 30] call MS_fnc_SpawnInMarker;
	[] call ALiVE_fnc_createProfilesFromUnitsRuntime;

	["city2", "BLU_F", [], 40, 30] call MS_fnc_SpawnInMarker;
	[] call ALiVE_fnc_createProfilesFromUnitsRuntime;


};