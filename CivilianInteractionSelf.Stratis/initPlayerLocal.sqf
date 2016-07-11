
// Add ace actions get down and go away to self-interaction window


orderAction = ['TA_OrderAction','Order Down','iconOrder.paa',{[player, player] call ace_interaction_fnc_getDown;},{!visibleMap}] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], orderAction] call ace_interact_menu_fnc_addActionToObject;