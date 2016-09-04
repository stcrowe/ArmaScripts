private ["_vehicle","_canTakeTowRopes"];
	params ["_vehicle", "_player"];
	if([_vehicle, _player] call AdvLog_fnc_canTakeTowRopes) then {

		if (!local _vehicle) then
		{
			private ["_time_demande_setOwner"];
			_time_demande_setOwner = time;

			[_vehicle, clientOwner] remoteExec ["AdvLog_fnc_setOwner", 2];

		};

		private ["_existingTowRopes","_hitchPoint","_rope"];
		_existingTowRopes = _vehicle getVariable ["SA_Tow_Ropes",[]];
		if (count _existingTowRopes == 0) then {
			_hitchPoint = [_vehicle] call AdvLog_fnc_getHitchPoints select 1;
			_rope = ropeCreate [_vehicle, _hitchPoint, 10];
			_vehicle setVariable ["SA_Tow_Ropes",[_rope],true];
			_this call AdvLog_fnc_pickupTowRopes;
		};

	};