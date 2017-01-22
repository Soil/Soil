/*
 * Author: BaerMitUmlaut
 * Dumps the current callstack to the RPT.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"
if (isNil QGVAR(callstack)) exitWith {};

private _tab = "    ";
private _nl = toString [13, 10];
private _indentation = "";
private _indentationMemory = [];
_indentationMemory resize count GVAR(callstack);
private _lastHandle = -1;

private _output = "Dumping callstack:" + _nl;
{
    _x params ["_currentHandle", "_parent", "_parentHandle"];
    private _current = GVAR(functionHandles) select _currentHandle;

    if (_parentHandle != _lastHandle) then {
        _indentation = _indentationMemory select _parentHandle;
    };

    if (_parent == (GVAR(functionHandles) param [_parentHandle, ""])) then {
        _output = _output + _indentation + format ["-> %1", _current] + _nl;
    } else {
        if (_current == _parent) then {
            _parent = "unknown function";
        };
        _output = _output + _indentation + format ["-> %1 (via %2)", _current, _parent] + _nl;
    };

    _indentation = _indentation + _tab;
    _indentationMemory set [_currentHandle, _indentation];
} forEach GVAR(callstack);

LOG(_output);
RETURN;
