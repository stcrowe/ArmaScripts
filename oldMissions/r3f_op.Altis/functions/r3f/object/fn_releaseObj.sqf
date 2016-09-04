if (R3F_LOG_mutex_local_lock) then
{
	hintC STR_R3F_LOG_mutex_action_en_cours;
}
else
{

	// Added by Crowe - make creating most costly objects take longer to place

					_object = R3F_LOG_player_moves_object;

					_className = typeOf _object;

					if (_className != "") then
					{

							if (_className isKindOf "Static") then
							{
							_topIndex = nil;
							_bottomIndex = nil;

							_factoryClasses = R3F_CF_global_costs select 1;
							_factoryCosts = R3F_CF_global_costs select 2;

							{
								_category = _x;

								_index = _foreachIndex;

								if (count _category > 0) then
								{
									{

										if (_x == _className AND isNil "_bottomIndex") then
										{
											_bottomIndex = _foreachIndex;
										};
									} forEach _category;

									if (!(isNil "_bottomIndex") AND isNil "_topIndex") then
									{
										_topIndex = _index;
									};
								};

							} forEach _factoryClasses;

							_time = 0;

							if (!(isNil "_topIndex")) then
							{

								_time = (_factoryCosts select _topIndex) select _bottomIndex;
							};

							if (_time > 20) then
							{
								_time = floor (_time * 0.05);

								// Animation
								/*[] spawn
								{
									while {!isNull R3F_LOG_player_moves_object} do
									{
										player playMove "Acts_carFixingWheel";
										sleep 4;
									};
								};*/


								[_time, [],

									{
										player setVariable ["r3f_playAnimaion", false];

										R3F_LOG_player_moves_object = objNull;

									}, {hint "Cancelled"}, format ["Building %1", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")]] call ace_common_fnc_progressBar;

							}
							else
							{
									R3F_LOG_player_moves_object = objNull;
							};
						}
						else
						{
							R3F_LOG_player_moves_object = objNull;
						};
					};

					//Done




};