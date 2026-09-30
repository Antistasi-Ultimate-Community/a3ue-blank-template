class CfgVehicles {
    class B_CargoNet_01_ammo_F;

    /* Define the first builder box.
     *
     * This one will have a static predefined set of objects that can be built
     * from it.
     *
     * Those boxes are defined here but to actually use them, they'll need to
     * be added to the utility items, too. See the appropriate example to see
     * how to do that.
     */
    class GVAR(MyExampleBuilderBox1): B_CargoNet_01_ammo_F {
        displayName = CSTRING(MyExampleBuilderBox1_DisplayName);

        // Not placable in Zeus; functionality wouldn't be there anyways...
        scopeCurator = 0;

        // Clear inventory of this box
        class TransportBackpacks {};
        class TransportItems {};
        class TransportMagazines {};
        class TransportWeapons {};

        // Until this issue https://github.com/BrettMayson/HEMTT/issues/1346 is
        // fixed, we'll have to point hemtt's nose on locale strings withing
        // nested arrays...
        yesHemttThoseStringsAreInUse[] = { CSTRING(MyExampleBuilderBox1_Category0_DisplayName) };

        /* Define contents of the builder box.
         *
         * Array elements can be one of:
         *
         *    `{"Classname", Price}`
         *        - a buildable item with specified price
         *    `{"Category Display Name", "Preview Image Path", {{"Classname", Price}, ...}}`
         *        - a category containing buildable items with specified
         *          prices or even further categories and items
         */
        A3A_core_buildableObjects[] = {
            { CSTRING(MyExampleBuilderBox1_Category0_DisplayName), "\a3\editorpreviews_f\Data\CfgVehicles\Land_CampingChair_V1_F.jpg", {
                {"Land_CampingChair_V2_white_F", 25},
                {"Land_CampingTable_F", 50},
                {"Land_CampingTable_small_F", 30},
                {"Land_CampingTable_small_white_F", 35},
                {"Land_CampingTable_white_F", 55},
                {"Land_CampingChair_V1_F", 20},
                {"Land_Camping_Light_F", 40}
            }}
        };
    };

    /* Second builder box.
     *
     * The contents of which are defined by calling a linked function which
     * populates the list of items.
     *
     * Inheritance from MyExampleBuilderBox1 is just to keep the class
     * definition as small as possible to keep focus on the additional dynamic
     * property.
     */
    class GVAR(MyExampleBuilderBox2): GVAR(MyExampleBuilderBox1) {
        displayName = CSTRING(MyExampleBuilderBox2_DisplayName);

        // Define callback function
        A3A_core_buildableObjectsCode = QUOTE(call FUNCMAIN(fillBuilderBox2));
    };
};
