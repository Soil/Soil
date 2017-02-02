/*
 * Author: BaerMitUmlaut
 * Checks if the player can be seen a hostile units and reveals him.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"
params ["_unit"];

private _group   = group   _unit;
private _vehicle = vehicle _unit;

// Player or friendly unit
if (isPlayer _unit || {(side player) getFriend (side _unit) >= 0.6}) exitWith {};
// Target too far away (TODO: adjust this depending on vehicle type, maybe even optics FOV?)
if (player distance _vehicle > 1000) exitWith {};
// Target is looking in a different direction (TODO: use weaponDirection for vehicles)
private _relDir = _unit getRelDir player;
if (_relDir > 60 && {_relDir < 300}) exitWith {};

// TODO: Factor in distance, fog, overcast, rain, nighttime (NVGs!), weapon lights, thermals, optics
private _maxPrecision = 3.5;

private _visibilty          = [vehicle player, "VIEW"] checkVisibility [eyePos _vehicle, aimPos player];
private _precisionForGroup  = linearConversion [0.1, 1, _visibilty, 0, _maxPrecision,        true];
private _precisionBroadcast = linearConversion [0.1, 1, _visibilty, 0, _maxPrecision * 0.75, true];

[QGVAR(revealForGroup),  [player, group _unit, _precisionForGroup], _group] call CBA_fnc_targetEvent;
[QGVAR(revealBroadcast), [player, _precisionBroadcast]] call CBA_fnc_globalEvent;

RETURN;
