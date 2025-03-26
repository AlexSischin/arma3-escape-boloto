params ["_chunkSize", "_fn_calculateChunkWeight"];

_radiusCoef = (2 ^ 0.5) / 2;
_chunksNumber = ceil (worldSize / _chunkSize);
_chunks = [];
for "_i" from 0 to _chunksNumber - 1 do {
    for "_j" from 0 to _chunksNumber - 1 do {
        _chunkPos = [_i * _chunkSize, _j * _chunkSize];
        _chunkCenter = _chunkPos vectorAdd [_chunkSize / 2, _chunkSize / 2];

        _chunkRadius = _chunkSize * _radiusCoef;
        _nearHouses = nearestObjects [_chunkCenter, ["house"], _chunkRadius, true];
        _nearRoads = _chunkCenter nearRoads _chunkRadius;
        _chunkWeight = [count _nearHouses, count _nearRoads] call _fn_calculateChunkWeight;

        _chunks pushBack [_chunkPos, _chunkWeight, _chunkSize, _nearHouses, _nearRoads];
    };
};
_chunks;
