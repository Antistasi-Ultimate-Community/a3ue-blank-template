class CfgVehicles {
    class CUP_CRYE_TAN_Full;
    class CUP_CRYE_TAN_Roll;
    
    class CUP_ROC_Crye_Full: CUP_CRYE_TAN_Full {
        scope = 1;
        uniformClass = "CUP_ROC_U_CRYE_Full";
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(templates\CUP_ROC\data\crye_g3_roc_dig_co.paa)};
    };
    class CUP_ROC_Crye_Full_RGR_Top : CUP_ROC_Crye_Full {
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(templates\CUP_ROC\data\crye_g3_roc_dig_rgr_top_co.paa)};
    };
    class CUP_ROC_Crye_Full_RGR_Bottom : CUP_ROC_Crye_Full {
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(templates\CUP_ROC\data\crye_g3_roc_dig_rgr_bottom_co.paa)};
    };
    class CUP_ROC_Crye_Roll: CUP_CRYE_TAN_Roll {
        scope = 1;
        uniformClass = "CUP_ROC_U_CRYE_Roll";
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(templates\CUP_ROC\data\crye_g3_roc_dig_co.paa)};
    };
    class CUP_ROC_Crye_Roll_RGR_Top : CUP_ROC_Crye_Roll {
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(templates\CUP_ROC\data\crye_g3_roc_dig_rgr_top_co.paa)};
    };
    class CUP_ROC_Crye_Roll_RGR_Bottom : CUP_ROC_Crye_Roll {
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(templates\CUP_ROC\data\crye_g3_roc_dig_rgr_bottom_co.paa)};
    };

    class CUP_B_USArmy_Soldier_BDUv2_OD;
    class CUP_B_USArmy_Soldier_BDUv2_dirty_OD;
    class CUP_B_USArmy_Soldier_BDUv2_roll_OD;
    class CUP_B_USArmy_Soldier_BDUv2_roll_dirty_OD;
    class CUP_B_USArmy_Soldier_BDUv2_roll2_OD;
    class CUP_B_USArmy_Soldier_BDUv2_roll2_dirty_OD;
    class CUP_B_USArmy_Soldier_BDUv2_gloves_OD;
    class CUP_B_USArmy_Soldier_BDUv2_gloves_dirty_OD;
    //class CUP_B_USArmy_Soldier_BDUv2_roll_gloves_OD;
    //class CUP_B_USArmy_Soldier_BDUv2_roll_gloves_dirty_OD;
    //class CUP_B_USArmy_Soldier_BDUv2_roll2_gloves_OD;
    //class CUP_B_USArmy_Soldier_BDUv2_roll2_gloves_dirty_OD;
    
    class CUP_ROC_B_Soldier_BDUv2 : CUP_B_USArmy_Soldier_BDUv2_OD {
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2";
		hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa)
		};
	};
    class CUP_ROC_B_Soldier_BDUv2_pol : CUP_B_USArmy_Soldier_BDUv2_OD {
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_pol";
		hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa)
		};
	};
	class CUP_ROC_B_Soldier_BDUv2_dirty : CUP_B_USArmy_Soldier_BDUv2_dirty_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_dirty";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa)
		};
	};
    class CUP_ROC_B_Soldier_BDUv2_pol_dirty : CUP_B_USArmy_Soldier_BDUv2_dirty_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_pol_dirty";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa)
		};
	};
	class CUP_ROC_B_Soldier_BDUv2_roll : CUP_B_USArmy_Soldier_BDUv2_roll_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_roll";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa)
		};
	};
    class CUP_ROC_B_Soldier_BDUv2_pol_roll : CUP_B_USArmy_Soldier_BDUv2_roll_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_pol_roll";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa)
		};
	};
	class CUP_ROC_B_Soldier_BDUv2_roll_dirty : CUP_B_USArmy_Soldier_BDUv2_roll_dirty_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_roll_dirty";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa)
		};
	};
    class CUP_ROC_B_Soldier_BDUv2_pol_roll_dirty : CUP_B_USArmy_Soldier_BDUv2_roll_dirty_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_pol_roll_dirty";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa)
		};
	};
	class CUP_ROC_B_Soldier_BDUv2_roll2 : CUP_B_USArmy_Soldier_BDUv2_roll2_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_roll2";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa)
		};
	};
    class CUP_ROC_B_Soldier_BDUv2_pol_roll2 : CUP_B_USArmy_Soldier_BDUv2_roll2_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_pol_roll2";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa)
		};
	};
	class CUP_ROC_B_Soldier_BDUv2_roll2_dirty : CUP_B_USArmy_Soldier_BDUv2_roll2_dirty_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_roll2_dirty";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa)
		};
	};
    class CUP_ROC_B_Soldier_BDUv2_pol_roll2_dirty : CUP_B_USArmy_Soldier_BDUv2_roll2_dirty_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_pol_roll2_dirty";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa)
		};
	};
	class CUP_ROC_B_Soldier_BDUv2_gloves: CUP_B_USArmy_Soldier_BDUv2_gloves_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_gloves";
		hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			"\CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\fs_oakley_glove_green_co.paa"
		};
	};
	class CUP_ROC_B_Soldier_BDUv2_pol_gloves: CUP_B_USArmy_Soldier_BDUv2_gloves_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_pol_gloves";
		hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			"\CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\fs_oakley_glove_green_co.paa"
		};
	};
	class CUP_ROC_B_Soldier_BDUv2_gloves_dirty: CUP_B_USArmy_Soldier_BDUv2_gloves_dirty_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_gloves_dirty";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			"\CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\fs_oakley_glove_green_co.paa"
		};
	};
    class CUP_ROC_B_Soldier_BDUv2_pol_gloves_dirty: CUP_B_USArmy_Soldier_BDUv2_gloves_dirty_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_pol_gloves_dirty";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			"\CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\fs_oakley_glove_green_co.paa"
		};
	};
	class CUP_ROC_B_Soldier_BDUv2_roll_gloves: CUP_B_USArmy_Soldier_BDUv2_gloves_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_roll_gloves";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			"\CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\fs_oakley_glove_green_co.paa"
		};
	};
    class CUP_ROC_B_Soldier_BDUv2_pol_roll_gloves: CUP_B_USArmy_Soldier_BDUv2_gloves_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_pol_roll_gloves";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			"\CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\fs_oakley_glove_green_co.paa"
		};
	};
	class CUP_ROC_B_Soldier_BDUv2_roll_gloves_dirty: CUP_B_USArmy_Soldier_BDUv2_gloves_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_roll_gloves_dirty";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			"\CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\fs_oakley_glove_green_co.paa"
		};
	};
    class CUP_ROC_B_Soldier_BDUv2_pol_roll_gloves_dirty: CUP_B_USArmy_Soldier_BDUv2_gloves_OD
    {
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_pol_roll_gloves_dirty";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			"\CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\fs_oakley_glove_green_co.paa"
		};
	};
	class CUP_ROC_B_Soldier_BDUv2_roll2_gloves: CUP_B_USArmy_Soldier_BDUv2_gloves_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_roll2_gloves";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			"\CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\fs_oakley_glove_green_co.paa"
		};
	};
    class CUP_ROC_B_Soldier_BDUv2_pol_roll2_gloves: CUP_B_USArmy_Soldier_BDUv2_gloves_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_pol_roll2_gloves";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			"\CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\fs_oakley_glove_green_co.paa"
		};
	};
	class CUP_ROC_B_Soldier_BDUv2_roll2_gloves_dirty: CUP_B_USArmy_Soldier_BDUv2_gloves_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_roll2_gloves_dirty";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_co.paa),
			"\CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\fs_oakley_glove_green_co.paa"
		};
	};
    class CUP_ROC_B_Soldier_BDUv2_pol_roll2_gloves_dirty: CUP_B_USArmy_Soldier_BDUv2_gloves_OD
	{
        scope = 1;
		uniformClass = "CUP_ROC_U_B_BDUv2_pol_roll2_gloves_dirty";
        hiddenSelectionsTextures[] = {
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			QPATHTOFOLDER(templates\CUP_ROC\data\BDUv2_roc_dig_pol_co.paa),
			"\CUP\Creatures\People\Military\CUP_Creatures_People_Military_USMC\data\fs_oakley_glove_green_co.paa"
		};
	};
};
