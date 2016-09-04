class CfgPatches
{
	class rhs_c_trucks_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=1.3200001;
		requiredAddons[]=
		{
			"rhs_main",
			"rhs_decals",
			"rhs_c_troops",
			"rhs_weapons",
			"A3_Soft_F",
			"A3_CargoPoses_F",
			"rhs_c_trucks"
		};
		version="0.1.1.1";
		magazines[]={};
		ammo[]={};
	};
};
class ViewPilot;
class CfgVehicles
{
	class Car;
	class Car_F: Car {};
	class Truck_F: Car_F {};
	class rhs_truck: Truck_F
	{
		class ViewPilot: ViewPilot
		{
			initFov=0.7;
			minFov=0.7;
			maxFov=1.4;
		};
	};
};
