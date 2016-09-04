class CfgPatches
{
	class A3_Weapons_F_no_zoom
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"A3_Data_F",
			"A3_UI_F",
			"A3_Anims_F",
			"A3_Anims_F_Config_Sdr",
			"A3_Weapons_F",
			"A3_Weapons_F_NATO",
			"A3_Weapons_F_CSAT",
			"A3_Weapons_F_AAF",
			"A3_weapons_F_FIA",
			"A3_Weapons_F_ItemHolders",
			"A3_Weapons_F_Headgear",
			"A3_Weapons_F_Uniforms",
			"A3_Weapons_F_Vests"
		};
	};
};
class CfgWeapons
{
	class Default;
	class LauncherCore;
	class Launcher: LauncherCore
	{
		opticsZoomMin=0.7;
		opticsZoomMax=0.7;
		opticsZoomInit=0.7;
	};
	class GrenadeLauncher: Default
	{
		opticsZoomMin=0.7;
		opticsZoomMax=0.7;
		opticsZoomInit=0.7;
	};
	class UGL_F: GrenadeLauncher
	{
		opticsZoomMin=0.7;
		opticsZoomMax=0.7;
		opticsZoomInit=0.7;
	};
	class RifleCore;
	class Rifle: RifleCore
	{
		opticsZoomMin=0.7;
		opticsZoomMax=0.7;
		opticsZoomInit=0.7;
	};
	class PistolCore;
	class Pistol: PistolCore
	{
		opticsZoomMin=0.7;
		opticsZoomMax=0.7;
		opticsZoomInit=0.7;
	};
	class Pistol_Base_F: Pistol
	{
		opticsZoomMin=0.7;
		opticsZoomMax=0.7;
		opticsZoomInit=0.7;
	};
	class Put: Default
	{
		class PutMuzzle: Default
		{
			opticsZoomMin=0.7;
			opticsZoomMax=0.7;
			opticsZoomInit=0.7;
		};
	};
};