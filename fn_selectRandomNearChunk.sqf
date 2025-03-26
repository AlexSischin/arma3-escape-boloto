params ["_chunks", "_pos", "_distanceCoef"];

_chunksWithWeights = [];
{
    _chunk = _x;
    _chunkPos = _chunk select 0;
    _chunkWeight = _chunk select 1;
    _chunkSize = _chunk select 2;

    _chunkCenter = _chunkPos vectorAdd [_chunkSize / 2, _chunkSize / 2];
    _dist = _pos distance2D _chunkCenter;
    
    _adjustedWeight = _chunkWeight + (_dist + 1) ^ _distanceCoef;

    _chunksWithWeights pushBack [_chunk, _adjustedWeight];
} forEach _chunks;

[_chunksWithWeights] call fn_selectWeightedRandom;
