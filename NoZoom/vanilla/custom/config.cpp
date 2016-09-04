class CfgPatches
{
    class ruPal_custom_no_zoom
    {
        units[]={};
        weapons[]={};
        requiredVersion=0.1;
        requiredAddons[]=
        {
            "A3_Weapons_F",
            "A3_Static_F"
        };
    };
};
class CfgVehicles
{
    class All;
    class AllVehicles: All
    {
		class ViewOptics;
        class NewTurret
        {
            class ViewGunner: ViewOptics
            {
                minFov=0.75;
                maxFov=0.75;
                initFov=0.75;
            };
        };
    };
};