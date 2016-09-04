class CfgPatches
{
	class rhsusf_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=1.3200001;
		requiredAddons[]=
		{
			"rhsusf_c_heavyweapons",
			"A3_Weapons_F_Acc",
			"A3_Functions_F_Bootcamp",
			"A3_Weapons_F",
			"A3_Weapons_F_Explosives",
			"A3_Weapons_F_Ammoboxes",
			"A3_Weapons_F_beta",
			"A3_Weapons_F_EBR",
			"A3_Weapons_F_Machineguns_M200",
			"rhsusf_c_weapons"
		};
		version="0.1";
	};
};
class CfgWeapons
{
	class InventoryOpticsItem_Base_F;
	class Pistol_Base_F;
	class Rifle_Base_F;
	class Launcher_Base_F;
	class rhs_weap_M320_Base_F: Pistol_Base_F
	{
		opticsZoomMin=0.7;
		opticsZoomMax=0.7;
		opticsZoomInit=0.7;
	};
	class rhs_weap_XM2010_Base_F: Rifle_Base_F
	{
		opticsZoomMin=0.7;
		opticsZoomMax=0.7;
		opticsZoomInit=0.7;
	};
	class arifle_MX_Base_F: Rifle_Base_F
	{
	};
	class rhs_weap_m4_Base: arifle_MX_Base_F
	{
		opticsZoomMin=0.7;
		opticsZoomMax=0.7;
		opticsZoomInit=0.7;
	};
	class LMG_Mk200_F;
	class rhs_weap_M249_base: LMG_Mk200_F
	{
		opticsZoomMin=0.7;
		opticsZoomMax=0.7;
		opticsZoomInit=0.7;
	};
	class rhs_weap_saw_base: Rifle_Base_F
	{
		opticsZoomMin=0.7;
		opticsZoomMax=0.7;
		opticsZoomInit=0.7;
	};
	class rhs_weap_lmg_minimipara: rhs_weap_saw_base
	{
		opticsZoomInit=0.7;
		opticsZoomMax=0.7;
		opticsZoomMin=0.7;
	};
	class rhs_weap_M107_Base_F: Rifle_Base_F
	{
		opticsZoomMin=0.7;
		opticsZoomMax=0.7;
		opticsZoomInit=0.7;
	};
	class rhs_weap_m32_Base_F: Rifle_Base_F
	{
		opticsZoomMin=0.7;
		opticsZoomMax=0.7;
		opticsZoomInit=0.7;
	};
	class rhs_weap_M136: Launcher_Base_F
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
	class rhs_weap_fim92: launch_O_Titan_F
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
	class rhs_weap_fgm148: launch_O_Titan_F
	{
		opticsZoomMin=0.42;
		opticsZoomMax=0.42;
		opticsZoomInit=0.42;
	};
	class ItemCore;
	class rhsusf_acc_compm4: ItemCore
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
	class rhsusf_acc_sniper_base;
	class rhsusf_acc_ELCAN: rhsusf_acc_sniper_base
	{
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			class OpticsModes
			{
				class alternative_view
				{
					opticsZoomMin=0.7;
					opticsZoomMax=0.7;
					opticsZoomInit=0.7;
				};
			};
		};
	};
	class rhsusf_acc_ACOG: rhsusf_acc_sniper_base
	{
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			class OpticsModes
			{
				class alternative_view
				{

					opticsZoomMin=0.7;
					opticsZoomMax=0.7;
					opticsZoomInit=0.7;
				};
			};
		};
	};
	class rhsusf_acc_ACOG_USMC: rhsusf_acc_sniper_base
	{
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			class OpticsModes
			{
				class alternative_view
				{
					opticsZoomMin=0.7;
					opticsZoomMax=0.7;
					opticsZoomInit=0.7;
				};
			};
		};
	};
};