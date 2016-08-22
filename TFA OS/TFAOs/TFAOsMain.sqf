/*
  File: TFAOsMain.sqf
  Creator: Niky
  Date: 11.03.2015
*/

/*  */
TFAFunctionsInit = execVM "TFAOs\TFAOsFunctions.sqf";
TFAHandlerInit = execVM "TFAOs\TFAOsHandler.sqf";
TFAFileInit = execVM "TFAOs\TFAOsFileStructure.sqf";
TFADefaultWebPage = "tfasubnet\index.html";
TFADebug = true;

fnTFA_debug =
{
	//"debug_console" callExtension ((_this select 0) + "#1111");
};

waitUntil { scriptDone TFAFunctionsInit && scriptDone TFAHandlerInit && scriptDone TFAFileInit };

_laptop = "Land_Laptop_unfolded_F" createVehicle position player;
_laptop attachTo [player, [0,0.3,0], "head"];
_laptop setDir (180);
hideObject _laptop;

_ok = createDialog "LaptopBase";
sleep 0.10;
closeDialog 2;
_ok = createDialog "LaptopBase";
_CRLF = toString [0x0D, 0x0A];

_welcomeText = format["TFA OS [Version 1.34.483]%1Copyright (c) 2015 Legion Corporation. All rights reserved. jk.%1%1%2 ", _CRLF, TFA_currentFolderName];
ctrlSetText [1400, _welcomeText];

waitUntil { (!dialog) or (!alive player) }; // hit ESC to close it

if(!alive player) then
{
	closeDialog 2;
};

//kill remaining processes
{
	call compile format["[%2] call fnTFA_stop%1", _x select 4, _x select 1];
}
foreach TFA_ActivePrograms;

deleteVehicle _laptop;
//TFADisplay displayRemoveAllEventHandlers "MouseMoving";
//TFADisplay displayRemoveAllEventHandlers "MouseButtonUp";
