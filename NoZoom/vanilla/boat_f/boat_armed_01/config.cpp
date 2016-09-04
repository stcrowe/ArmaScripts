class CfgPatches
{
	class A3_Boat_F_Boat_Armed_01_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Boat_F",
			"A3_Boat_F_Boat_Armed_01"
		};
	};
};
class RCWSOptics;
class CfgVehicles
{
	class Ship_F;
	class Boat_F: Ship_F
	{
		class NewTurret;
		class Turrets;
		class ViewOptics;
	};
	class Boat_Armed_01_base_F: Boat_F
	{
		class Turrets: Turrets
		{
			class FrontTurret: NewTurret
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
			class RearTurret: FrontTurret
			{
				class ViewOptics: ViewOptics
				{
					minFov=0.75;
					maxFov=0.75;
					initFov=0.75;
				};
			};
		};
	};
};
