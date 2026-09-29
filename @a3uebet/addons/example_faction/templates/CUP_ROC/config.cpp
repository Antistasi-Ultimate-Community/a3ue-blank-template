// CUP ROC config additions

#include "..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(CUP_ROC) {
        name = COMPONENT_NAME;
        units[] = {
            "CUP_ROC_CRYE_Full",
            "CUP_ROC_CRYE_Full_RGR_Top",
            "CUP_ROC_CRYE_Full_RGR_Bottom",
            "CUP_ROC_CRYE_Roll",
            "CUP_ROC_CRYE_Roll_RGR_Top",
            "CUP_ROC_CRYE_Roll_RGR_Bottom",
            "CUP_ROC_B_Soldier_BDUv2",
            "CUP_ROC_B_Soldier_BDUv2_dirty",
            "CUP_ROC_B_Soldier_BDUv2_roll",
            "CUP_ROC_B_Soldier_BDUv2_roll_dirty",
            "CUP_ROC_B_Soldier_BDUv2_roll2",
            "CUP_ROC_B_Soldier_BDUv2_roll2_dirty",
            "CUP_ROC_B_Soldier_BDUv2_gloves",
            "CUP_ROC_B_Soldier_BDUv2_gloves_dirty",
            "CUP_ROC_B_Soldier_BDUv2_roll_gloves",
            "CUP_ROC_B_Soldier_BDUv2_roll_gloves_dirty",
            "CUP_ROC_B_Soldier_BDUv2_roll2_gloves",
            "CUP_ROC_B_Soldier_BDUv2_roll2_gloves_dirty",
            "CUP_ROC_B_Soldier_BDUv2_pol",
            "CUP_ROC_B_Soldier_BDUv2_pol_dirty",
            "CUP_ROC_B_Soldier_BDUv2_pol_roll",
            "CUP_ROC_B_Soldier_BDUv2_pol_roll_dirty",
            "CUP_ROC_B_Soldier_BDUv2_pol_roll2",
            "CUP_ROC_B_Soldier_BDUv2_pol_roll2_dirty",
            "CUP_ROC_B_Soldier_BDUv2_pol_gloves",
            "CUP_ROC_B_Soldier_BDUv2_pol_gloves_dirty",
            "CUP_ROC_B_Soldier_BDUv2_pol_roll_gloves",
            "CUP_ROC_B_Soldier_BDUv2_pol_roll_gloves_dirty",
            "CUP_ROC_B_Soldier_BDUv2_pol_roll2_gloves",
            "CUP_ROC_B_Soldier_BDUv2_pol_roll2_gloves_dirty"
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"Flex_CUP_ROC_Faction"};
        author = ECSTRING(main,Extender_Author);
        authors[] = {};
        authorUrl = ECSTRING(main,Extender_AuthorUrl);
        VERSION_CONFIG;
        skipWhenMissingDependencies = 1;
    };
};

#include "CfgMarkers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgTemplates.hpp"
