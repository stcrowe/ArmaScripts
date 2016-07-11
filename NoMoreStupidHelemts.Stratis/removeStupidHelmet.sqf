if (!isServer) exitWith {};

private ["_unit", "_headgear"];

_unit = param[0, objNull];

if (isNull _unit) exitWith{};

_headgear = headgear _unit;

switch (_headgear) do
{
	case "H_HelmetO_ocamo":
	{
		removeHeadgear _unit;
		_unit addHeadgear "H_HelmetB_grass";
	};

	case "H_HelmetO_oucamo":
	{
		removeHeadgear _unit;
		_unit addHeadgear "H_HelmetB_snakeskin";
	};

	case "H_HelmetLeaderO_ocamo";
	{
		removeHeadgear _unit;
		_unit addHeadgear "H_HelmetSpecB_paint1";
	};

	case "H_HelmetLeaderO_oucamo";
	{
		removeHeadgear _unit;
		_unit addHeadgear "H_HelmetSpecB_snakeskin";
	};

	case "H_HelmetSpecO_ocamo":
	{
		removeHeadgear _unit;
		_unit addHeadgear "H_HelmetB_light_grass";
	};


	case "H_HelmetSpecO_blk":
	{
		removeHeadgear _unit;
		_unit addHeadgear "H_HelmetB_light_black";
	};

	default
	{

	};
};