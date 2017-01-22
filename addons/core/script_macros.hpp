#include "\x\cba\addons\main\script_macros_common.hpp"

// Overloaded array macro, only use for config!
#define ARR(var1) \
    [var1]
#define ARR(var1,var2) \
    [var1, var2]
#define ARR(var1,var2,var3) \
    [var1, var2, var3]
#define ARR(var1,var2,var3,var4) \
    [var1, var2, var3, var4]
#define ARR(var1,var2,var3,var4,var5) \
    [var1, var2, var3, var4, var5]
#define ARR(var1,var2,var3,var4,var5,var6) \
    [var1, var2, var3, var4, var5, var6]
#define ARR(var1,var2,var3,var4,var5,var6,var7) \
    [var1, var2, var3, var4, var5, var6, var7]
#define ARR(var1,var2,var3,var4,var5,var6,var7,var8) \
    [var1, var2, var3, var4, var5, var6, var7, var8]
#define ARR(var1,var2,var3,var4,var5,var6,var7,var8,var9) \
    [var1, var2, var3, var4, var5, var6, var7, var8, var9]
#define ARR(var1,var2,var3,var4,var5,var6,var7,var8,var9,var10) \
    [var1, var2, var3, var4, var5, var6, var7, var8, var9, var10]

// - Tweaked logging - TODO: Push this to UI system ---------------------------
#define LOG(message) diag_log text (message)
#define LOG_FORMAT(message) diag_log formatText message
#define LOG_SYS(level,message) \
    LOG_FORMAT(ARR_4('[Soil %1] %2: %3','COMPONENT_BEAUTIFIED',level,message))

// Contrary to CBA, these macros contain the square brackets
#define ARR_1(var1) \
    [var1]
#define ARR_2(var1,var2) \
    [var1, var2]
#define ARR_3(var1,var2,var3) \
    [var1, var2, var3]
#define ARR_4(var1,var2,var3,var4) \
    [var1, var2, var3, var4]
#define ARR_5(var1,var2,var3,var4,var5) \
    [var1, var2, var3, var4, var5]
#define ARR_6(var1,var2,var3,var4,var5,var6) \
    [var1, var2, var3, var4, var5, var6]
#define ARR_7(var1,var2,var3,var4,var5,var6,var7) \
    [var1, var2, var3, var4, var5, var6, var7]
#define ARR_8(var1,var2,var3,var4,var5,var6,var7,var8) \
    [var1, var2, var3, var4, var5, var6, var7, var8]
#define ARR_9(var1,var2,var3,var4,var5,var6,var7,var8,var9) \
    [var1, var2, var3, var4, var5, var6, var7, var8, var9]
#define ARR_10(var1,var2,var3,var4,var5,var6,var7,var8,var9,var10) \
    [var1, var2, var3, var4, var5, var6, var7, var8, var9, var10]

#define INFO(var1) \
    LOG_SYS("Info",var1)
#define INFO_1(var1,var2) \
    INFO(format ARR_2(var1,var2))
#define INFO_2(var1,var2,var3) \
    INFO(format ARR_3(var1,var2,var3))
#define INFO_3(var1,var2,var3,var4) \
    INFO(format ARR_4(var1,var2,var3,var4))
#define INFO_4(var1,var2,var3,var4,var5) \
    INFO(format ARR_5(var1,var2,var3,var4,var5))
#define INFO_5(var1,var2,var3,var4,var5,var6) \
    INFO(format ARR_6(var1,var2,var3,var4,var5,var6))
#define INFO_6(var1,var2,var3,var4,var5,var6,var7) \
    INFO(format ARR_7(var1,var2,var3,var4,var5,var6,var7))
#define INFO_7(var1,var2,var3,var4,var5,var6,var7,var8) \
    INFO(format ARR_8(var1,var2,var3,var4,var5,var6,var7,var8))
#define INFO_8(var1,var2,var3,var4,var5,var6,var7,var8,var9) \
    INFO(format ARR_9(var1,var2,var3,var4,var5,var6,var7,var8,var9))
#define INFO_9(var1,var2,var3,var4,var5,var6,var7,var8,var9,var10) \
    INFO(format ARR_10(var1,var2,var3,var4,var5,var6,var7,var8,var9,var10))

#define WARNING(var1) \
    LOG_SYS("Warning",var1)
#define WARNING_1(var1,var2) \
    WARNING(format ARR_2(var1,var2))
