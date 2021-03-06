class CfgPatches
{
	class A3_Soft_F_MRAP_02_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Soft_F",
			"A3_Soft_F_MRAP_02"
		};
	};
};
class RCWSOptics;
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
			class MainTurret: NewTurret {};
		};
	};
	class MRAP_02_base_F: Car_F {};
	class MRAP_02_hmg_base_F: MRAP_02_base_F
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewOptics: RCWSOptics
				{
				};
				class ViewGunner: ViewOptics
				{
					minFov=0.75;
					maxFov=0.75;
					initFov=0.75;
				};
			};
		};
	};
};
