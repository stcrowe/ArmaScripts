class CfgPatches
{
	class rhs_c_a2port_armor_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=1.3200001;
		requiredAddons[]=
		{
			"rhs_main",
			"rhs_c_heavyweapons",
			"rhs_decals",
			"rhs_optics",
			"rhs_c_troops",
			"rhs_c_btr",
			"A3_Armor_F",
			"A3_Armor_F_Beta",
			"A3_armor_f_beta_APC_Tracked_02",
			"A3_Soft_F",
			"rhs_c_a2port_armor"
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
		class NewTurret;
	};
	class Wheeled_APC_F: Car_F
	{
		class NewTurret;
		class Turrets
		{
			class MainTurret: NewTurret
			{
				class Turrets
				{
					class CommanderOptics;
				};
			};
		};
		class CommanderOptics;
	};
	class rhs_btr_base: Wheeled_APC_F {};
	class rhs_btr60_base: rhs_btr_base
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
			class CommanderOptics: CommanderOptics
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
