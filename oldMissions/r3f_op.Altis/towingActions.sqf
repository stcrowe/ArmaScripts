params [["_vehicle", objNull]];

if (isNull _vehicle) exitWith {};


_myaction = ["AdvTow_takeRopes", "Deploy Tow Ropes","",{_this call SA_Take_Tow_Ropes_Action;},{_this call SA_Can_Take_Tow_Ropes},{}] call ace_interact_menu_fnc_createAction;

[_vehicle, 0, ["ACE_MainActions"], _myaction] call ace_interact_menu_fnc_addActionToObject;


_myaction = ["AdvTow_putAwayRopes", "Put Away Tow Ropes","",{_this call SA_Put_Away_Tow_Ropes_Action;},{_this call SA_Can_Put_Away_Tow_Ropes},{}] call ace_interact_menu_fnc_createAction;

[_vehicle, 0, ["ACE_MainActions"], _myaction] call ace_interact_menu_fnc_addActionToObject;


_myaction = ["AdvTow_takeRopesAgain", "PickupRope","",{_this call SA_Put_Away_Tow_Ropes_Action;},{_this call SA_Can_Put_Away_Tow_Ropes},{}] call ace_interact_menu_fnc_createAction;

[_vehicle, 0, ["ACE_MainActions"], _myaction] call ace_interact_menu_fnc_addActionToObject;



/*
player addAction ["Deploy Tow Ropes", {
		[] call SA_Take_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call SA_Take_Tow_Ropes_Action_Check"];

	player addAction ["Put Away Tow Ropes", {
		[] call SA_Put_Away_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call SA_Put_Away_Tow_Ropes_Action_Check"];

	player addAction ["Attach To Tow Ropes", {
		[] call SA_Attach_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call SA_Attach_Tow_Ropes_Action_Check"];

	player addAction ["", {
		[] call SA_Drop_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call SA_Drop_Tow_Ropes_Action_Check"];

	player addAction ["Pickup Tow Ropes", {
		[] call SA_Pickup_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call SA_Pickup_Tow_Ropes_Action_Check"];

	player addEventHandler ["Respawn", {
		player setVariable ["SA_Tow_Actions_Loaded",false];
	}];*/