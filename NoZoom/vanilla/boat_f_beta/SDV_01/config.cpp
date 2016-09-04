class CfgPatches
{
	class A3_Boat_F_SDV_01_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Boat_F",
			"A3_Boat_F_SDV_01"
		};
	};
};
class CfgVehicles
{
	class Ship_F;
	class Boat_F: Ship_F
	{
		class NewTurret;
		class Turrets;
		class ViewOptics;
	};
	class SDV_01_base_F: Boat_F
	{
		class Turrets: Turrets
		{
			class CommanderTurret: NewTurret
			{
				class ViewOptics: ViewOptics {};
				class ViewGunner: ViewOptics
				{
					minFov=0.75;
					maxFov=1.25;
					initFov=0.75;
				};
			};
		};
	};
};
