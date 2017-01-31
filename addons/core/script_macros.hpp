#include "\x\cba\addons\main\script_macros_common.hpp"

#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

////////////
/// MISC ///
////////////
#define EVALPOS(VAR)    (if IS_STRING(VAR) then { VAR = getMarkerPos VAR } else { if IS_OBJECT(VAR) then { VAR = getPosATL VAR }})
