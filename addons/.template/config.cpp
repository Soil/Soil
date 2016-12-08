#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author           = "Soil Team";
        authorUrl        = "https://github.com/Soil/Soil";
        name             = COMPONENT_NAME;
        requiredVersion  = 0.1;
        units[]          = {};
        weapons[]        = {};
        VERSION_CONFIG;

        authors[]        = {};
        requiredAddons[] = {"soil_core"};
    };
};

#include "CfgEventHandlers.hpp"
