/*
 * Author: Soil Team
 * The main handler function for spawning units from the Queue
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

[{
    if(count GVAR(spawningQueue) < 1) exitWith {};

    // Select oldest Spawn Request
    private _entry = GVAR(spawningQueue) deleteAt 0;

    // And create group or spawn unit
    if (_entry isEqualType []) then {
        _entry params ["_type", "_side", "_position"];
        GVAR(currentGroup) = createGroup _side;
            
        {
            _x params ["_key","_value"];
            GVAR(currentGroup) setVariable [_key,_value];
        } forEach [
            [QGVAR(spawnPosition),_position]
        ];
        // ToDo: Expand parameters like value, unittype, AT capability, vehicles etc
    } else {
        private _position = GVAR(currentGroup) getVariable QGVAR(spawnPosition);

        // ToDo: Differentiate between createUnit and createVehicle
        private _unit = createVehicle [_entry, _position, [], 0, "NONE"];
        [_unit] joinSilent GVAR(currentGroup);
    };
}, 1, []] call CBA_fnc_addPerFrameHandler;
