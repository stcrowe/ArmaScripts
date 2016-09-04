class CfgPatches
{
	class A3_Weapons_F_Acc_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Weapons_F",
			"A3_Weapons_F_Items",
			"A3_Weapons_F_Acc"
		};
	};
};
class CfgWeapons
{
	class ItemCore;
	class InventoryOpticsItem_Base_F;
	class optic_Arco: ItemCore
	{
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			class OpticsModes
			{
				class ARCO2collimator
				{
					opticsZoomMin=0.7;
					opticsZoomMax=0.7;
					opticsZoomInit=0.7;
				};
			};
		};
	};
	class optic_Hamr: ItemCore
	{
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			class OpticsModes
			{
				class Hamr2Collimator
				{
					opticsZoomMin=0.7;
					opticsZoomMax=0.7;
					opticsZoomInit=0.7;
				};
			};
		};
	};
	class optic_Aco: ItemCore
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
	class optic_ACO_grn: ItemCore
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
	class optic_Aco_smg: ItemCore
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
	class optic_ACO_grn_smg: ItemCore
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
	class optic_Holosight: ItemCore
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
	class optic_Holosight_smg: ItemCore
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
	class optic_SOS: ItemCore
	{
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			class OpticsModes
			{
				class Iron
				{
					opticsZoomMin=0.7;
					opticsZoomMax=0.7;
					opticsZoomInit=0.7;
				};
			};
		};
	};
	class optic_MRCO: ItemCore
	{
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			class OpticsModes
			{
				class MRCOcq
				{
					opticsZoomMin=0.7;
					opticsZoomMax=0.7;
					opticsZoomInit=0.7;
				};
			};
		};
	};
	class optic_Nightstalker: ItemCore
	{
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			class OpticsModes
			{
				class NCTALKEP;
				class Iron: NCTALKEP
				{
					opticsZoomMin=0.7;
					opticsZoomMax=0.7;
					opticsZoomInit=0.7;
				};
			};
		};
	};
	class optic_DMS: ItemCore
	{
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			class OpticsModes
			{
				class Snip;
				class Iron: Snip
				{
					opticsZoomMin=0.7;
					opticsZoomMax=0.7;
					opticsZoomInit=0.7;
				};
			};
		};
	};
	class optic_Yorris: ItemCore
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
	class optic_MRD: ItemCore
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
};