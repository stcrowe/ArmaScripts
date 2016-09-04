class CfgPatches
{
	class A3_Soft_F_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Characters_F",
			"A3_Data_F",
			"A3_Weapons_F_Acc",
			"A3_Weapons_F",
			"A3_Anims_F",
			"A3_Anims_F_Config_Sdr",
			"A3_Soft_F"
		};
	};
};
class CfgVehicles
{
	class LandVehicle;
	class Car: LandVehicle
	{
		class ViewPilot;
	};
	class Car_F: Car
	{
		class ViewPilot: ViewPilot
		{
			minFov=0.75;
			maxFov=1.25;
			initFov=0.75;
		};
	};
};