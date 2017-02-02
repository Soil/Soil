#include "script_component.hpp"

if (hasInterface) then {
    [configFile >> QGVAR(statemachine)] call CBA_statemachine_fnc_createFromConfig;
};

[QGVAR(revealForGroup), {
    params ["_unit", "_group", "_precision"];
    _group reveal [_unit, _precision];
}] call CBA_fnc_addEventHandler;

[QGVAR(revealBroadcast), {
    params ["_unit", "_precision"];
    {
        if (local _x) then {
            _group reveal [_unit, _precision];
        };
    } forEach EGVAR(core,groups);
}] call CBA_fnc_addEventHandler;
