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

if (!(missionNamespace getVariable ["AdvLog_Endabled", true])) exitWith {};

	/* DEBUT import config */

	// Initialise les listes vides avant que le config.sqf les concat?ne
	R3F_LOG_CFG_can_tow = [];
	R3F_LOG_CFG_can_be_towed = [];
	R3F_LOG_CFG_can_lift = [];
	R3F_LOG_CFG_can_be_lifted = [];
	R3F_LOG_CFG_can_transport_cargo = [];
	R3F_LOG_CFG_can_be_transported_cargo = [];
	R3F_LOG_CFG_can_be_moved_by_player = [];
	R3F_LOG_CFG_can_be_pushed_by_player = [];

	#include "config.sqf"

	// Chargement du fichier de langage
	call compile preprocessFile format ["R3F_LOG\%1_strings_lang.sqf", R3F_LOG_CFG_language];

	/*
	 * On inverse l'ordre de toutes les listes de noms de classes pour donner
	 * la priorit? aux classes sp?cifiques sur les classes g?n?riques
	 */
	reverse R3F_LOG_CFG_can_tow;
	reverse R3F_LOG_CFG_can_be_towed;
	reverse R3F_LOG_CFG_can_lift;
	reverse R3F_LOG_CFG_can_be_lifted;
	reverse R3F_LOG_CFG_can_transport_cargo;
	reverse R3F_LOG_CFG_can_be_transported_cargo;
	reverse R3F_LOG_CFG_can_be_moved_by_player;

	// On passe tous les noms de classes en minuscules
	{R3F_LOG_CFG_can_tow set [_forEachIndex, toLower _x];} forEach R3F_LOG_CFG_can_tow;
	{R3F_LOG_CFG_can_be_towed set [_forEachIndex, toLower _x];} forEach R3F_LOG_CFG_can_be_towed;
	{R3F_LOG_CFG_can_lift set [_forEachIndex, toLower _x];} forEach R3F_LOG_CFG_can_lift;
	{R3F_LOG_CFG_can_be_lifted set [_forEachIndex, toLower _x];} forEach R3F_LOG_CFG_can_be_lifted;
	{R3F_LOG_CFG_can_transport_cargo select _forEachIndex set [0, toLower (_x select 0)];} forEach R3F_LOG_CFG_can_transport_cargo;
	{R3F_LOG_CFG_can_be_transported_cargo select _forEachIndex set [0, toLower (_x select 0)];} forEach R3F_LOG_CFG_can_be_transported_cargo;
	{R3F_LOG_CFG_can_be_moved_by_player set [_forEachIndex, toLower _x];} forEach R3F_LOG_CFG_can_be_moved_by_player;

	// We construct the list of classes of carriers in quantity associated (four the nearestObjects, count isKindOf, ...)
	R3F_LOG_transporter_classes = [];
	{
		R3F_LOG_transporter_classes pushBack (_x select 0);
	} forEach R3F_LOG_CFG_can_transport_cargo;

	// We construct the list of classes of transportable in quantity (for the nearestObjects, count isKindOf, ...)
	R3F_LOG_classes_transportable_objects = [];
	{
		R3F_LOG_classes_transportable_objects pushBack (_x select 0);
	} forEach R3F_LOG_CFG_can_be_transported_cargo;

	// Gestion compatibilit? fichier de config 3.0 => 3.1 (d?finition de valeurs par d?faut)
	if (isNil "R3F_LOG_CFG_lock_objects_mode") then {R3F_LOG_CFG_lock_objects_mode = "side";};
	if (isNil "R3F_LOG_CFG_unlock_objects_timer") then {R3F_LOG_CFG_unlock_objects_timer = 30;};
	if (isNil "R3F_LOG_CFG_CF_sell_back_bargain_rate") then {R3F_LOG_CFG_CF_sell_back_bargain_rate = 0.75;};
	if (isNil "R3F_LOG_CFG_CF_creation_cost_factor") then {R3F_LOG_CFG_CF_creation_cost_factor = [];};

	/* FIN import config */

	if (isServer) then
	{
		// We create the attachment point which will be used to attachTo for objects which ar loaded virtually in Vehicles
		R3F_LOG_PUBVAR_point_attache = "Land_HelipadEmpty_F" createVehicle [0,0,0];
		R3F_LOG_PUBVAR_point_attache setPosASL [0,0,0];
		R3F_LOG_PUBVAR_point_attache setVectorDirAndUp [[0,1,0], [0,0,1]];

		// Sharing the point of attachment with all players
		publicVariable "R3F_LOG_PUBVAR_point_attache";

		/** List of objects not to lost in a vehicle / cargo if destroyed */
		R3F_LOG_liste_objects_a_proteger = [];

		/* Protects the presents objects in   */
		//execVM "R3F_LOG\monitor_objects_to_protect.sqf";
	};


	/** Pseudo- mutex to do such ? Cuter than a script object manipulation ? both (true : v rusty ? ) */
	R3F_LOG_mutex_local_lock = false;

	call compile preprocessFile "R3F_LOG\general_functions\lib_geometrie_3D.sqf";

	// Are we a server?
	if !(isDedicated) then
	{
		//The client waits for the server have cr ?? and published ? r ? f ? rence of the object serving as an attachment point
		waitUntil {!isNil "R3F_LOG_PUBVAR_point_attache"};

		/** Indicates which object the player is currently ? S place , if no objNull */
		R3F_LOG_player_moves_object = objNull;

		/** Subject currently s ? Lect to ? Be loaded ? / Towed ? */
		R3F_LOG_object_selectionne = objNull;

		/** Array containing all the cr ?? es factories */
		R3F_LOG_CF_liste_factorys = [];

		call compile preprocessFile "R3F_LOG\general_functions\lib_visualization_object.sqf";


		R3F_LOG_FNCT_factory_complete_list_objects = compile preprocessFile "R3F_LOG\creation_factory\complete_list_objects.sqf";
		R3F_LOG_FNCT_factory_create_object = compile preprocessFile "R3F_LOG\creation_factory\create_object.sqf";
		R3F_LOG_FNCT_factory_open_factory = compile preprocessFile "R3F_LOG\creation_factory\open_factory.sqf";
		R3F_LOG_FNCT_factory_resell_moves = compile preprocessFile "R3F_LOG\creation_factory\resell_moves.sqf";
		R3F_LOG_FNCT_factory_resell_selection = compile preprocessFile "R3F_LOG\creation_factory\resell_selection.sqf";
		R3F_LOG_FNCT_factory_resell_direct = compile preprocessFile "R3F_LOG\creation_factory\resell_direct.sqf";
		R3F_LOG_FNCT_determine_cost_creation = compile preprocessFile "R3F_LOG\creation_factory\determine_cost_creation.sqf";

		R3F_LOG_FNCT_format_number_of_integer_thousands = compile preprocessFile "R3F_LOG\general_functions\format_number_of_integer_thousands.sqf";

		// List of variables or not activating the menu actions
		R3F_LOG_action_load_valid_moves = false;
		R3F_LOG_action_load_valid_selection = false;
		R3F_LOG_action_valid_vehicle_content = false;

		R3F_LOG_action_tow_valid_movese = false;

		R3F_LOG_action_valid_heliporter = false;
		R3F_LOG_action_heliport_drop_valid = false;

		R3F_LOG_action_moving_valid_object = false;
		R3F_LOG_action_tow_valid_direct = false;
		R3F_LOG_action_valid_detach = false;
		R3F_LOG_action_select_object_valid_load = false;

		R3F_LOG_action_valid_open_factory  = false;
		R3F_LOG_action_sell_factory_direct_valid = false;
		R3F_LOG_action_sell_valid_factory_moves = false;
		R3F_LOG_action_sell_valid_selection  = false;

		R3F_LOG_action_unlock_valid = false;
	};

	R3F_LOG_active = true;
