params [["_faction", "CIV_F"], ["_blackList", []]];

_classes = nil;

_blackList append ["C_journalist_F", "C_man_pilot_F", "C_scientist_F", "C_Soldier_VR_F"];

if (_faction  == "CIV_F") then
{
	_classes = Format["(getText (_x >> 'faction')) == '%1' && (getText (_x >> 'vehicleClass') == 'Men') && !(getText (_x >> 'DLC') == 'Kart')", _faction ] configClasses (configFile >> "CfgVehicles");
}
else
{

	_classes = Format["getText (_x >> 'faction') == '%1' && getText (_x >> 'vehicleClass') == 'Men'", _faction ] configClasses (configFile >> "CfgVehicles");
};

_civilianClasses = [];
{
	_civilianClasses append [configName _x];
} forEach _classes;


_civilian = "C_man_pilot_F";

while {(_civilian in _blackList)} do
{
	_civilian = selectRandom _civilianClasses;
};

_civilian