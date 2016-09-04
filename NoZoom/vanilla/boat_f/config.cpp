class CfgPatches
{
	class A3_Boat_F_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Data_F",
			"A3_Characters_F",
			"A3_Weapons_F",
			"A3_Anims_F",
			"A3_Anims_F_Config_Sdr",
			"A3_Boat_F"
		};
	};
};
class CfgVehicles
{
	class AllVehicles;
	class Ship: AllVehicles
	{
		class ViewPilot;
	};
	class Ship_F: Ship
	{
		class ViewPilot: ViewPilot
		{
			minFov=0.75;
			maxFov=1.25;
			initFov=0.75;
		};
	};
};
