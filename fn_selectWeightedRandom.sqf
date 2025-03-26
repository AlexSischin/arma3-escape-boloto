params ["_arr"];

_weightSum = 0;
{
    _weightSum = _weightSum + (_x select 1);
} forEach _arr;

_r = random _weightSum;
_p = 0;
{
    _p = _p + (_x select 1);
    if (_r <= _p) exitWith {
        _x select 0;
    };
} forEach _arr;
