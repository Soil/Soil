/*
 * Author: Soil Team
 * Searches through all CfgGroups and extracts them to a hash
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */

#include "script_component.hpp"

private _temp1 = [];
private _temp2 = [];

_temp1 = "true" configClasses (configFile >> "CfgGroups");
{
	_temp2 append ("true" configClasses _x);
} forEach _temp1;
_temp1 = [];
{
	_temp1 append ("true" configClasses _x);
} forEach _temp2;
_temp2 = [];
{
	_temp2 append ("true" configClasses _x);
} forEach _temp1;
{
	[GVAR(allCfgGroups),configName _x,_x] call CBA_fnc_hashSet;
} forEach _temp2;
