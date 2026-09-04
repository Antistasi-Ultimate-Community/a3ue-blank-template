#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_ultimate"};
        author = LSTRING(Extender_Author);
        authors[] = {};
        authorUrl = LSTRING(Extender_AuthorUrl);
        VERSION_CONFIG;
    };
};
