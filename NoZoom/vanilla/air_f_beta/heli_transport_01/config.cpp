class CfgPatches
{
	class A3_Air_F_Beta_Heli_Transport_01_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Air_F",
			"A3_Weapons_F",
			"A3_Air_F_Beta_Heli_Transport_01"
		};
	};
};
class CfgVehicles
{
	class Helicopter;
	class Helicopter_Base_F: Helicopter
	{
		class Turrets;
	};
	class Helicopter_Base_H: Helicopter_Base_F
	{
		class ViewOptics;
		class Turrets: Turrets
		{
			class MainTurret;
		};
	};
	class Heli_Transport_01_base_F: Helicopter_Base_H
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewOptics
				{
					minFov=0.25;
					maxFov=1.25;
					initFov=0.75;
				};
			};
		};
	};
};