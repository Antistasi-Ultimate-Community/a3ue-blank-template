class CfgWeapons {

    // Vests
    class CUP_V_CPC_communications_rngr;
    class CUP_V_CPC_Fast_rngr;
    class CUP_V_CPC_light_rngr;
    class CUP_V_CPC_medical_rngr;
    class CUP_V_CPC_tl_rngr;
    class CUP_V_CPC_weapons_rngr;
    class CUP_V_CPC_communicationsbelt_rngr;
    class CUP_V_CPC_Fastbelt_rngr;
    class CUP_V_CPC_lightbelt_rngr;
    class CUP_V_CPC_medicalbelt_rngr;
    class CUP_V_CPC_tlbelt_rngr;
    class CUP_V_CPC_weaponsbelt_rngr;

    class CUP_V_B_PilotVest;

    class CUP_ROC_V_CPC_communications : CUP_V_CPC_communications_rngr {
        scope = 2;
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\cpc_roc_dig_co.paa),
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            QPATHTOFOLDER(templates\CUP_ROC\data\radio_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\pouch_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\gear_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\m203_roc_dig_co.paa)
        };
    };

    class CUP_ROC_V_CPC_communicationsbelt : CUP_V_CPC_communicationsbelt_rngr {
        scope = 2;
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\cpc_roc_dig_co.paa),
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            QPATHTOFOLDER(templates\CUP_ROC\data\radio_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\pouch_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\gear_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\m203_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\belt_roc_dig_co.paa)
        };
    };

    class CUP_ROC_V_CPC_Fast : CUP_V_CPC_Fast_rngr {
        scope = 2;
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\cpc_roc_dig_co.paa),
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            QPATHTOFOLDER(templates\CUP_ROC\data\taco_roc_dig_co.paa),
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa"
        };
    };

    class CUP_ROC_V_CPC_Fastbelt : CUP_V_CPC_Fastbelt_rngr {
        scope = 2;
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\cpc_roc_dig_co.paa),
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            QPATHTOFOLDER(templates\CUP_ROC\data\taco_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\gear_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\pouch_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\belt_roc_dig_co.paa)
        };
    };

    class CUP_ROC_V_CPC_light : CUP_V_CPC_light_rngr {
        scope = 2;
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(templates\CUP_ROC\data\cpc_roc_dig_co.paa)};
    };

    class CUP_ROC_V_CPC_lightbelt : CUP_V_CPC_lightbelt_rngr {
        scope = 2;
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\cpc_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\pouch_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\gear_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\belt_roc_dig_co.paa)
        };
    };

    class CUP_ROC_V_CPC_medical : CUP_V_CPC_medical_rngr {
        scope = 2;
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\cpc_roc_dig_co.paa),
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\shears_od.paa",
            QPATHTOFOLDER(templates\CUP_ROC\data\pouch_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\gear_roc_dig_co.paa)
        };
    };

    class CUP_ROC_V_CPC_medicalbelt : CUP_V_CPC_medicalbelt_rngr {
        scope = 2;
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\cpc_roc_dig_co.paa),
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\shears_od.paa",
            QPATHTOFOLDER(templates\CUP_ROC\data\pouch_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\gear_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\belt_roc_dig_co.paa)
        };
    };

    class CUP_ROC_V_CPC_tl : CUP_V_CPC_tl_rngr {
        scope = 2;
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\cpc_roc_dig_co.paa),
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            QPATHTOFOLDER(templates\CUP_ROC\data\grenade_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\radio_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\pouch_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\gear_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\taco_roc_dig_co.paa)
        };
    };

    class CUP_ROC_V_CPC_tlbelt : CUP_V_CPC_tlbelt_rngr {
        scope = 2;
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\cpc_roc_dig_co.paa),
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            QPATHTOFOLDER(templates\CUP_ROC\data\grenade_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\radio_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\pouch_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\gear_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\taco_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\taco_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\belt_roc_dig_co.paa)
        };
    };

    class CUP_ROC_V_CPC_weapons : CUP_V_CPC_weapons_rngr {
        scope = 2;
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\cpc_roc_dig_co.paa),
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            QPATHTOFOLDER(templates\CUP_ROC\data\taco_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\grenade_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\gear_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\m203_roc_dig_co.paa)
        };
    };

    class CUP_ROC_V_CPC_weaponsbelt : CUP_V_CPC_weaponsbelt_rngr {
        scope = 2;
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\cpc_roc_dig_co.paa),
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            "CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\cpc\pmag_co.paa",
            QPATHTOFOLDER(templates\CUP_ROC\data\taco_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\grenade_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\gear_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\m203_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\belt_roc_dig_co.paa)
        };
    };

    class CUP_ROC_V_B_PilotVest : CUP_V_B_PilotVest {
        scope = 2;
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(templates\CUP_ROC\data\usmc_pilot_roc_dig_co.paa)};
    };

    // Uniforms
    class UniformItem;

    class CUP_U_CRYE_TAN_Full;
    class CUP_U_CRYE_TAN_Roll;

    class CUP_ROC_U_CRYE_Full : CUP_U_CRYE_TAN_Full {
        scope = 2;
        displayName = "Crye ROC Full";
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(templates\CUP_ROC\data\crye_g3_roc_dig_co.paa)};
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_Crye_Full";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_CRYE_Full_RGR_Top : CUP_ROC_U_CRYE_Full {
        displayName = "Crye ROC Full (RG Top)";
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(templates\CUP_ROC\data\crye_g3_roc_dig_rgr_top_co.paa)};
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_Crye_Full_Rgr_Top";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_CRYE_Full_RGR_Bottom : CUP_ROC_U_CRYE_Full {
        displayName = "Crye ROC Full (RG Bottom)";
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(templates\CUP_ROC\data\crye_g3_roc_dig_rgr_bottom_co.paa)};
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_Crye_Full_Rgr_Bottom";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_CRYE_Roll : CUP_U_CRYE_TAN_Roll {
        scope = 2;
        displayName = "Crye ROC Rolled";
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(templates\CUP_ROC\data\crye_g3_roc_dig_co.paa)};
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_Crye_Roll";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_CRYE_Roll_RGR_Top : CUP_ROC_U_CRYE_Roll {
        displayName = "Crye ROC Rolled (RG Top)";
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(templates\CUP_ROC\data\crye_g3_roc_dig_rgr_top_co.paa)};
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_Crye_Roll_Rgr_Top";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_CRYE_Roll_RGR_Bottom : CUP_ROC_U_CRYE_Roll {
        displayName = "Crye ROC Rolled (RG Bottom)";
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(templates\CUP_ROC\data\crye_g3_roc_dig_rgr_bottom_co.paa)};
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_Crye_Roll_Rgr_Bottom";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_U_B_BDUv2_OD;
    class CUP_U_B_BDUv2_dirty_OD;
    class CUP_U_B_BDUv2_gloves_OD;
    class CUP_U_B_BDUv2_gloves_dirty_OD;
    class CUP_U_B_BDUv2_roll2_OD;
    class CUP_U_B_BDUv2_roll2_dirty_OD;
    class CUP_U_B_BDUv2_roll2_gloves_OD;
    class CUP_U_B_BDUv2_roll2_gloves_dirty_OD;
    class CUP_U_B_BDUv2_roll_OD;
    class CUP_U_B_BDUv2_roll_dirty_OD;
    class CUP_U_B_BDUv2_roll_gloves_OD;
    class CUP_U_B_BDUv2_roll_gloves_dirty_OD;

    class CUP_ROC_U_B_BDUv2_dirty : CUP_U_B_BDUv2_dirty_OD {
        scope = 2;
        displayName = "BDU (ROC, Dirty)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa)
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_dirty";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_pol_dirty : CUP_U_B_BDUv2_roll2_dirty_OD {
        scope = 2;
        displayName = "BDU (ROC Police, Dirty)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa)
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_pol_dirty";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_gloves_dirty : CUP_U_B_BDUv2_gloves_dirty_OD {
        scope = 2;
        displayName = "BDU (ROC, Gloves/Dirty)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            "\CUP\Creatures\People\Military\CUP_Creatures_People_Military_Russia\data\oakley_co.paa"
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_gloves_dirty";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_pol_gloves_dirty : CUP_U_B_BDUv2_gloves_dirty_OD {
        scope = 2;
        displayName = "BDU (ROC Police, Gloves/Dirty)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            "\CUP\Creatures\People\Military\CUP_Creatures_People_Military_Russia\data\oakley_co.paa"
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_pol_gloves_dirty";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_gloves : CUP_U_B_BDUv2_gloves_OD {
        scope = 2;
        displayName = "BDU (ROC, Gloves)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            "\CUP\Creatures\People\Military\CUP_Creatures_People_Military_Russia\data\oakley_co.paa"
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_gloves";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_pol_gloves : CUP_U_B_BDUv2_gloves_OD {
        scope = 2;
        displayName = "BDU (ROC Police, Gloves)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            "\CUP\Creatures\People\Military\CUP_Creatures_People_Military_Russia\data\oakley_co.paa"
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_pol_gloves";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2 : CUP_U_B_BDUv2_OD {
        scope = 2;
        displayName = "BDU (ROC)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa)
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_pol : CUP_U_B_BDUv2_OD {
        scope = 2;
        displayName = "BDU (ROC Police)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa)
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_pol";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_roll_dirty : CUP_U_B_BDUv2_roll_dirty_OD {
        scope = 2;
        displayName = "BDU (ROC, Rolled/Dirty)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa)
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_roll_dirty";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_pol_roll_dirty : CUP_U_B_BDUv2_roll_dirty_OD {
        scope = 2;
        displayName = "BDU (ROC Police, Rolled/Dirty)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa)
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_pol_roll_dirty";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_roll_gloves_dirty : CUP_U_B_BDUv2_roll_gloves_dirty_OD {
        scope = 2;
        displayName = "BDU (ROC, Rolled/Gloves/Dirty)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            "\CUP\Creatures\People\Military\CUP_Creatures_People_Military_Russia\data\oakley_co.paa"
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_roll_gloves_dirty";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_pol_roll_gloves_dirty : CUP_U_B_BDUv2_roll_gloves_dirty_OD {
        scope = 2;
        displayName = "BDU (ROC Police, Rolled/Gloves/Dirty)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            "\CUP\Creatures\People\Military\CUP_Creatures_People_Military_Russia\data\oakley_co.paa"
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_pol_roll_gloves_dirty";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_roll_gloves : CUP_U_B_BDUv2_roll_gloves_OD {
        scope = 2;
        displayName = "BDU (ROC, Rolled/Gloves)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            "\CUP\Creatures\People\Military\CUP_Creatures_People_Military_Russia\data\oakley_co.paa"
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_roll_gloves";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_pol_roll_gloves : CUP_U_B_BDUv2_roll_gloves_OD {
        scope = 2;
        displayName = "BDU (ROC Police, Rolled/Gloves)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            "\CUP\Creatures\People\Military\CUP_Creatures_People_Military_Russia\data\oakley_co.paa"
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_pol_roll_gloves";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_roll : CUP_U_B_BDUv2_roll_OD {
        scope = 2;
        displayName = "BDU (ROC, Rolled)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa)
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_roll";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_pol_roll : CUP_U_B_BDUv2_roll_OD {
        scope = 2;
        displayName = "BDU (ROC Police, Rolled)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa)
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_pol_roll";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_roll2_dirty : CUP_U_B_BDUv2_roll2_dirty_OD {
        scope = 2;
        displayName = "BDU (ROC, Rolled High/Dirty)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa)
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_roll2_dirty";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_pol_roll2_dirty : CUP_U_B_BDUv2_roll2_dirty_OD {
        scope = 2;
        displayName = "BDU (ROC Police, Rolled High/Dirty)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa)
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_pol_roll2_dirty";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_roll2_gloves_dirty : CUP_U_B_BDUv2_roll2_gloves_dirty_OD {
        scope = 2;
        displayName = "BDU (ROC, Rolled High/Gloves/Dirty)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            "\CUP\Creatures\People\Military\CUP_Creatures_People_Military_Russia\data\oakley_co.paa"
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_roll2_gloves_dirty";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_pol_roll2_gloves_dirty : CUP_U_B_BDUv2_roll2_gloves_dirty_OD {
        scope = 2;
        displayName = "BDU (ROC Police, Rolled High/Gloves/Dirty)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            "\CUP\Creatures\People\Military\CUP_Creatures_People_Military_Russia\data\oakley_co.paa"
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_pol_roll2_gloves_dirty";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_roll2_gloves : CUP_U_B_BDUv2_roll2_gloves_OD {
        scope = 2;
        displayName = "BDU (ROC, Rolled High/Gloves)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            "\CUP\Creatures\People\Military\CUP_Creatures_People_Military_Russia\data\oakley_co.paa"
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_roll2_gloves";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_pol_roll2_gloves : CUP_U_B_BDUv2_roll2_gloves_OD {
        scope = 2;
        displayName = "BDU (ROC Police, Rolled High/Gloves)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            "\CUP\Creatures\People\Military\CUP_Creatures_People_Military_Russia\data\oakley_co.paa"
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_pol_roll2_gloves";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_roll2 : CUP_U_B_BDUv2_roll2_OD {
        scope = 2;
        displayName = "BDU (ROC, Rolled High)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa)
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_roll2";
			containerClass="Supply60";
			mass=25;
		};
    };

    class CUP_ROC_U_B_BDUv2_pol_roll2 : CUP_U_B_BDUv2_roll2_OD {
        scope = 2;
        displayName = "BDU (ROC Police, Rolled High)";
        hiddenSelectionsTextures[] = {
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
            QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa)
        };
        class ItemInfo: UniformItem {
			uniformModel="-";
			uniformClass="CUP_ROC_B_Soldier_BDUv2_pol_roll2";
			containerClass="Supply60";
			mass=25;
		};
    };
};
