class CfgPatches
{
	class rhs_c_btr_no_zoom
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
			"A3_Armor_F",
			"A3_Soft_F",
			"rhs_c_btr"
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
		class ViewPilot;
		class NewTurret;
	};
	class Wheeled_APC_F: Car_F
	{
		class NewTurret;
		class Turrets
		{
			class MainTurret: NewTurret {};
		};
		class CommanderOptics;
	};
	class rhs_btr_base: Wheeled_APC_F
	{
		class ViewPilot: ViewPilot
		{
			initFov=0.7;
			minFov=0.7;
			maxFov=1;
		};
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
