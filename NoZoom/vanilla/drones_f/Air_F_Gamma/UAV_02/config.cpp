class CfgPatches
{
	class A3_Air_F_Gamma_UAV_02_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Air_F_Beta",
			"A3_Air_F_Gamma_UAV_02"
		};
	};
};
class CfgVehicles
{
	class Plane;
	class UAV: Plane
	{
		class ViewPilot;
	};
	class UAV_02_base_F: UAV
	{
		class ViewPilot: ViewPilot
		{
			minFov=0.75;
			maxFov=1.25;
			initFov=0.75;
		};
	};
};
