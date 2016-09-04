class CfgPatches
{
	class A3_Static_F_Gamma_AA_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Static_F_Gamma",
			"A3_Static_F_Gamma_AA"
		};
	};
};
class CfgVehicles
{
	class Land;
	class LandVehicle: Land
	{
		class NewTurret;
	};
	class StaticWeapon: LandVehicle
	{
		class Turrets
		{
			class MainTurret: NewTurret
			{
				class ViewOptics
				{
					minFov=0.75;
					maxFov=0.75;
					initFov=0.75;
				};
			};
		};
	};
};
