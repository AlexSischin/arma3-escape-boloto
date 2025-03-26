params ["_chunks"];

_chunksWithWeights = [];
{
    _chunk = _x;
    _weight = _chunk select 1;
    _chunksWithWeights pushBack [_chunk, _weight];
} forEach _chunks;

[_chunksWithWeights] call fn_selectWeightedRandom;
