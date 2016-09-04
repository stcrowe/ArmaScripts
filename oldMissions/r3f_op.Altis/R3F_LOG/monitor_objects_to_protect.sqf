/**
* Vérifie périodiquement que les objets à protéger et ne pas perdre aient besoin d'être déchargés/téléportés.
* Script à faire tourner dans un fil d'exécution dédié sur le serveur.
*
* Copyright (C) 2014 Team ~R3F~
*
* This program is free software under the terms of the GNU General Public License version 3.
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

while {true} do
{
	// Pour chaque objet à protéger
	{
		private ["_object", "_bbox_dim", "_pos_respawn", "_pos_degagee", "_rayon"];

		_object = _x;

		if (!isNull _object) then
		{
			// Si l'objet est transporté/héliporté/remorqué
			if !(isNull (_object getVariable ["R3F_LOG_is_transported_by", objNull])) then
			{
				// Mais que le transporteur est détruit/héliporté/remorqué
				if !(alive (_object getVariable "R3F_LOG_is_transported_by")) then
				{
					// Récupération de la position de respawn en accord avec le paramètre passé dans "do_not_lose_it"
					if (typeName (_object getVariable "R3F_LOG_pos_respawn") == "ARRAY") then
					{
						_pos_respawn = _object getVariable "R3F_LOG_pos_respawn";
					}
					else
					{
						if (_object getVariable "R3F_LOG_pos_respawn" == "cargo_pos") then
						{
							_pos_respawn = getPos (_object getVariable "R3F_LOG_is_transported_by");
						}
						else
						{
							_pos_respawn = getMarkerPos (_object getVariable "R3F_LOG_pos_respawn");
						};
					};

					_bbox_dim = (vectorMagnitude (boundingBoxReal _object select 0)) max (vectorMagnitude (boundingBoxReal _object select 1));

					// Si mode de respawn != "exact_spawn_pos"
					if (isNil {_object getVariable "R3F_LOG_dir_respawn"}) then
					{
						// Recherche d'une position dégagée (on augmente progressivement le rayon jusqu'à trouver une position)
						for [{_rayon = 5 max (2*_bbox_dim); _pos_degagee = [];}, {count _pos_degagee == 0 && _rayon <= 100 + (8*_bbox_dim)}, {_rayon = _rayon + 20 + (5*_bbox_dim)}] do
						{
							_pos_degagee = [
								_bbox_dim,
								_pos_respawn,
								_rayon,
								100 min (5 + _rayon^1.2)
							] call R3F_LOG_FNCT_3D_tirer_position_degagee_sol;
						};

						// En cas d'échec de la recherche de position dégagée
						if (count _pos_degagee == 0) then {_pos_degagee = _pos_respawn;};

						// On ramène l'objet sur la position
						detach _object;
						_object setPos _pos_degagee;
					}
					else
					{
						// On ramène l'objet sur la position
						detach _object;
						_object setPosASL _pos_respawn;
						_object setDir (_object getVariable "R3F_LOG_dir_respawn");
					};

					// On retire l'objet du contenu du véhicule (s'il est dedans)
					_objects_charges = (_object getVariable "R3F_LOG_is_transported_by") getVariable ["R3F_LOG_objects_charges", []];
					if (_object in _objects_charges) then
					{
						_objects_charges = _objects_charges - [_object];
						(_object getVariable "R3F_LOG_is_transported_by") setVariable ["R3F_LOG_objects_charges", _objects_charges, true];
					};

					_object setVariable ["R3F_LOG_is_transported_by", objNull, true];

					sleep 4;
				};
			};
		};
	} forEach R3F_LOG_liste_objects_a_proteger;

	sleep 90;
};