/*
 * Author: Soil Team
 * Adds a unit composition to the Queue where the input parameters are given as a CfgGroups class
 *
 * Arguments:
 * 0: Position (Marker, Pos, Object, etc)  <ARRAY, STRING, OBJECT>
 * 1: GroupClass                           <STRING>
 *
 * Return Value:
 * TRUE on success <BOOL>
 */

#include "script_component.hpp"

params [
    "_position",
    ["_groupClass","",[""]]
    ];


// Evaluate Position 
EVALPOS(_position);
if (_position isEqualTo [0,0,0]) exitWith {false};

private _groupCfg = [GVAR(allCfgGroups),_groupClass] call CBA_fnc_hashGet;
private _unitsCfg = "true" configClasses _groupCfg;
private _side = getNumber (_groupCfg >> "side");
private _type = [str _groupCfg, "/"] call CBA_fnc_split;
_type = _type select (count _type - 2);

private _unitarray = [];

{
    private _unit = getText (_x >> "vehicle");
    _unitarray pushBack _unit;
} forEach _unitsCfg;

switch (_side) do { 
    case 0 : {_side = east};
    case 1 : {_side = west}; 
    case 2 : {_side = guer};
    default {_side = east}; 
};

GVAR(spawningQueue) pushBack [_type,_side,_position];
GVAR(spawningQueue) append _unitarray;

true
