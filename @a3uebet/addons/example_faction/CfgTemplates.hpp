class A3A {
    class Templates {
        class Base;

        class GVAR(MyFaction): Base {
            // List CfgPatches dependencies here
            requiredAddons[] = {};
            // Logo displayed as in faction setup dialog
            logo = "a3\ui_f\data\logos\arma3_expansion_ca.paa";
            // Path relative to this addon's folder (i.e. everything after "example_faction/")
            // but EXCLUDING this factions name.
            basepath = QPATHTOFOLDER(templates);
            // .sqf faction definition file w/o its extension
            file = "MyFaction";
            /* Path to the faction's flag texture; define your own with the QPATHTO_T macro.
             * If, for example, in "example_faction\flags\myFlag.paa", you would use:
             *
             *     flagTexture = QPATHTO_T(flags\myFlag.paa);
             */
            flagTexture = "a3\data_f\flags\flag_fia_co.paa";
            // Can be: "Civ", "Inv", "Occ", "Reb"
            side = "Reb";
            climate[] = {"temperate", "tropical", "arid"};
            name = CSTRING(Name);
            description = CSTRING(Description);
        };
    };
};
