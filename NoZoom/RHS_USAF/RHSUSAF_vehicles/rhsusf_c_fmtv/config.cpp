class CfgPatches
{
	class rhsusf_c_fmtv_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=1.38;
		requiredAddons[]=
		{
			"rhsusf_main",
			"rhsusf_c_troops",
			"A3_Soft_F_HEMTT",
			"rhsusf_c_fmtv"
		};
		version="0.1.1.1";
		magazines[]={};
		ammo[]={};
	};
};
class CfgVehicles
{
	class Car;
	class Car_F: Car
	{
		class Turrets;
	};
	class Truck_F: Car_F
	{
		class Turrets: Turrets
		{
			class MainTurret;
			class ViewOptics;
		};
	};
	class Truck_01_base_F: Truck_F
	{
		class Turrets: Turrets
		{
			class MainTurret;
			class ViewOptics;
		};
	};
	class rhsusf_fmtv_base: Truck_01_base_F {};
	class rhsusf_M1078A1P2_B_wd_fmtv_usarmy: rhsusf_fmtv_base {};
	class rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy: rhsusf_M1078A1P2_B_wd_fmtv_usarmy
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
