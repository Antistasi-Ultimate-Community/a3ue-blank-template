// One post-init event handler for each scope: server and client. In those
// functions we subscribe to events.
class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_SCRIPT(XEH_postInitClient));
        serverInit = QUOTE(call COMPILE_SCRIPT(XEH_postInitServer));
    };
};

// This pre-init event handler prepares our functions in use above
class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};
