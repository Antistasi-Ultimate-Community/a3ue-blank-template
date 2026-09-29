#pragma hemtt ignore_variables ["_fnc_saveToTemplate"]

// Note: vehicle attributes files for enemy factions are used to modify the default cost and threat of vehicles
//
//      Cost is roughly how much it costs the enemy faction to deploy this type of asset. Vehicles generally have a standardized cost depending on what type of vehicle they are;
//            for example, a tank will cost more than an APC, which will cost more than a jeep, etc.
//            However, sometimes certain vehicles cost needs to be adjusted for balance reasons;
//            for example, a hilux truck with ZU-23 may be added to the vehiclesAA array along with a ZSU-23-4 Shilka. Even though the Hilux mounts the same weapon,
//                  it is significantly less armored and less capable off road, so it should cost less than the "standard" AA vehicle cost.
//
//      Threat refers to how "dangerous" the vehicle is to other factions. Given the same example, the hilux should have a lower threat value due to its lesser armor and mobility.
//
//      See A3A\addons\core\functions\init\fn_initVarServer.sqf for more details and default values.
//
//      The rest of this file is just an example of how a vehicles atrributes file should be structured.
//      Note that this content *does not* have to be in a separate file #include'd in the faction template file; if it is sufficiently succinct,
//            the "attributesVehicles" array could be defined directly within the faction template file itself.

["attributesVehicles", [
    // Attack helis with only fixed miniguns (cost is set lower because they don't have rockets or other heavy armament)
    ["O_Heli_Light_02_dynamicLoadout_F", ["cost", 100]],
    ["O_Heli_Light_02_F", ["cost", 100]],
    ["B_Heli_Light_01_armed_F", ["cost", 100]],
    ["B_Heli_Light_01_dynamicLoadout_F", ["cost", 100]],
    ["I_E_Heli_light_03_dynamicLoadout_F", ["cost", 100]],

    // IFVs with bonus armour (cost is set higher because they are more resilient and capable on the battlefield)
    ["CUP_B_FV510_GB_D_SLAT", ["cost", 170]],
    ["CUP_B_FV510_GB_W_SLAT", ["cost", 170]],
    ["CUP_B_MCV80_GB_D_SLAT", ["cost", 170]],
    ["CUP_B_MCV80_GB_W_SLAT", ["cost", 170]],
    ["CUP_B_M2A3Bradley_USA_D", ["cost", 180], ["threat", 230]],
    ["CUP_B_M2A3Bradley_USA_W", ["cost", 180], ["threat", 230]],        // also has TOW

    // Tank destroyer strykers, not tough (threat is set lower because they have heavy armament but weak armor)
    ["CUP_B_M1128_MGS_Woodland", ["cost", 120], ["threat", 180]],
    ["CUP_B_M1128_MGS_Desert", ["cost", 120], ["threat", 180]]
]] call _fnc_saveToTemplate;
