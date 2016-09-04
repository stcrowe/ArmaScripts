class CfgPatches
{
	class rhs_c_a2port_air_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=1.3200001;
		requiredAddons[]=
		{
			"A3_Air_F",
			"A3_Air_F_Beta",
			"A3_Air_F_EPC_Plane_CAS_02",
			"A3_Air_F_Heli_Light_02",
			"A3_Air_F_Beta_Heli_Attack_02",
			"A3_CargoPoses_F",
			"rhs_c_a2port_air"
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
		class ViewOptics;
	};
	class Heli_Attack_02_base_F: Helicopter_Base_F {};
	class Helicopter_Base_H: Helicopter_Base_F
	{
		class Turrets: Turrets {};
		class Viewoptics;
	};
	class Heli_Transport_02_base_F: Helicopter_Base_H {};
	class Heli_Light_02_base_F: Helicopter_Base_H
	{
		class Turrets: Turrets
		{
			class MainTurret;
		};
	};
	class RHS_Mi8_base: Heli_Light_02_base_F
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewOptics
				{
					initfov=0.7;
					maxfov=0.7;
					minfov=0.7;
				};
			};
		};
	};
	class RHS_Ka52_base: Heli_Attack_02_base_F
	{
		class ViewPilot
		{
			initFov=1;
			minFov=1;
			maxFov=1.2;

		};
	};
};
