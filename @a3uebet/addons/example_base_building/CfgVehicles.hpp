class CfgVehicles {
    class B_CargoNet_01_ammo_F;

    class GVAR(MyExampleBuilderBox): B_CargoNet_01_ammo_F {
        displayName = CSTRING(MyExampleBuilderBox_DisplayName);

        // Not placable in Zeus; functionality wouldn't be there anyways...
        scopeCurator = 0;

        A3A_core_buildableObjects[] = {

        };
    };
};
