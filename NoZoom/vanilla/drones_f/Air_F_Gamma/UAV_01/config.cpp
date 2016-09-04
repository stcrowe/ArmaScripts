class CfgPatches
{
	class A3_Air_F_Gamma_UAV_01_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Air_F_Beta",
			"A3_Weapons_F",
			"A3_Air_F_Gamma_UAV_01"
		};
	};
};
class CfgVehicles
{
	class Helicopter;
	class Helicopter_Base_F: Helicopter
	{
		class ViewPilot;
	};
	class UAV_01_base_F: Helicopter_Base_F
	{
		class ViewPilot: ViewPilot
		{
			minFov=0.75;
			maxFov=1.25;
			initFov=0.75;
		};
	};
};
