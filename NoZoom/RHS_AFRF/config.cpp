class CfgPatches
{
	class rhsafrf_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=1.3200001;
		requiredAddons[]=
		{
			"A3_Weapons_F",
			"A3_Weapons_F_Ammoboxes",
			"A3_Weapons_F_beta",
			"A3_Weapons_F_Acc",
			"rhs_c_heavyweapons",
			"rhs_c_weapons"
		};
		version="0.1";
	};
};
class CfgWeapons
{
	class InventoryOpticsItem_Base_F;
	class Rifle_Base_F;
	class rhs_weap_ak74m_Base_F: Rifle_Base_F
	{
		opticsZoomMin=0.7;
		opticsZoomMax=0.7;
		opticsZoomInit=0.7;
	};
	class Rifle_Long_Base_F: Rifle_Base_F {};
	class rhs_pkp_base: Rifle_Long_Base_F
	{
		opticsZoomMin=0.7;
		opticsZoomMax=0.7;
		opticsZoomInit=0.7;
	};
	class Launcher;
	class Launcher_Base_F: Launcher {};
	class rhs_weap_rpg26: Launcher_Base_F
	{
		class OpticsModes
		{
			class ironsight
			{
				opticsZoomMin=0.7;
				opticsZoomMax=0.7;
				opticsZoomInit=0.7;
			};
		};
	};
	class launch_O_Titan_F;
	class rhs_weap_strela: launch_O_Titan_F
	{
		class OpticsModes
		{
			class StepScope
			{
				opticsZoomMin=0.7;
				opticsZoomMax=0.7;
				opticsZoomInit=0.7;
			};
		};
	};
	class ItemCore;
	class rhs_acc_sniper_base: ItemCore
	{
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			class OpticsModes
			{
				class rhs_1p29_iron
				{
					opticsZoomMin=0.7;
					opticsZoomMax=0.7;
					opticsZoomInit=0.7;
				};
			};
		};
	};
	class rhs_acc_1p29: rhs_acc_sniper_base
	{
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			class OpticsModes
			{
				class rhs_1p29_iron
				{
					opticsZoomMin=0.7;
					opticsZoomMax=0.7;
					opticsZoomInit=0.7;
				};
			};
		};
	};
	class rhs_acc_pkas: rhs_acc_sniper_base
	{
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			class OpticsModes
			{
				class ACO
				{
					opticsZoomMin=0.7;
					opticsZoomMax=0.7;
					opticsZoomInit=0.7;
				};
				class rhs_1p29_iron
				{
					opticsZoomMin=0.7;
					opticsZoomMax=0.7;
					opticsZoomInit=0.7;
				};
			};
		};
	};
	class rhs_acc_1p63: rhs_acc_pkas
	{
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			class OpticsModes
			{
				class ACO
				{
					opticsZoomMin=0.7;
					opticsZoomMax=0.7;
					opticsZoomInit=0.7;
				};
			};
		};
	};
	class rhs_acc_1pn93_base: rhs_acc_sniper_base
	{
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			class OpticsModes
			{
				class rhs_1p29_iron
				{
					opticsZoomMin=0.7;
					opticsZoomMax=0.7;
					opticsZoomInit=0.7;
				};
			};
		};
	};
};
