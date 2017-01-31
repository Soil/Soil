#include "script_component.hpp"

//ToDo HC Stuff

// Input Params:
//  0: Side
//  1: Unit Array
//  2: Position (Marker, Pos, Object, etc)
//
// Output Params:
//  Push to GVAR(spawnQueue)
//  ["type","side","position"]
//  Units


params [
    ["_side",EGVAR(enemySide),[west]],
    ["_units",[],[[]]],
    ["_position"]
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
GVAR(spawnQueue) pushBack [_type,_side,_position];
GVAR(spawnQueue) append _unitarray;


true
