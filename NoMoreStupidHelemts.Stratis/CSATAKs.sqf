if (!isServer) exitWith {};

private ["_unit", "_headgear"];

_unit = param[0, objNull];

if (isNull _unit) exitWith{};

_weapon = configName (inheritsFrom (configfile >> "cfgweapons" >> (primaryWeapon _unit)));

if (_weapon == "arifle_Katiba_base" || _weapon == "arifle_CTAR_base_F") then
{
	_weapon = primaryWeapon _unit;
};

if (_weapon == "arifle_Katiba_F" || _weapon == "arifle_CTAR_blk_F" || _weapon == "arifle_CTAR_ghex_F" || _weapon == "arifle_CTAR_hex_F") then
	{
		_magazines = primaryWeaponMagazine _unit;
		_items = primaryWeaponItems _unit;

		_backItems = backpackItems _unit;
		_uniItems = uniformItems _unit;
		_vestItems = vestItems _unit;


		_backMag = [];

		{
			if (_x == (_magazines select 0)) then
			{
				_backMag append ["30Rnd_762x39_Mag_F"];
			};
		} forEach _backItems;

		_uniMag = [];

		{
			if (_x == (_magazines select 0)) then
			{
				_uniMag append ["30Rnd_762x39_Mag_F"];
			};
		} forEach _uniItems;

		_vestMag = [];

		{
			if (_x == (_magazines select 0)) then
			{
				_vestMag append ["30Rnd_762x39_Mag_F"];
			};
		} forEach _vestItems;


		_unit removeMagazines (_magazines select 0);

		// Add extra for gun
		_unit addItemToUniform "30Rnd_762x39_Mag_F";
		_unit addWeapon "arifle_AK12_F";


		{
			_unit addPrimaryWeaponItem _x;
		} forEach _items;


		{
			_unit addItemToBackpack _x;
		} forEach _backMag;

		{
			_unit addItemToUniform _x;
		} forEach _uniMag;

		{
			_unit addItemToVest _x;
		} forEach _vestMag;


		_unit selectWeapon "arifle_AK12_F";

	};

	if (_weapon == "arifle_Katiba_GL_F" || _weapon == "arifle_CTAR_GL_blk_F" || _weapon == "arifle_CTAR_GL_ghex_F" || _weapon == "arifle_CTAR_GL_hex_F") then
	{
		_magazines = primaryWeaponMagazine _unit;
		_items = primaryWeaponItems _unit;

		_backItems = backpackItems _unit;
		_uniItems = uniformItems _unit;
		_vestItems = vestItems _unit;


		_backMag = [];

		{
			if (_x == (_magazines select 0)) then
			{
				_backMag append ["30Rnd_762x39_Mag_F"];
			};
		} forEach _backItems;

		_uniMag = [];

		{
			if (_x == (_magazines select 0)) then
			{
				_uniMag append ["30Rnd_762x39_Mag_F"];
			};
		} forEach _uniItems;

		_vestMag = [];

		{
			if (_x == (_magazines select 0)) then
			{
				_vestMag append ["30Rnd_762x39_Mag_F"];
			};
		} forEach _vestItems;


		_unit removeMagazines (_magazines select 0);

		// Add extra for gun
		_unit addItemToUniform "30Rnd_762x39_Mag_F";
		_unit addWeapon "arifle_AK12_GL_F";


		{
			_unit addPrimaryWeaponItem _x;
		} forEach _items;


				{
			_unit addItemToBackpack _x;
		} forEach _backMag;

		{
			_unit addItemToUniform _x;
		} forEach _uniMag;

		{
			_unit addItemToVest _x;
		} forEach _vestMag;


		_unit selectWeapon "arifle_AK12_GL_F";

	};

	if (_weapon == "arifle_Katiba_C_F") then
	{
		_magazines = primaryWeaponMagazine _unit;
		_items = primaryWeaponItems _unit;

		_backItems = backpackItems _unit;
		_uniItems = uniformItems _unit;
		_vestItems = vestItems _unit;


		_backMag = [];

		{
			if (_x == (_magazines select 0)) then
			{
				_backMag append ["30Rnd_545x39_Mag_F"];
			};
		} forEach _backItems;

		_uniMag = [];

		{
			if (_x == (_magazines select 0)) then
			{
				_uniMag append ["30Rnd_545x39_Mag_F"];
			};
		} forEach _uniItems;

		_vestMag = [];

		{
			if (_x == (_magazines select 0)) then
			{
				_vestMag append ["30Rnd_545x39_Mag_F"];
			};
		} forEach _vestItems;


		_unit removeMagazines (_magazines select 0);

		// Add extra for gun
		_unit addItemToUniform "30Rnd_545x39_Mag_F";
		_unit addItemToVest "1Rnd_HE_Grenade_shell";
		_unit addWeapon "arifle_AKS_F";


		{
			_unit addPrimaryWeaponItem _x;
		} forEach _items;


		{
			_unit addItemToBackpack _x;
		} forEach _backMag;

		{
			_unit addItemToUniform _x;
		} forEach _uniMag;

		{
			_unit addItemToVest _x;
		} forEach _vestMag;


		_unit selectWeapon "arifle_AKS_F";
	};
