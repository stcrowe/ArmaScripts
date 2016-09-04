class CfgPatches
{
	class rhs_c_a2port_car_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=1.3200001;
		requiredAddons[]=
		{
			"A3_Soft_F",
			"A3_CargoPoses_F",
			"rhs_c_a2port_car"
		};
	};
};
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
	class Offroad_01_base_F: Car_F {};
	class RHS_UAZ_Base: Offroad_01_base_F {};
	class RHS_UAZ_DShKM_Base: RHS_UAZ_Base
	{
		class CargoTurret;
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewGunner
				{
					initFov=0.7;
					minFov=0.7;
					maxFov=0.7;
				};
			};
		};
	};
	class RHS_UAZ_SPG9_Base: RHS_UAZ_DShKM_Base
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class ViewGunner
				{
					initFov=0.7;
					minFov=0.7;
					maxFov=0.7;
				};
			};
		};
	};
};
