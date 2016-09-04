class CfgPatches
{
	class rhs_c_cars_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredAddons[]=
		{
			"A3_Soft_F",
			"A3_Soft_F_MRAP_02",
			"rhs_c_cars"
		};
		requiredVersion=1.3200001;
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
			class MainTurret: NewTurret
			{
				class ViewOptics;
			};
		};
	};
	class MRAP_02_base_F: Car_F {};
	class rhs_tigr_base: MRAP_02_base_F {};
	class rhs_tigr_vdv: rhs_tigr_base {};
	class rhs_tigr_sts_vdv: rhs_tigr_vdv
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
				class OpticsIn
				{
					class Sight: ViewOptics
					{
						initFov=0.7;
						minFov=0.7;
						maxFov=0.7;
					};
				};
			};
		};
	};
};
