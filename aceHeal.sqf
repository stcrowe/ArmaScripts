//Put in trigger OnActivation


{
	if (_x isKindOf "Man") then
	{
		[_x, _x] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
	};

} foreach thisList;