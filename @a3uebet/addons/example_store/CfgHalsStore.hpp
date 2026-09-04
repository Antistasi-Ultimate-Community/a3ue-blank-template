#include "\x\A3A\addons\hals\Addons\store\config.hpp"

/**
 * This example demonstrates how to configure a custom store in HAL's store.
 *
 * It makes a new store category called "cTab - GPS" and puts four cTab
 * navigation devices in it.
 */

class A3U {
    class traderAddons {
        class addons_base;
        class addons_a3uebet: addons_base {
            // Addon dependency; don't load this store if "cTab" workshop item
            // isn't loaded.
            addons[] = {"cTab"};
            // Reference to "weapons_a3uebet" defined below.
            weapons = "weapons_a3uebet";
        };

        class traderWeapons {
            class weapons_base;
            // Prefix is the item stock defined below.
            class weapons_a3uebet: weapons_base {
                prefix = "ctab_stock";
            };
        };
    };
};

class CfgHALsAddons {
    class CfgHALsStore {
        class categories {
            /**
             * Navigation category for cTab GPS devices.
             *
             * Other category examples:
             *
             * - Handguns
             *   -> displayName = displayName = __EVAL(formatText["%1 %2", LLSTRING(Title), localize "STR_A3AU_handguns"]);
             *   -> picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";
             *
             * - Rifles
             *   -> displayName = displayName = __EVAL(formatText["%1 %2", LLSTRING(Title), localize "STR_A3AU_rifles"]);
             *   -> picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
             *
             * - Sniper Rifles
             *   -> displayName = displayName = __EVAL(formatText["%1 %2", LLSTRING(Title), localize "STR_A3AU_sniperRifles"]);
             *   -> picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
             *
             * - MGs
             *   -> displayName = displayName = __EVAL(formatText["%1 %2", LLSTRING(Title), localize "STR_A3AU_mgs"]);
             *   -> picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
             *
             * - SMGs
             *   -> displayName = displayName = __EVAL(formatText["%1 %2", LLSTRING(Title), localize "STR_A3AU_smgs"]);
             *   -> picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
             *
             * - Launchers
             *   -> displayName = displayName = __EVAL(formatText["%1 %2", LLSTRING(Title), localize "STR_A3AU_launchers"]);
             *   -> picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";
             *
             * - Launcher magazines
             *   -> displayName = displayName = __EVAL(formatText["%1 %2", LLSTRING(Title), localize "STR_A3AU_launcherAmmo"]);
             *   -> picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
             *
             * - Navigation
             *   -> displayName = __EVAL(formatText["%1 %2, %3 %4 %5", LLSTRING(Title), localize "STR_A3AU_gps", localize "STR_A3AU_binoculars", localize "STR_A3AU_and", localize "STR_A3AU_nvgs"]);
             *   -> picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\compass_ca.paa";
             *
             * - Pointers/Flashlights
             *   -> displayName = __EVAL(formatText["%1 %2 %3 %4", LLSTRING(Title), localize "STR_A3AU_pointers", localize "STR_A3AU_and", localize "STR_A3AU_flashlights"]);
             *   -> picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";
             *
             * - Muzzle devices
             *   -> displayName = __EVAL(formatText["%1 %2", LLSTRING(Title), localize "STR_A3AU_muzzles"]);
             *   -> picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";
             *
             * - Optics
             *   -> displayName = __EVAL(formatText["%1 %2", LLSTRING(Title), localize "STR_A3AU_sights"]);
             *   -> picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
             *
             * - Magazines
             *   -> displayName = __EVAL(formatText["%1 %2", LLSTRING(Title), localize "STR_A3AU_magazines"]);
             *   -> picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
             *
             * - Miscellaneous
             *   -> displayName = __EVAL(formatText["%1 %2", LLSTRING(Title), localize "STR_A3AU_misc"]);
             *   -> picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
             */
            class navigationCtab {
                displayName = __EVAL(formatText["%1 %2", LLSTRING(Title), localize "STR_A3AU_gps"]);
    			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

                // Sadly, HEMTT doesn't pick up on LLSTRING(Title) above, so we
                // need to reference title explicitly, lest there be HEMTT warnings.
                titleReferencedHereSoHemttDontShitItsPants = CSTRING(Title);

                // Define items with the ITEM macro:
                // (ItemClassname,Price,StockAvailableInStore)
                //
                // For $reasons, please note that the macro isn't terminated
                // with a semicolon.
                ITEM(ItemcTab,1250,MISC_STOCK)
                ITEM(ItemAndroid,1650,MISC_STOCK)
                ITEM(ItemMicroDAGR,1500,MISC_STOCK)

                // ...or as a class
                // This is the same as using the ITEM macro:
                // ITEM(ItemcTabHCam,250,MISC_STOCK)
                class ItemcTabHCam {
                    price = 250;
                    stock = MISC_STOCK;
                };
            };

            // Put more stores here; let's assume, there are also
            // launchersCtab & magazinesCtab for a more comprehensible example
            // to below.
        };

        class stores {
            // Class name is what you defined as a "prefix" above
            class ctab_stock {
                // This stays.
                displayName = "$STR_ARMS_DEALER_STORE";
                // List all stores you defined above. Since there's only one,
                // we only list the one we defined; if there were the two
                // hypothetical stores "launchersCtab" & "magazinesCtab"
                // defined, they need to be listed here, too.
                categories[] = {
                    "navigationCtab"
                };
            };
        };
    };
};
