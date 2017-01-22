/*
 * Author: BaerMitUmlaut
 * Compiles a function with the given function header and caches it.
 *
 * Arguments:
 * 0: Function name                   <STRING>
 * 1: Filepath                        <STRING>
 * 2: Header filepath (default: none) <STRING>
 * 3: Cache function (default: true)  <BOOL>
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"
params [
    ["_funcName", "", [""]],
    ["_funcPath", "", [""]],
    ["_headerPath", "", [""]],
    ["_cache", false, [true]]
];

if (_funcName == "" || {_funcPath == ""}) exitWith {
    ERROR_2("Cannot compile ""%1"" (%2): Invalid parameters.",_funcName,_funcPath);
};

if (isNil QGVAR(functionHeaders)) then {
    GVAR(functionHeaders) = [[], ""] call CBA_fnc_hashCreate;
};

private _header = "";
if (_headerPath != "") then {
    _header = [GVAR(functionHeaders), _headerPath] call CBA_fnc_hashGet;
    if (_header == "") then {
        _header = preprocessFile _headerPath;
        [GVAR(functionHeaders), _headerPath, _header] call CBA_fnc_hashSet;
    };
};

private "_function";
if (_cache) then {
    _function = uiNamespace getVariable _funcName;
    if (isNil "_function") then {
        _function = preprocessFileLineNumbers _funcPath;
        _function = format [_header, _funcName] + _function;
        _function = compileFinal _function;
        uiNamespace setVariable [_funcName, _function];
    };
} else {
    _function = preprocessFileLineNumbers _funcPath;
    _function = format [_header, _funcName] + _function;
    _function = compile _function;
};

missionNamespace setVariable [_funcName, _function];
