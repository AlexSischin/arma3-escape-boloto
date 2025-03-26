params ["_chunk", "_housePosChance", "_roadPosChance"];

_chunkPos = _chunk select 0;
_chunkSize = _chunk select 2;
_nearHouses = _chunk select 3;
_nearRoads = _chunk select 4;

_pos = [];

_chanceCounter = 1;

if (count _nearHouses > 0 && random _chanceCounter < _housePosChance) then {
    _nearHouse = selectRandom _nearHouses;
    _nearHousePositions = [_nearHouse] call BIS_fnc_buildingPositions;
    if (count _nearHousePositions > 0) then {
        _pos = selectRandom _nearHousePositions;
    };
};
_chanceCounter = _chanceCounter - _housePosChance;

if (count _nearRoads > 0 && random _chanceCounter < _roadPosChance) then {
    _nearRoad = selectRandom _nearRoads;
    _pos = getPos _nearRoad;
};

if (count _pos == 0) then {
    _pos = _chunkPos vectorAdd [random _chunkSize, random _chunkSize];
};

_pos;