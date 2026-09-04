#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(SupplyBoxSmall),
            QGVAR(SupplyBoxMedium),
            QGVAR(SupplyBoxLarge)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QUOTE(MAIN_ADDON)};
        author = ECSTRING(main,Extender_Author);
        authors[] = {};
        authorUrl = ECSTRING(main,Extender_AuthorUrl);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgUtilityItems.hpp"
