class CfgPatches
{
	class A3_Characters_F_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Data_F",
			"A3_Weapons_F",
			"A3_Characters_F"
		};
	};
};
class CfgVehicles
{
	class Land;
	class Man: Land
	{
		class ViewPilot;
	};
	class CAManBase: Man
	{
		class ViewPilot: ViewPilot
		{
			minFov=0.75;
			maxFov=0.75;
			initFov=0.75;
		};
	};
	class Civilian: CAManBase {};
	class Civilian_F: Civilian {};
	class VirtualMan_F: Civilian_F
	{
		class ViewPilot
		{
			initFov=0.75;
			maxFov=0.75;
			minFov=0.75;
		};
	};
};
