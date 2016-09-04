/**
 * Modified by Sean Crowe, original script by Team ~R3F~
 * please see orginal work @ https://forums.bistudio.com/topic/170033-r3f-logistics/
 *
 * To get a full list of changes please contant me on the biforums under the username S.Crowe
 *
 * Copyright (C) 2014 Team ~R3F~
 *
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

params [["_object", objNull]];

[_object select 0] spawn
{
	private ["_config", "_name"];

	params [["_object", objNull]];

	if (isNull _object) exitWith {};

	if (!(missionNamespace getVariable ["AdvLog_Endabled", true])) exitWith {};

	waitUntil {!isNil "R3F_LOG_active"};

	_config = configFile >> "CfgVehicles" >> (typeOf _object);
	_name = getText (_config >> "displayName");

	// If the variable does not exist, then create it
	if (isNil {_object getVariable "R3F_LOG_is_transported_by"}) then
	{
		_object setVariable ["R3F_LOG_is_transported_by", objNull, false];
	};

	// If the variable does not exist, then create it
	if (isNil {_object getVariable "R3F_LOG_is_moved_by"}) then
	{
		_object setVariable ["R3F_LOG_is_moved_by", objNull, false];
	};


	// Determin if the object can tow, can be towed, can hold cargo, or can be moved


	if ([_object] call AdvLog_fnc_canMove) then
	{

		_myaction = ["R3F_move", format [STR_R3F_LOG_action_move_object, _name],"z\ace\addons\dragging\UI\icons\box_carry.paa",{_this spawn AdvLog_fnc_moveObj;},{!R3F_LOG_mutex_local_lock},{}] call ace_interact_menu_fnc_createAction;

		[_object, 0, ["ACE_MainActions"], _myaction] call ace_interact_menu_fnc_addActionToObject;

	};

	if ([_object] call AdvLog_fnc_canTow) then
	{
		[_object] call AdvLog_fnc_towingInit;
	};

	if (_object isKindOf "Land_BagFence_Long_F") then
	{
		systemChat "Bag";
	};

	if ([_object] call AdvLog_fnc_canBeTowed) then
	{
		_myaction = ["AdvTow_attachRopes", "Attach To Tow Ropes","",{_this call AdvLog_fnc_attachTowRopes;},{_this call AdvLog_fnc_canAttachTowRopes},{}] call ace_interact_menu_fnc_createAction;

		[_object, 0, ["ACE_MainActions"], _myaction] call ace_interact_menu_fnc_addActionToObject;

		if (_object isKindOf "Land_BagFence_Long_F") then
	{
		systemChat "Moveable";
	};
	};

	if (([_object] call AdvLog_fnc_canBeTransported) select 0) then
	{

		_myaction = ["R3F_load", format [STR_R3F_LOG_action_select_object_load, _name],"z\ace\addons\cargo\UI\Icon_load.paa",{_this call AdvLog_fnc_selected;},{!R3F_LOG_mutex_local_lock},{}] call ace_interact_menu_fnc_createAction;

		[_object, 0, ["ACE_MainActions"], _myaction] call ace_interact_menu_fnc_addActionToObject;

	};

	if (([_object] call AdvLog_fnc_canTransport) select 0) then
	{

		[_object] call AdvLog_fnc_transportInit;

	};

	if (([_object] call AdvLog_fnc_canPush)) then
	{
		if (getMass _object < 10000) then
		{
			_myaction = ["R3F_push", "Push","",{_this call ace_interaction_fnc_push},{vectorMagnitude velocity _target < 3},{}] call ace_interact_menu_fnc_createAction;

			[_object, 0, ["ACE_MainActions"], _myaction] call ace_interact_menu_fnc_addActionToObject;
		};
	};

};