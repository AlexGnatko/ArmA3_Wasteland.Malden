// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2015 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: ensureLocal.sqf
//	@file Author: Alex Gnatko

// Make sure the vehicle is local to the player, e.g. "vehicle ensureLocal player"
// This is to address some bugs related to not being able to make static weapons local (as they have no driver seat).

private ["_vehicle", "_player"];
_vehicle = _this select 0;
_player = _this select 1;


// TODO: should check if the driver seat does not exist, make sure that this is a static weapon

if(owner _vehicle != owner _player) then
{
    _vehicle setOwner (owner _player);
}
