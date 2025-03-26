carTypes = [
    [[[
        "C_Offroad_01_F",
        "C_Van_01_transport_F",
        "C_Van_01_box_F",
        "C_Quadbike_01_F",
        "C_Truck_02_transport_F",
        "C_Truck_02_covered_F",
        "C_Hatchback_01_F",
        "C_Hatchback_01_sport_F",
        "C_SUV_01_F",
        "RHS_Ural_Civ_02",
        "RHS_Ural_Open_Civ_02",
        "RHS_Ural_Civ_03",
        "RHS_Ural_Open_Civ_03",
        "RHS_Ural_Civ_01",
        "RHS_Ural_Open_Civ_01",
        "rhsgref_cdf_b_reg_uaz",
        "rhsgref_cdf_b_reg_uaz_open",
        "rhsgref_cdf_b_gaz66",
        "rhsgref_cdf_b_gaz66o",
        "rhsgref_cdf_b_zil131",
        "rhsgref_cdf_b_zil131_open"
    ]], 1]
];
specialCarTypes = [
    [["C_Truck_02_box_F", "C_Offroad_01_repair_F"]],
    [["C_Truck_02_box_F", "C_Offroad_01_repair_F"]]
];
carCount = 15;
carChunkSize = 100;
carHouseDensityCoef = 2;
carRoadDensityCoef = 2;
carRoadSpawnChance = 0.7;

_markersEnabled = False;

_fn_calculateChunkWeight = {
    params ["_nearHousesCount", "_nearRoadsCount"];
    (1 + _nearHousesCount) ^ carHouseDensityCoef + (1 + _nearRoadsCount) ^ carRoadDensityCoef;
};

_chunks = [carChunkSize, _fn_calculateChunkWeight] call fn_buildChunks;

_fn_getRandomPos = {
    _chunk = [_chunks] call fn_selectRandomChunk;
    [_chunk, 0, carRoadSpawnChance] call fn_selectRandomPosInChunk;
};

for "_c" from 0 to carCount - 1 do {
    _cType = [carTypes] call fn_selectWeightedRandom;
    _cClasses = _cType select 0;
    _cClass = selectRandom _cClasses;
    _cPos = call _fn_getRandomPos;
    _car = createVehicle [_cClass, _cPos, [], 0, "NONE"];
    _car setDir random 360;
    _car setDammage random [0, 0.5, 1];
    _car setFuel random [0, 0.1, 0.2];
    if (_markersEnabled) then {
        _cMarker = createMarker [format ['car_%1', _cPos], _cPos];
        _cMarker setMarkerType "mil_circle_noShadow";
        _cMarker setMarkerColor "ColorUNKNOWN";
    };
};

{
    _cType = _x;
    _cClasses = _cType select 0;
    _cClass = selectRandom _cClasses;
    _cPos = call _fn_getRandomPos;
    _car = createVehicle [_cClass, _cPos, [], 0, "NONE"];
    _car setDir random 360;
    _car setDammage random [0, 0.5, 1];
    _car setFuel random [0.1, 0.2, 0.3];
    if (_markersEnabled) then {
        _cMarker = createMarker [format ['sp_car_%1', _cPos], _cPos];
        _cMarker setMarkerType "mil_circle_noShadow";
        _cMarker setMarkerColor "ColorYellow";
    };
} forEach specialCarTypes;
