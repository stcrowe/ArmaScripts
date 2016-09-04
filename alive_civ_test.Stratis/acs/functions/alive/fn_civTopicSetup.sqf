params ["_civ"];

_civ = _this select 0;

_civID = _civ getVariable ["agentID", ""];

_townElder = _civ getVariable ["townelder", false];
_mayor = _civ getVariable ["major", false];
_preist = _civ getVariable ["preist", false];
_muezzin = _civ getVariable ["muezzin", false];
_politician = _civ getVariable ["politician", false];

_civProfile = [ALIVE_agentHandler, "getAgent", _civID] call ALIVE_fnc_agentHandler;

_posture = [_civProfile,"posture"] call CBA_fnc_hashGet;


_friendsIntro = ["How are you today?", "I hope all is well.", "How can I help you?", "Welcome to our city, what can I do for you?", "Nice to meet you"];
_neutralIntro = ["How can I help you?", "What do you want?"];
_angryIntro = ["What do you want?", "What are you doing around here?", "Why are you here?"];
_enemyIntro = ["Fuck off", "I'm not talking to you.", "Get out of here before you get me in trouble."];

if (_posture < 40) then
{
	_civ  setVariable ["acs_intro", _friendsIntro];
};

if ((_posture >= 40) && (_posture < 70)) then
{
	_civ  setVariable ["acs_intro", _neutralIntro];
};

if ((_posture >= 70) && (_posture < 100)) then
{
	_civ  setVariable ["acs_intro", _angryIntro];
};

if (_posture >= 100) then
{
	_civ  setVariable ["acs_intro", _enemyIntro];
};

_damage = (getAllHitPointsDamage _civ) select 2;

{
	if (_x > 0.1) exitWith {_civ setVariable ["acs_intro", ["I'm am hurt. Help me!!!"]]; _posture = 200;}
} forEach _damage;

_topics = [];

if (_posture < 100) then
{
	_important = false;

	if (_townElder) then
	{
		_important = true;

		_topics append [["What is your role?", "I am the town elder.", {true}, {(_this select 0) setVariable ["aliveImportant", true];}]];

	};

	if (_mayor) then
	{
		_important = true;

		_topics append [["What is your role?", "I am the mayor of my city.", {true}, {(_this select 0) setVariable ["aliveImportant", true];}]];

	};

	if (_preist) then
	{
		_important = true;

		_roll = random 1;

		switch (_roll) do
		{
			case 0:
			{
				_topics append [["What is your role?", "I am a local preist. Are you looking for God?", {true}, {(_this select 0) setVariable ["aliveImportant", true];}]];
			};

			case 1:
			{
				_topics append [["What is your role?", "I am the pasture of this flock.", {true}, {(_this select 0) setVariable ["aliveImportant", true];}]];
			};
		};

	};

	if (_muezzin) then
	{
		_important = true;

		_roll = random 1;

		switch (_roll) do
		{
			case 0:
			{
				_topics append [["What is your role?", "I lead those who worhsip the true god, Allah.", {true}, {(_this select 0) setVariable ["aliveImportant", true];}]];
			};

			case 1:
			{
				_topics append [["What is your role?", "I am one who walks in the steps of Mohammad, blessed be his name.", {true}, {(_this select 0) setVariable ["aliveImportant", true];}]];
			};
		};

	};

	if (_politician) then
	{
		_important = true;

		_topics append [["What is your role?", "I am secretary of governmental affairs in the region.", {true}, {(_this select 0) setVariable ["aliveImportant", true];}]];
	};

	if (!_important) then
	{

		_roll = random 2;

		if (_roll > 1) then
		{
			_topics append [["What is your role?", "I am a store owner.", {true}, {}]];
		}
		else
		{
			_topics append [["What is your role?", "I am a farmer.", {true}, {}]];
		};

	};


	//Where do you live
	if (_posture < 70) then
	{
		_roll = random 10;

		if (_roll > 3) then
		{
			_topics append [["Where do you live?", "I'll show you on your map.", {true},
			{
				_civ = _this select 0;

				_civID = _civ getVariable ["agentID", ""];

				_civProfile = [ALIVE_agentHandler, "getAgent", _civID] call ALIVE_fnc_agentHandler;

				_markerName = Format ["MaRk_Alive%1", random 1000];
				createMarkerLocal [_markerName, [_civProfile,"homePosition"] call CBA_fnc_hashGet];
				_markerName setMarkerTypeLocal "mil_box";
				_markerName setMarkerText format ["Home of %1", name _speaker];

				[_markerName] spawn
				{
					sleep 60;
					(_this select 0) setMarkerAlphaLocal 0.5;
					sleep 30;
					deleteMarkerLocal (_this select 0);
				};

				}]];
		}
		else
		{
			_topics append [["Where do you live?", "Around here.", {true}, {}]];
		};
	}
	else
	{
		_topics append [["Where do you live?", "I'm not telling you.", {true}, {}]];
	};

	//Intel
	if (_posture < 50) then
	{

		if (_posture < 20) then
		{
			_topics append [["Anything going on around here?", "I will mark everything I know on your map.", {!(_speaker getvariable ['intelGathered', false])}, {[getposATL (_this select 0), 2000] call ALiVE_fnc_OPCOMToggleInstallations; (_this select 0) setvariable ['intelGathered', true, true];}]];
			_topics append [["Anything going on around here?", "I already told you all I know.", {_speaker getvariable ['intelGathered', false]}, {}]];
		}
		else
		{
			_roll = random 10;

			if (_roll >= 8) then
			{
				_topics append [["Anything going on around here?", "I will mark everything I know on your map.", {!(_speaker getvariable ['intelGathered', false])}, {[getposATL (_this select 0), 2000] call ALiVE_fnc_OPCOMToggleInstallations; (_this select 0) setvariable ['intelGathered', true, true];}]];
				_topics append [["Anything going on around here?", "I already told you all I know.", {_speaker getvariable ['intelGathered', false]}, {}]];
			}
			else
			{
				_topics append [["Anything going on around here?", "Sorry, I have not seen anything.", {true}, {(_this select 0) setvariable ['intelGathered', true, true];}]];
			};
		};

	}
	else
	{
		_topics append [["Anything going on around here?", "Sorry, I have not seen anything.", {true}, {(_this select 0) setvariable ['intelGathered', true, true];}]];
	};

	//Reduce Hostilities
	_topics append [["Promise to help.", "...", {(_this select 0) getVariable["aliveImportant", false] && !((_this select 0) getVariable["aliveNeo", false])},
	{
		_roll = random 2;

			if (_roll > 1) then
			{
				[(_this select 0), player] call ACS_fnc_reduceHostility;
				["I believe you. I will talk with my friends and get them to see you guys are for the better good.", (_this select 0), true] spawn ACS_fnc_displayBody;
				(_this select 0) setVariable["aliveNeo", true, true];
			}
			else
			{
				["No, I am sorry. I cannot get involved with you guys.", (_this select 0), true] spawn ACS_fnc_displayBody;
				(_this select 0) setVariable["aliveNeo", true, true];
			};
	}]];

};

_civ setVariable ["acs_topics",  _topics];


