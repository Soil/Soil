#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        #include "required_addons.hpp"
        authors[] = {"BaerMitUmlaut"};
        author = "Soil Team";
        authorUrl = "https://github.com/Soil/Soil";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
