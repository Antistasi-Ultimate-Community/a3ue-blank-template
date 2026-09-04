/**
 * In this example, the mod's addon defines three supply box vehicles: large,
 * medium, and small. All of which we want to make available in the rebel shop.
 */
class CfgVehicles {
    class ReammoBox_F;

    class GVAR(SupplyBoxBase) : ReammoBox_F {
        scope = 0;

        ace_cargo_size = 2;
        ace_cargo_canLoad = 1;
        ace_dragging_canCarry = 1;
        ace_dragging_canDrag = 1;

        hiddenSelections[] = {"Camo_Signs","Camo"};
        hiddenSelectionsTextures[] = {
            QPATHTO_T(ui\assets-SupplyBoxBase_decals_ca.paa),
            "A3\Weapons_F\Ammoboxes\data\AmmoBox_CO.paa"
        };
        mapSize = 1.47;

        class A3A_logistics_Cargo {
            offset[] = {0,0,0}; //the offset from the node(s) to load the cargo on too
            rotation[] = {0,1,0}; //the rotation from the vehicle model front
            size = 1; //the amount of nodes it occupies
            recoil = 0; //the recoil a weapon impacts on the vehicle when fired (per projectile)
            isWeapon = 0; //if the cargo is a weapon (needed for proper handling of mounted weapon)
            blackList[] = {}; //specific vehicles or models to blacklist from loading this weapon/cargo
        };
    };

    class GVAR(SupplyBoxLarge) : GVAR(SupplyBoxBase) {
        scope = 2;

        ace_cargo_size = 4;
        ace_dragging_canCarry = 0;
        ace_dragging_canDrag = 0;

        displayName = CSTRING(SupplyBoxLarge_DisplayName);
        editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\Box_NATO_AmmoVeh_F.jpg";
        icon = "iconCrateVeh";
        mapSize = 1.53;
        maximumLoad = 14400;
        model = "A3\Weapons_F\Ammoboxes\AmmoVeh_F.p3d";
        slingLoadCargoMemoryPoints[] = {"SlingLoadCargo1","SlingLoadCargo2","SlingLoadCargo3","SlingLoadCargo4"};

        class A3A_logistics_Cargo: A3A_logistics_Cargo {
            offset[] = {0,0,0.81};
            rotation[] = {1,0,0};
            size = 2;
        };
    };

    class GVAR(SupplyBoxMedium) : GVAR(SupplyBoxBase) {
        scope = 2;

        ace_cargo_size = 3;

        displayName = CSTRING(SupplyBoxMedium_DisplayName);
        editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\Box_NATO_Wps_F.jpg";
        hiddenSelectionsMaterials[] = {"a3\data_f\default_alpha.rvmat","a3\Supplies_F_Enoch\Ammoboxes\Data\AmmoBox_EAF.rvmat"};
        icon = "iconCrateWpns";
        mapSize = 1.81;
        maximumLoad = 4800;
        model = "\A3\weapons_F\AmmoBoxes\WpnsBox_F.p3d";

        class A3A_logistics_Cargo: A3A_logistics_Cargo {
            offset[] = {0,0,0.17};
        };

        class SimpleObject {
            animate[] = {};
            eden = 1;
            hide[] = {};
            init = "''";
            verticalOffset = 0.189;
            verticalOffsetWorld = 0;
        };
    };

    class GVAR(SupplyBoxSmall) : GVAR(SupplyBoxBase) {
        scope = 2;

        displayName = CSTRING(SupplyBoxSmall_DisplayName);
        editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\Box_NATO_Ammo_F.jpg";
        icon = "iconCrateAmmo";
        maximumLoad = 2400;
        model = "\A3\weapons_F\AmmoBoxes\AmmoBox_F.p3d";

        class A3A_logistics_Cargo: A3A_logistics_Cargo {
            offset[] = {0,0,0.27};
            rotation[] = {1,0,0};
        };

        class AnimationSources {
            class Ammo_source {
                animPeriod = 1;
                initPhase = 1;
                source = "user";
            };
            class AmmoOrd_source {
                animPeriod = 1;
                initPhase = 1;
                source = "user";
            };
            class Grenades_source {
                animPeriod = 1;
                initPhase = 1;
                source = "user";
            };
            class Support_source {
                animPeriod = 1;
                initPhase = 0;
                source = "user";
            };
        };

        class SimpleObject {
            animate[] = {{"ammo_hide",1},{"ammoord_hide",1},{"grenades_hide",1},{"support_hide",0}};
            eden = 1;
            hide[] = {};
            init = "''";
            verticalOffset = 0.284;
            verticalOffsetWorld = 0;
        };
    };
};
