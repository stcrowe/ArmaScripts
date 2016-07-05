
// Add ace actions get down and go away to self-interaction window
// You need to put this in initPlayerLocal.sqf
orderAction = ['TA_OrderAction','Order','iconOrder.paa',{},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], orderAction] call ace_interact_menu_fnc_addActionToObject;

getDown =["TA_GetDown", "Get Down!", "", {[player, player] call ace_interaction_fnc_getDown;}, {true}] call ace_interact_menu_fnc_createAction;
goAway =["TA_GoAway", "Go Away!", "", {[player] call ace_interaction_fnc_sendAway;}, {true}] call ace_interact_menu_fnc_createAction;


[player, 1, ["ACE_SelfActions", "TA_OrderAction"], getDown] call ace_interact_menu_fnc_addActionToObject;
[player, 1, ["ACE_SelfActions", "TA_OrderAction"], goAway] call ace_interact_menu_fnc_addActionToObject;