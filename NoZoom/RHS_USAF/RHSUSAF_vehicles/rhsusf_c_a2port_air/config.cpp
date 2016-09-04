class CfgPatches
{
	class RHS_US_A2_AirImport_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=1.3200001;
		requiredAddons[]=
		{
			"A3_Air_F",
			"A3_Air_F_Beta",
			"A3_Air_F_EPC_Plane_CAS_01",
			"A3_Air_F_EPB_Heli_Light_03",
			"A3_CargoPoses_F",
			"rhsusf_c_troops",
			"rhsusf_c_heavyweapons",
			"rhsusf_sounds",
			"RHS_US_A2_AirImport"
		};
		magazines[]={};
		ammo[]={};
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
	class Helicopter_Base_H: Helicopter_Base_F
	{
		class Turrets: Turrets {};
		class Viewoptics;
	};
	class Heli_Transport_01_base_F: Helicopter_Base_H {};
	class Heli_Transport_02_base_F: Helicopter_Base_H {};
	class Heli_Light_03_base_F: Helicopter_Base_F {};
	class Plane: Air {};
	class Plane_Base_F: Plane
	{
		class NewTurret;
		class Turrets;
		class ViewPilot;
		class ViewGunner;
	};
	class RHS_CH_47F_base: Heli_Transport_02_base_F {};
	class RHS_CH_47F: RHS_CH_47F_base
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewOptics
				{
					initFov=0.7;
					minFov=0.7;
					maxFov=0.7;
				};
			};
		};
	};
	class RHS_UH60_Base: Heli_Transport_01_base_F {};
	class RHS_UH60M_base: RHS_UH60_Base {};
	class RHS_UH60M_US_base: RHS_UH60M_base {};
	class RHS_UH60M: RHS_UH60M_US_base
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewOptics
				{
					initFov=0.7;
					minFov=0.7;
					maxFov=0.7;
				};
			};
		};
	};
	class RHS_UH1_Base: Heli_Light_03_base_F {};
	class RHS_UH1Y_base: RHS_UH1_Base {};
	class RHS_UH1Y_US_base: RHS_UH1Y_base {};
	class RHS_UH1Y: RHS_UH1Y_US_base
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewOptics
				{
					initFov=0.7;
					minFov=0.7;
					maxFov=0.7;
				};
				class ViewGunner: ViewOptics
				{
					initFov=0.75;
					minFov=0.75;
					maxFov=0.75;
				};
			};
		};
	};
	class RHS_C130J_Base: Plane_Base_F
	{
		class Turrets: Turrets
		{
			class MainTurret: NewTurret
			{
				class ViewPilot: ViewPilot
				{
					minFov=1;
					maxFov=1.2;
					initFov=1;
				};
			};
		};
	};
	class RHS_C130J: RHS_C130J_Base
	{
		class Turrets: Turrets
		{
			class MainTurret;
			class CopilotTurret: MainTurret
			{
				class ViewGunner: ViewGunner
				{
					minFov=1;
					maxFov=1.2;
					initFov=1;
				};
			};
		};
	};
};
