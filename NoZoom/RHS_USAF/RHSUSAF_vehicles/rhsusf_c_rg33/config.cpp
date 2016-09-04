class CfgPatches
{
	class rhsusf_c_rg33_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"rhsusf_main",
			"rhsusf_c_troops",
			"A3_Soft_F_MRAP_01",
			"rhsusf_c_rg33"
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
			class MainTurret: NewTurret
			{
				class ViewOptics;
			};
		};
	};
	class MRAP_01_base_F: Car_F {};
	class rhsusf_rg33_base: MRAP_01_base_F
	{
		class Turrets: Turrets {};
	};
	class rhsusf_rg33_m2_d: rhsusf_rg33_base
	{
		class Turrets: Turrets
		{
			class M2_Turret: MainTurret
			{
				class ViewOptics: ViewOptics
				{
					initFov=0.7;
					minFov=0.7;
					maxFov=0.7;
				};
			};
		};
	};
};
