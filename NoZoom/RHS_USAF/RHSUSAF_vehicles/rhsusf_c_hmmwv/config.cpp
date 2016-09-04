class CfgPatches
{
	class rhsusf_c_hmmwv_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=1;
		requiredAddons[]=
		{
			"A3_Soft_F_MRAP_01",
			"rhsusf_c_troops",
			"rhsusf_c_heavyweapons",
			"rhsusf_c_hmmwv"
		};
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
	class rhsusf_hmmwe_base: MRAP_01_base_F {};
	class rhsusf_m998_w_2dr: rhsusf_hmmwe_base {};
	class rhsusf_m998_w_4dr: rhsusf_m998_w_2dr {};
	class rhsusf_m998_w_4dr_halftop: rhsusf_m998_w_4dr {};
	class rhsusf_m998_w_4dr_fulltop: rhsusf_m998_w_4dr_halftop {};
	class rhsusf_m1025_w: rhsusf_m998_w_4dr_fulltop {};
	class rhsusf_m1025_w_m2: rhsusf_m1025_w
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
