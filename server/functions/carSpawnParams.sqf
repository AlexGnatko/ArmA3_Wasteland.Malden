// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2015 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: carSpawnParams.sqf
//	@file Author: Alex Gnatko

// Find a road within the _radius and place the vehicle alongside that road.
// No more cars scattered on fields and beaches!

private['_pos', '_radius', '_roads', '_dir', '_dir_side', '_car_pos', '_dist', '_rv', '_rpos', '_road', '_next_roads', '_next_road'];
_pos = _this select 0;
_radius = _this select 1;

_roads = _pos nearRoads _radius;

if((count _roads) == 0) exitWith {
    [false];
};

_road = _roads call BIS_fnc_selectRandom;

_next_roads = (getPos _road) nearRoads 10;
if(count _next_roads > 0) then
{
    _next_road = _next_roads select 0;
    _roads = roadsConnectedTo _next_road;
    _next_road = _roads select 0;
    _dir = [_road, _next_road] call BIS_fnc_DirTo;
};

_rpos = getPos _road;
_dir = _dir + 180*(round (random 1));

_dir_side = _dir + 90;
_dist = 4;

_car_pos = [(_rpos select 0) + (sin _dir_side) * _dist, (_rpos select 1) + (cos _dir_side) * _dist, 0];

_dir = _dir + round(random 2) - 1;

_rv = [true, _car_pos, _dir];

_rv