class A3A {
    class Templates {
        class CUP_Base; // import the CUP base class from Antistasi Ultimate

        class CUP_ROC : CUP_Base {
            requiredAddons[] += {"Flex_CUP_ROC_Faction"}; // add the (CUP) Republic of China Army CfgPatches entry as an additional required addon for this faction to be available
            logo = QPATHTO_T(templates\CUP_ROC\CUP_ROC_logo.paa); // path to the logo image for the CUP Republic of China Army faction (copied from the base mod into our own mod and referenced by its path within our mod)
            flagTexture = "Flex_CUP_ROC_Faction\Data\Flag\ROC_Flag_co.paa"; // the flag texture for the CUP Republic of China Army faction (virtual path in game to the file provided by the base mod)
            basepath = QPATHTOFOLDER(templates\CUP_ROC); // the folder containing the template files for the CUP Republic of China Army faction
            file = "CUP_AI_ROC"; // the template file
            side = "Occ"; // set the side for the CUP Republic of China Army faction
            name = CSTRING(CUP_ROC); // the display name for the CUP Republic of China Army faction
            description = CSTRING(CUP_ROC_Description); // the description for the CUP Republic of China Army faction
        };
    };
};
