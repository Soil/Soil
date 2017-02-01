#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// Define Variables
GVAR(spawningQueue) = [];
GVAR(currentGroup) = grpNull;
GVAR(allCfgGroups) = call CBA_fnc_hashCreate;

ADDON = true;
