class Extended_PreStart_EventHandlers {
    ADDON = QUOTE(call COMPILE_FILE(XEH_preStart));
};

class Extended_PreInit_EventHandlers {
    ADDON = QUOTE(call COMPILE_FILE(XEH_preInit));
};

class Extended_PostInit_EventHandlers {
    ADDON = QUOTE(call COMPILE_FILE(XEH_postInit));
};
