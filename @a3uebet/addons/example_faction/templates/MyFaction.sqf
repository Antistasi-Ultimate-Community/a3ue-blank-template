#include "..\script_component.hpp"
#pragma hemtt ignore_variables ["_fnc_createLoadoutData","_fnc_generateAndSaveUnitsToTemplate","_fnc_saveToTemplate"]

/* This example faction is basically a toned down variant of the vanilla FIA
 * faction template. Look in A3U's sources at
 * addons\core\Templates\Templates\**\*.sqf for further inspiration */

private _hasRF = "rf" in A3A_enabledDLC;
private _hasEF = "ef" in A3A_enabledDLC;

///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", LLSTRING(NameShort)] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_fia_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_FIA"] call _fnc_saveToTemplate;

private _vehiclesBasic = ["I_G_Quadbike_01_F"];
private _vehiclesLightUnarmed = ["I_G_Offroad_01_F"];
private _vehiclesLightArmed = ["I_G_Offroad_01_armed_F"];
private _vehiclesAt = ["I_G_Offroad_01_AT_F"];
private _VehTruck = ["I_G_Van_01_transport_F"];
private _vehicleAA = [];
private _vehiclesBoat = ["I_C_Boat_Transport_02_F" , "I_SDV_01_F" , "I_Boat_Armed_01_minigun_F" , "O_Boat_Armed_01_hmg_F"];
private _vehiclesMedical = [];
private _vehiclesSupply = ["C_Van_01_box_F"];
private _vehiclePlane = ["C_Plane_Civil_01_F","C_Plane_Civil_01_racing_F"];
private _vehicleCivPlane = ["C_Plane_Civil_01_F","C_Plane_Civil_01_racing_F"];
private _vehiclesCivCar = ["C_Offroad_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F"];
private _CivTruck = ["C_Truck_02_transport_F", "C_Truck_02_covered_F"];
private _civHelicopters = ["C_Heli_Light_01_civil_F", "a3a_C_Heli_Transport_02_F", "a3a_C_Heli_Light_02_blue_F"];

private _CivBoat = ["C_Boat_Civil_01_F", "C_Rubberboat"];

if (_hasEF) then {
    _vehiclesBoat pushBack "EF_B_CombatBoat_HMG_CTRG";
};

if (_hasRF) then {
    _vehiclesLightUnarmed append ["a3a_black_Pickup_mmg_rf", "a3u_black_Pickup_mmg_frame_rf", "a3u_black_Pickup_mmg_alt_rf"];
    _vehiclesLightArmed pushBack "a3u_black_Pickup_rival_rf";
    _vehiclesCivCar append ["C_Pickup_rf", "C_Pickup_covered_rf"];
    _civHelicopters append ["C_Heli_EC_01A_civ_RF", "C_Heli_EC_01_civ_RF"]
};

private _staticMG = ["I_G_HMG_02_high_F", "I_G_HMG_02_F"];
private _staticAT = ["I_static_AT_F"];
private _staticAA = ["I_static_AA_F"];
private _staticMortars = ["I_G_Mortar_01_F"];
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["minesAT", ["ATMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag"]] call _fnc_saveToTemplate;
["minesAPERS", ["ClaymoreDirectionalMine_Remote_Mag","APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"]] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

["vehiclesCivPlane", _vehicleCivPlane] call _fnc_saveToTemplate;
["vehiclesCivSupply", _vehiclesSupply] call _fnc_saveToTemplate;
["vehiclesMedical", _vehiclesMedical] call _fnc_saveToTemplate;
["vehiclesBoat", _vehiclesBoat] call _fnc_saveToTemplate;
["staticMortars", _staticMortars] call _fnc_saveToTemplate;
["staticMGs", _staticMG] call _fnc_saveToTemplate;
["staticAT", _staticAT] call _fnc_saveToTemplate;
["vehiclesCivHeli", _civHelicopters] call _fnc_saveToTemplate;
["vehiclesBasic", _vehiclesBasic] call _fnc_saveToTemplate;
["vehiclesPlane", _vehiclePlane] call _fnc_saveToTemplate;
["vehiclesCivTruck", _CivTruck] call _fnc_saveToTemplate;
["vehiclesTruck", _VehTruck] call _fnc_saveToTemplate;
["vehiclesCivBoat", _CivBoat] call _fnc_saveToTemplate;
["vehiclesAA", _vehicleAA] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;
["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _vehiclesLightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesAT", _vehiclesAt] call _fnc_saveToTemplate;

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////

