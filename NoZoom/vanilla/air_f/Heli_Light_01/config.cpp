class CfgPatches
{
	class A3_Air_F_Heli_Light_01_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Air_F",
			"A3_Air_F_Heli_Light_01"
		};
	};
};
class CfgVehicles
{
	class Helicopter_Base_F;
	class Helicopter_Base_H: Helicopter_Base_F
	{
		class ViewOptics;
	};
	class Heli_Light_01_base_F: Helicopter_Base_H
	{
		class ViewOptics: ViewOptics
		{
			minFov=0.75;
			maxFov=0.75;
			initFov=0.75;
		};
	};
};
