#define SA_Get_Cargo(_vehicle,_cargo) \
if( count (ropeAttachedObjects _vehicle) == 0 ) then { \
	_cargo = objNull; \
} else { \
	_cargo = ((ropeAttachedObjects _vehicle) select 0) getVariable ["SA_Cargo",objNull]; \
};


params ["_vehicle"];

	private ["_runSimulation","_currentCargo","_maxVehicleSpeed","_maxTowedVehicles","_vehicleMass"];

	_maxVehicleSpeed = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "maxSpeed");
	_vehicleMass = 1000 max (getMass _vehicle);
	_maxTowedCargo = missionNamespace getVariable ["SA_MAX_TOWED_CARGO",2];
	_runSimulation = true;

	private ["_currentVehicle","_totalCargoMass","_totalCargoCount","_findNextCargo","_towRopes","_ropeLength"];
	private ["_ends","_endsDistance","_currentMaxSpeed","_newMaxSpeed"];

	while {_runSimulation} do {

		// Calculate total mass and count of cargo being towed (only takes into account
		// cargo that's actively being towed (e.g. there's no slack in the rope)

		_currentVehicle = _vehicle;
		_totalCargoMass = 0;
		_totalCargoCount = 0;
		_findNextCargo = true;
		while {_findNextCargo} do {
			_findNextCargo = false;
			SA_Get_Cargo(_currentVehicle,_currentCargo);
			if(!isNull _currentCargo) then {
				_towRopes = _currentVehicle getVariable ["SA_Tow_Ropes",[]];
				if(count _towRopes > 0) then {
					_ropeLength = ropeLength (_towRopes select 0);
					_ends = ropeEndPosition (_towRopes select 0);
					_endsDistance = (_ends select 0) distance (_ends select 1);
					if( _endsDistance >= _ropeLength - 2 ) then {
						_totalCargoMass = _totalCargoMass + (1000 max (getMass _currentCargo));
						_totalCargoCount = _totalCargoCount + 1;
						_currentVehicle = _currentCargo;
						_findNextCargo = true;
					};
				};
			};
		};

		_newMaxSpeed = _maxVehicleSpeed / (1 max ((_totalCargoMass /  _vehicleMass) * 2));
		_newMaxSpeed = (_maxVehicleSpeed * 0.75) min _newMaxSpeed;

		// Prevent vehicle from moving if trying to move more cargo than pre-defined max
		if(_totalCargoCount > _maxTowedCargo) then {
			_newMaxSpeed = 0;
		};

		_currentMaxSpeed = _vehicle getVariable ["SA_Max_Tow_Speed",_maxVehicleSpeed];

		if(_currentMaxSpeed != _newMaxSpeed) then {
			_vehicle setVariable ["SA_Max_Tow_Speed",_newMaxSpeed];
		};

		sleep 0.1;

	};