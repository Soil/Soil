/*
 * Author: BaerMitUmlaut
 * Creates a new objective.
 *
 * Arguments:
 * 0: Position (z coordinate is ignored) <ARRAY>
 * 1: Radius                             <NUMBER>
 *
 * Return Value:
 * Objective (CBA namespace)
 *
 * Example:
 * [getPos hvt, 50] call soil_fnc_createObjective
 */
#include "script_component.hpp"
params [
    ["_position", [], [[]]],
    ["_radius",   0,  [0]]
];

if (_position isEqualTo [] || {count _position < 2} || {_radius <= 0}) exitWith {
    private _msg = format ["Cannot create objective - invalid params given: %1", _this];
    ERROR(_msg);
    throw _msg;

    RETURNV(locationNull);
} else {
    RETURNV([_position, _radius] call EFUNC(objectives,createObjective));
};
