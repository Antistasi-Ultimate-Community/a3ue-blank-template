#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_ultimate"};
        author = CSTRING(Extender_Author);
        authors[] = {};
        authorUrl = CSTRING(Extender_AuthorUrl);
        VERSION_CONFIG;
    };
};
