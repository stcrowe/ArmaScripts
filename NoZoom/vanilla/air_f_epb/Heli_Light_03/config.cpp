class CfgPatches
{
	class A3_Air_F_EPB_Heli_Light_03_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Air_F",
			"A3_Air_F_EPB_Heli_Light_03"
		};
	};
};
class CfgVehicles
{
	class Air;
	class Helicopter: Air
	{
		class Turrets;
	};
	class Helicopter_Base_F: Helicopter
	{
		class Turrets: Turrets
		{
			class MainTurret;
		};
	};
	class Heli_light_03_base_F: Helicopter_Base_F
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class OpticsOut
				{
					class Monocular
					{
						minFov=0.75;
						maxFov=1.25;
						initFov=0.75;
					};
				};
			};
		};
	};
};
