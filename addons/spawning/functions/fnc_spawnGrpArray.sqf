/*
 * Author: Soil Team
 * Adds a unit composition to the Queue where the input parameters are given as an array
 *
 * Arguments:
 * 0: Position (Marker, Pos, Object, etc)  <ARRAY, STRING, OBJECT>
 * 1: Side                                 <SIDE>
 * 2: Unit Array                           <ARRAY>
 *
 * Return Value:
 * TRUE on success <BOOL>
 */
#include "script_component.hpp"

params [
    "_position",
    ["_side",east,[west]],
    ["_units",[],[[]]]
    ];

private _type = "inf";

// Evaluate Position 
EVALPOS(_position);
if (_position isEqualTo [0,0,0]) exitWith {false};

private _unitarray = [];
private _cars = 0;
private _apcs = 0;
private _tanks = 0;

// Sort and evaluate units
{
    private _unit = _x;
    if (IS_ARRAY(_unit)) then {
        {
            _unitarray pushBack _x;
            if (_x isKindOf "Car") then {
                INC(_cars);
            };
            if (_x isKindOf "APC") then {
                INC(_apcs);
            };
            if (_x isKindOf "Tank") then {
                INC(_tanks);
            };
        } forEach _unit;
    } else {
        _unitarray pushBack _unit;
        if (_unit isKindOf "Car") then {
            INC(_cars);
        };
        if (_unit isKindOf "APC") then {
            INC(_apcs);
        };
        if (_unit isKindOf "Tank") then {
            INC(_tanks);
        };
    };
} forEach _units;

// Decide which type the unit has
if (_cars > 0) then {
    _type = "mot";
};
if (_apcs > 0) then {
    _type = "mech";
};
if (_tanks > 0) then {
    _type = "armor";
};

// ToDo: Maybe an atomic write is required here
GVAR(spawningQueue) pushBack [_type,_side,_position];
GVAR(spawningQueue) append _unitarray;


true
