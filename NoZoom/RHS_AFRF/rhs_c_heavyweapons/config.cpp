class CfgPatches
{
	class rhs_c_heavyweapons_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=1.5;
		requiredAddons[]=
		{
			"rhs_main",
			"A3_Weapons_F",
			"A3_Weapons_F_gamma",
			"A3_Weapons_F_epc",
			"A3_Static_F",
			"A3_Static_F_Beta_Mortar_01",
			"A3_Static_F_Gamma",
			"rhs_c_heavyweapons"
			
		};
		version="0.1.1.1";
		magazines[]={};
		ammo[]={};
	};
};
class CfgVehicles
{
	class LandVehicle;
	class StaticWeapon: LandVehicle
	{
		class Turrets;
		class MainTurret;
	};
	class StaticMGWeapon: StaticWeapon {};
	class StaticAAWeapon: StaticWeapon {};
	class StaticATWeapon : StaticWeapon {}; //added
	class StaticGrenadeLauncher: StaticWeapon
	{
		class ViewOptics;
	};
	class AT_01_base_F: StaticMGWeapon {};
	class rhs_nsv_tripod_base: StaticMGWeapon {};
	class RHS_KORD_Base: rhs_nsv_tripod_base
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewOptics
				{
					initFov=0.7;
					minFov=0.7;
					maxFov=0.7;
				};
			};
		};
	};
	class rhs_DSHKM_base: StaticMGWeapon
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewOptics
				{
					initFov=0.7;
					minFov=0.7;
					maxFov=0.7;
				};
			};
		};
	};
	class RHS_AGS30_TriPod_base: StaticGrenadeLauncher
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewGunner
				{
					initFov=0.7;
					minFov=0.7;
					maxFov=0.7;
				};
			};
		};
	};
	class rhs_SPG9_base: StaticATWeapon //added
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewGunner
				{
					initFov=0.7;
					minFov=0.7;
					maxFov=0.7;
				};
			};
		};
	};
	class rhs_Igla_AA_pod_Base: StaticAAWeapon
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewOptics
				{
					initfov=0.7;
					maxfov=0.7;
					minfov=0.7;
				};
			};
		};
	};
	class rhs_Metis_Base: StaticATWeapon //added
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewGunner
				{
					initFov=0.7;
					minFov=0.7;
					maxFov=0.7;
				};
			};
		};
	};
};
