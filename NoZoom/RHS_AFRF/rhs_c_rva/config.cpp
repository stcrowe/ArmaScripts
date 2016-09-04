class CfgPatches
{
	class rhs_c_rva_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"rhs_main",
			"rhs_decals",
			"rhs_c_troops",
			"rhs_c_rva"
		};
		version="0.1.1.1";
		magazines[]={};
		ammo[]={};
	};
};
class CfgVehicles
{
	class LandVehicle;
	class Car: LandVehicle
	{
		class NewTurret;
	};
	class Car_F: Car
	{
		class Turrets
		{
			class MainTurret: NewTurret {};
		};
	};
	class Truck_F: Car_F {};
	class OTR21_Base: Truck_F
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewCargo
				{
					initFov=0.7;
					minFov=0.7;
					maxFov=0.7;
				};
			};
		};
	};
};