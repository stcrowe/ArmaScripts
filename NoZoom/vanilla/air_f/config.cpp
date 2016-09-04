class CfgPatches
{
	class A3_Air_F_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Characters_F",
			"A3_Weapons_F",
			"A3_Anims_F",
			"A3_Anims_F_COnfig_Sdr",
			"A3_Air_F"
		};
	};
};
class CfgVehicles
{
	class AllVehicles;
	class Air: AllVehicles
	{
		class NewTurret;
		class ViewPilot;
	};
	class Helicopter: Air
	{
		class ViewPilot: ViewPilot
		{
			minFov=0.75;
			maxFov=1.25;
			initFov=0.75;
		};
		class Turrets
		{
			class MainTurret: NewTurret
			{
				class ViewGunner;
			};
		};
	};
	class Helicopter_Base_F: Helicopter {};
	class Helicopter_Base_H: Helicopter_Base_F
	{
		class Turrets: Turrets
		{
			class CopilotTurret: MainTurret
			{
				class ViewGunner: ViewGunner
				{
					minFov=0.75;
					maxFov=1.25;
					initFov=0.75;
				};
			};
		};
	};
};