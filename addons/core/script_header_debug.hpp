#include "script_header_default.hpp"

private _Soil_lastHandle = _Soil_functionHandle;
private _Soil_functionHandle = Soil_core_functionHandles pushBack _fnc_scriptName;

if (isNil "_Soil_lastHandle") then {
    Soil_core_functionHandles = [_fnc_scriptName];
    _Soil_functionHandle = 0;
    Soil_core_callstack = [[_Soil_functionHandle, _fnc_scriptNameParent, -1]];
} else {
    Soil_core_callstack pushBack [_Soil_functionHandle, _fnc_scriptNameParent, _Soil_lastHandle];
};

if (canSuspend) then {
    diag_log text "Warning: %1 was called in the scheduled environment.";
};
