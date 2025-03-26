padding = 200;

_spawnPos = ([random 1, random 1] vectorMultiply (worldSize - padding * 2)) vectorAdd [padding, padding];
{
    _playableUnit = _x;
    _playableUnit setPos _spawnPos;
    _playableUnit setDir random 360;
} forEach playableUnits;
