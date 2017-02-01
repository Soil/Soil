/*
 * Author: BaerMitUmlaut
 * Creates an objective with the given center and radius.
 *
 * Arguments:
 * 0: Center point         <ARRRAY>
 * 1: Radius               <NUMBER>
 * 2: Building type filter <CODE>
 *
 * Return Value:
 * Objective <LOCATION>
 */
#include "script_component.hpp"
params ["_center", "_radius", ["_filter", {true}]];

private _objective = [true] call CBA_fnc_createNamespace;
_objective setVariable [QGVAR(center), _center, true];

// Get all buildings and apply filter
private _buildings = nearestObjects [_center, ["House"], _radius, false];
_buildings = _buildings select _filter;
_objective setVariable [QGVAR(buildings), _buildings, true];

GVAR(objectives) pushBack _objective;

RETURNV(_objective);
