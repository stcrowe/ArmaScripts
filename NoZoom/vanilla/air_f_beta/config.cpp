class CfgPatches
{
	class A3_Air_F_Beta_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Characters_F",
			"A3_Weapons_F",
			"A3_Anims_F",
			"A3_Anims_F_Config_Sdr",
			"A3_Air_F_Beta"
		};
	};
};
class CfgVehicles
{
	class AllVehicles;
	class Air: AllVehicles
	{
		class ViewPilot;
	};
	class Plane: Air
	{
		class ViewPilot: ViewPilot
		{
			minFov=0.75;
			maxFov=1.25;
			initFov=0.75;
		};
	};
	class Helicopter: Air
	{
		class ViewPilot;
	};
	class ParachuteBase: Helicopter
	{
		class ViewPilot: ViewPilot
		{
			minFov=0.75;
			maxFov=0.75;
			initFov=0.75;
		};
	};
};
