class CfgPatches
{
	class rhsusf_c_statics_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=1.3200001;
		requiredAddons[]=
		{
			"rhsusf_c_troops",
			"rhsusf_c_heavyweapons",
			"A3_Weapons_F",
			"A3_Weapons_F_gamma",
			"A3_Weapons_F_epc",
			"A3_Static_F_Gamma",
			"A3_CargoPoses_F",
			"rhsusf_c_statics"
		};
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
	class StaticATWeapon: StaticWeapon {};
	class RHS_TOW_TriPod_base: StaticATWeapon
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
