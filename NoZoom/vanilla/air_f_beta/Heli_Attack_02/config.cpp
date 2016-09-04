class CfgPatches
{
	class A3_Air_F_Beta_Heli_Attack_02_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Air_F",
			"A3_Weapons_F",
			"A3_Air_F_Beta_Heli_Attack_02"
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
	class Heli_Attack_02_base_F: Helicopter_Base_F
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