// Texture variants for vehicles
["variants", [
    ["I_Heli_light_03_dynamicLoadout_F", ["Green", 1]],
    ["I_APC_Wheeled_03_cannon_F", ["Guerilla_01", 0.5, "Guerilla_02", 0.5, "Guerilla_03", 0.5, "Indep", 0, "Indep_03", 0, "Indep_02", 0]]
    // etc.
]] call _fnc_saveToTemplate;

// Vehicle costs
["attributesVehicles", [
    ["a3a_C_Heli_Transport_02_F", ["rebCost", 8000]],
    ["a3a_C_Heli_Light_02_blue_F", ["rebCost", 6500]]
    // etc.
]] call _fnc_saveToTemplate;

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

// Initial arsenal equipment. String only items are unlocked; array items
// are [className, initialCount].
private _initialRebelEquipment = [
    "hgun_Pistol_heavy_02_F", "hgun_PDW2000_F",
    "30Rnd_9x21_Mag", "30Rnd_9x21_Red_Mag", "6Rnd_45ACP_Cylinder",
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    ["launch_RPG32_F", 2], ["RPG32_F", 6]
];

_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "U_IG_Guerilla1_1",
    "U_IG_Guerilla2_1"
    // etc.
];

["headgear", [
    "H_Booniehat_khk_hs",
    "H_Booniehat_khk"
    // etc.
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", [
    "Male01GRE",
    "Male02GRE",
    "Male03GRE",
    "Male04GRE"
]] call _fnc_saveToTemplate;

["faces", [
    "GreekHead_A3_02",
    "GreekHead_A3_03",
    "GreekHead_A3_04"
    // etc.
]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["glasses", ["G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "G_Squares", "G_Squares_Tinted"]];
_loadoutData set ["goggles", []];
_loadoutData set ["facemask", ["G_Bandanna_blk", "G_Bandanna_oli", "G_Bandanna_khk", "G_Bandanna_tan", "G_Bandanna_beast", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_aviator"]];
_loadoutData set ["balaclavas", ["G_Balaclava_blk", "G_Balaclava_BlueStrips", "G_Balaclava_Flecktarn", "G_Balaclava_Halloween_01", "G_Balaclava_lowprofile", "G_Balaclava_oli", "G_Balaclava_Flames1", "G_Balaclava_Scarecrow_01", "G_Balaclava_Skull1", "G_Balaclava_Tropentarn"]];
_loadoutData set ["argoFacemask", ["G_Bandanna_BlueFlame1", "G_Bandanna_BlueFlame2", "G_Bandanna_CandySkull", "G_Bandanna_OrangeFlame1", "G_Bandanna_RedFlame1", "G_Bandanna_Skull1", "G_Bandanna_Syndikat1", "G_Bandanna_Syndikat2","G_Bandanna_Skull2", "G_Bandanna_Vampire_01"]];
_loadoutData set ["facewearWS", []];
_loadoutData set ["facewearContact", []];
_loadoutData set ["facewearLawsOfWar", []];
_loadoutData set ["facewearGM", []];
_loadoutData set ["facewearCLSA", []];
_loadoutData set ["facewearSOG", []];
_loadoutData set ["facewearSPE", []];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1, "balaclavas", 1, "argoFacemask", 1 , "facewearWS", 0.75, "facewearContact", 0.3, "facewearLawsOfWar", 0.5, "facewearGM", 0.3, "facewearCLSA", 0.2,"facewearSOG", 0.3,"facewearSPE", 0.2]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1, "balaclavas", 1, "argoFacemask", 1 , "facewearWS", 0.75, "facewearContact", 0.3, "facewearLawsOfWar", 0.5, "facewearGM", 0.3, "facewearCLSA", 0.2, "facewearSOG", 0.3,"facewearSPE", 0.2]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Petros", _squadLeaderTemplate],
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["staticCrew", _riflemanTemplate],
    ["Medic", _riflemanTemplate, [["medic", true]]],
    ["Engineer", _riflemanTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _riflemanTemplate],
    ["LAT", _riflemanTemplate],
    ["AT", _riflemanTemplate],
    ["AA", _riflemanTemplate],
    ["MachineGunner", _riflemanTemplate],
    ["Marksman", _riflemanTemplate],
    ["Sniper", _riflemanTemplate],
    ["Unarmed", _riflemanTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
