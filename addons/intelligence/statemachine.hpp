class GVAR(statemachine) {
    list = "allUnits";
    skipNull = 1;

    class discoverUnits {
        onState = QUOTE(call FUNC(revealToAI));
    };
};
