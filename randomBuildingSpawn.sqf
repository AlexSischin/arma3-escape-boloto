// Place playable units into a random house
_all_houses = ([0, 0] nearObjects ["House", 1E10]) call BIS_fnc_arrayShuffle;
{
    _house_positions = [_x, 2] call BIS_fnc_buildingPositions;
    if (count _house_positions >= count playableUnits) then {
        for "_i" from 0 to count playableUnits - 1 do {
            _playableUnit = playableUnits select _i;
            _spawnPos = _house_positions select _i;
            _playableUnit setDir random 360;
            _playableUnit setPos _spawnPos;
        };
    };
} forEach _all_houses;
