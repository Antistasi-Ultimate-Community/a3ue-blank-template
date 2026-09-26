class A3A {
    class Templates {
        //////////////////////////
        //   Basic Structure    //
        //////////////////////////
        /*
        class Base; // base class imported from Antistasi Ultimate

        class GVAR(MyFaction): Base { // TODO: Replace with better example (Flex CUP ROC?)
            requiredAddons[] = {}; // List CfgPatches dependencies here. If the player doesn't have these addons, the faction won't be available.
            logo = "a3\ui_f\data\logos\arma3_expansion_ca.paa"; // Logo displayed in faction setup dialog. It may either be your own logo for the extender, or the logo from the mod you used to create the extender, e.g. RHS logo
            basepath = QPATHTOFOLDER(templates); // path to the folder containing the faction template(s)
            file = "MyFaction"; // filename (without the .sqf extension) of the faction template
            flagTexture = "a3\data_f\flags\flag_fia_co.paa";
            side = "Reb"; // side of the faction (Civ, Inv, Occ, Reb)
            climate[] = {"temperate", "tropical", "arid"}; // map climates for which the faction is designed. If defined, the faction will only show up in the setup dialog if the selected map is one of these climates. Do not include this property if the faction should always be available / is not climate-specific
            name = CSTRING(Name); // localized name of the faction
            description = CSTRING(Description); // localized description of the faction
        };
        */

        ////////////////////////////////
        //   Common Base Structure    //
        ////////////////////////////////
        /*
        class GVAR(Example_Base) { // you can define your own base as well, if you're adding multiple factions in one extender that share common properties, like required mods or mod logo
            requiredAddons[] = {};
            logo = "a3\ui_f\data\logos\arma3_expansion_ca.paa";
            basepath = QPATHTOFOLDER(templates\Examples); // the folder containing the template files for the factions that inherit from this class. All the template examples are located in templates\examples
            climate[] = {"temperate", "tropical", "arid"};
        };
        class GVAR(Example_Occ) : GVAR(Example_Base) { // in each of these actual factions, we only include the properties that are different from the base class
            file = "Example_Occ";
            flagTexture = "a3\data_f\flags\flag_nato_co.paa";
            side = "Occ";
            name = CSTRING(Example_Occ);
        };
        class GVAR(Example_Inv) : GVAR(Example_Occ) { // note that occupant and invader templates are structured the same way and have the same requirements. Here, we simply have the invader faction inherit from the occupant faction and change the side to invader.
            side = "Inv";
            name = CSTRING(Example_Inv);
        };
        class GVAR(Example_Riv) : GVAR(Example_Base) {
            file = "Example_Riv";
            flagTexture = "a3\data_f\flags\flag_fia_co.paa";
            side = "Riv";
            name = CSTRING(Example_Riv);
        };
        class GVAR(Example_Reb) : GVAR(Example_Base) {
            file = "Example_Reb";
            flagTexture = "a3\data_f\flags\flag_fia_co.paa";
            side = "Reb";
            name = CSTRING(Example_Reb);
        };
        class GVAR(Example_Civ) : GVAR(Example_Base) {
            file = "Example_Civ";
            flagTexture = "a3\data_f\flags\flag_fia_co.paa";
            side = "Civ";
            name = CSTRING(Example_Civ);
        };
        */
    };
};
