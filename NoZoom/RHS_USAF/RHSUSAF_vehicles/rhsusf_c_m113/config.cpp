class CfgPatches
{
	class rhsusf_c_m113_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=1.3200001;
		requiredAddons[]=
		{
			"rhsusf_main",
			"rhsusf_c_troops",
			"A3_CargoPoses_F",
			"rhsusf_c_heavyweapons",
			"rhsusf_c_m113"
		};
		version="0.1.1.1";
		magazines[]={};
		ammo[]={};
	};
};
class RCWSOptics;
class CfgVehicles
{
	class LandVehicle;
	class Tank: LandVehicle
	{
		class NewTurret;
	};
	class Tank_F: Tank
	{
		class Turrets
		{
			class MainTurret: NewTurret
			{
				class Turrets {};
			};
		};
		class ViewOptics;
	};
	class APC_Tracked_02_base_F: Tank_F {};
	class rhsusf_m113tank_base: APC_Tracked_02_base_F
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewOptics: RCWSOptics {};
				class ViewGunner: ViewOptics
				{
					initFov=0.75;
					minFov=0.75;
					maxFov=0.75;
				};
			};
		};
	};
};
