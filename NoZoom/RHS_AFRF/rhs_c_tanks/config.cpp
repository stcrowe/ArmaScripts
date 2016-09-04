class CfgPatches
{
	class rhs_c_tanks_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=1.3200001;
		requiredAddons[]=
		{
			"rhs_main",
			"rhs_decals",
			"rhs_c_heavyweapons",
			"rhs_c_troops",
			"A3_Armor_F",
			"A3_Armor_F_Beta",
			"A3_Armor_F_T100K",
			"A3_CargoPoses_F",
			"A3_Anims_F_Config_Sdr",
			"rhs_c_tanks"
		};
		version="0.1.1.1";
		magazines[]={};
		ammo[]={};
	};
};
class CommanderOptics;
class MainTurret;
class Turrets;
class NewTurret;
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
				class Turrets
				{
					class CommanderOptics;
				};
			};
		};
	};
	class rhs_tank_base: Tank_F
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
				class Turrets: Turrets
				{
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
	};
	class rhs_t80b: rhs_tank_base {};
	class rhs_t80bv: rhs_t80b
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class Turrets: Turrets
				{
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
	};
};
