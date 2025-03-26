setTimeMultiplier 24;

fn_selectWeightedRandom = compile preprocessFile "fn_selectWeightedRandom.sqf";
fn_buildChunks = compile preprocessFile "fn_buildChunks.sqf";
fn_selectRandomChunk = compile preprocessFile "fn_selectRandomChunk.sqf";
fn_selectRandomNearChunk = compile preprocessFile "fn_selectRandomNearChunk.sqf";
fn_selectRandomPosInChunk = compile preprocessFile "fn_selectRandomPosInChunk.sqf";

// execVM "randomBuildingSpawn.sqf";
// execVM "randomSpawn.sqf";
execVM "cars.sqf";
execVM "monsters.sqf";