#define WARNING_2(var1,var2,var3) \
    WARNING(format ARR_3(var1,var2,var3))
#define WARNING_3(var1,var2,var3,var4) \
    WARNING(format ARR_4(var1,var2,var3,var4))
#define WARNING_4(var1,var2,var3,var4,var5) \
    WARNING(format ARR_5(var1,var2,var3,var4,var5))
#define WARNING_5(var1,var2,var3,var4,var5,var6) \
    WARNING(format ARR_6(var1,var2,var3,var4,var5,var6))
#define WARNING_6(var1,var2,var3,var4,var5,var6,var7) \
    WARNING(format ARR_7(var1,var2,var3,var4,var5,var6,var7))
#define WARNING_7(var1,var2,var3,var4,var5,var6,var7,var8) \
    WARNING(format ARR_8(var1,var2,var3,var4,var5,var6,var7,var8))
#define WARNING_8(var1,var2,var3,var4,var5,var6,var7,var8,var9) \
    WARNING(format ARR_9(var1,var2,var3,var4,var5,var6,var7,var8,var9))
#define WARNING_9(var1,var2,var3,var4,var5,var6,var7,var8,var9,var10) \
    WARNING(format ARR_10(var1,var2,var3,var4,var5,var6,var7,var8,var9,var10))

#define ERROR(var1) \
    LOG_SYS("Error",var1)
#define ERROR_1(var1,var2) \
    ERROR(format ARR_2(var1,var2))
#define ERROR_2(var1,var2,var3) \
    ERROR(format ARR_3(var1,var2,var3))
#define ERROR_3(var1,var2,var3,var4) \
    ERROR(format ARR_4(var1,var2,var3,var4))
#define ERROR_4(var1,var2,var3,var4,var5) \
    ERROR(format ARR_5(var1,var2,var3,var4,var5))
#define ERROR_5(var1,var2,var3,var4,var5,var6) \
    ERROR(format ARR_6(var1,var2,var3,var4,var5,var6))
#define ERROR_6(var1,var2,var3,var4,var5,var6,var7) \
    ERROR(format ARR_7(var1,var2,var3,var4,var5,var6,var7))
#define ERROR_7(var1,var2,var3,var4,var5,var6,var7,var8) \
    ERROR(format ARR_8(var1,var2,var3,var4,var5,var6,var7,var8))
#define ERROR_8(var1,var2,var3,var4,var5,var6,var7,var8,var9) \
    ERROR(format ARR_9(var1,var2,var3,var4,var5,var6,var7,var8,var9))
#define ERROR_9(var1,var2,var3,var4,var5,var6,var7,var8,var9,var10) \
    ERROR(format ARR_10(var1,var2,var3,var4,var5,var6,var7,var8,var9,var10))

// - Custom compilation related macros ----------------------------------------
#ifndef FUNCTION_HEADER
    #define FUNCTION_HEADER QPATHTOEF(core,script_header_default.hpp)
#endif

#ifdef DEBUG_MODE_FULL
    #define FUNCTION_HEADER QPATHTOEF(core,script_header_debug.hpp)
#endif

#ifdef DISABLE_COMPILE_CACHE
    #define ENABLE_CACHING false
#else
    #define ENABLE_CACHING true
#endif

#define PREP(funcName) \
    [ \
        QFUNC(funcName), \
        QPATHTOF(functions\DOUBLES(fnc,funcName).sqf), \
        FUNCTION_HEADER, \
        ENABLE_CACHING \
    ] call EFUNC(core,compileFunction)
#define PREP_NOHEAD(funcName) \
    [ \
        QFUNC(funcName), \
        QPATHTOF(functions\DOUBLES(fnc,funcName).sqf), \
        "", \
        ENABLE_CACHING \
    ] call EFUNC(core,compileFunction)

#define RETURN breakOut "SOIL_ROOT_SCOPE"
#ifdef DEBUG_MODE_FULL
    #define RETURNV(value) \
        private _ret = value; \
        if (isNil "_ret") then { \
            breakOut "SOIL_ROOT_SCOPE"; \
        } else { \
            _ret breakOut "SOIL_ROOT_SCOPE"; \
        }
#else
    #define RETURNV(value) \
        private _ret = value; \
        if (isNil "_ret") then { \
            WARNING_1("%1 returned nil value.",_fnc_scriptName); \
            breakOut "SOIL_ROOT_SCOPE"; \
        } else { \
            _ret breakOut "SOIL_ROOT_SCOPE"; \
        }
#endif
