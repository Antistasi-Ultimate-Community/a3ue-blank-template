#include "..\..\script_component.hpp"
#pragma hemtt ignore_variables ["_mmItems","_fnc_saveNames","_fnc_createLoadoutData","_fnc_copyLoadoutData","_fnc_generateAndSaveUnitsToTemplate","_fnc_saveToTemplate"]

//////////////////////////
//   DLC / Mod Content  //
//////////////////////////

private _hasQAVMarshall = isClass (configFile >> "CfgPatches" >> "qav_marshall"); // QAV Marshall mod is loaded
private _hasQAVMV35 = isClass (configFile >> "CfgPatches" >> "QAV_MV35"); // QAV MV35 mod is loaded
private _hasCUPVE = isClass (configFile >> "CfgPatches" >> "CDF_Ext_Core"); // CUP Vehicle Extension mod is loaded





//////////////////////////
//   Side Information   //
//////////////////////////

["name", "ROCA"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "ROCA"]] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "Flex_CUP_ROC_Faction\Data\Flag\ROC_Flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_ROC"] call _fnc_saveToTemplate;





//////////////////////////
//       Vehicles       //
//////////////////////////

// General equipment
private _ammobox = "B_supplyCrate_F";
private _surrenderCrate = "Box_IND_Wps_F";
private _equipmentBox = "Box_NATO_Equip_F";

// Ground vehicles
private _vehiclesBasic = ["Flex_CUP_ROC_Quadbike"];
private _vehiclesLightUnarmed = ["Flex_CUP_ROC_nM1025_Unarmed", "Flex_CUP_ROC_nM1038", "Flex_CUP_ROC_nM1038_4s", "Flex_CUP_ROC_Offroad_01_comms", "Flex_CUP_ROC_Offroad_01_covered"];
private _vehiclesLightArmed = ["Flex_CUP_ROC_nM1025_M2", "Flex_CUP_ROC_nM1025_M240", "Flex_CUP_ROC_nM1025_Mk19", "Flex_CUP_ROC_nM1036_TOW"];
private _vehiclesTrucks = ["Flex_CUP_ROC_MTVR"];
private _vehiclesCargoTrucks = ["Flex_CUP_ROC_MTVR", "Flex_CUP_ROC_MTVR", "Flex_CUP_ROC_MTVR", "Flex_CUP_ROC_nM1038", "Flex_CUP_ROC_nM1038_4s"];
private _vehiclesAmmoTrucks = ["Flex_CUP_ROC_nM1038_Ammo", "Flex_CUP_ROC_MTVR_Ammo", "Flex_CUP_ROC_M113A3_Reammo"];
private _vehiclesRepairTrucks = ["Flex_CUP_ROC_nM1038_Repair", "Flex_CUP_ROC_MTVR_Repair", "Flex_CUP_ROC_M113A3_Repair"];
private _vehiclesFuelTrucks = ["Flex_CUP_ROC_MTVR_Fuel"];
private _vehiclesMedical = ["Flex_CUP_ROC_M113A3_Med"];

// Armored vehicles
private _vehiclesLightAPCs = ["Flex_CUP_ROC_AAV_Unarmed", "Flex_CUP_ROC_M113A3_HQ"];
private _vehiclesAPCs = ["Flex_CUP_ROC_AAV", "Flex_CUP_ROC_M113A3"];
private _vehiclesIFVs = [];
private _vehiclesLightTanks = ["Flex_CUP_ROC_M60A3"];
private _vehiclesTanks = ["Flex_CUP_ROC_M1A1SA"];

if (_hasQAVMarshall) then {
    _vehiclesAPCs pushBack "Flex_CUP_ROC_APC_Wheeled_02"; // CM32
    _vehiclesIFVs pushBack "Flex_CUP_ROC_APC_Wheeled_01"; // CM34
};

// Miscellaneous ground vehicles
private _vehiclesArtillery = ["CUP_B_M270_DPICM_USA", "CUP_B_M270_HE_USA"];
private _artilleryMagazines = createHashMapFromArray [
    ["CUP_B_M270_DPICM_USA", ["CUP_12Rnd_MLRS_DPICM"]],
    ["CUP_B_M270_HE_USA", ["CUP_12Rnd_MLRS_HE"]]
];
private _vehiclesAA = ["Flex_CUP_ROC_nM1097_AVENGER"];

// Air vehicles
private _vehiclesHelisLight = [];
private _vehiclesHelisLightAttack = [];
private _vehiclesHelisTransport = ["Flex_CUP_ROC_CH-47F", "Flex_CUP_ROC_UH60S_Armed", "Flex_CUP_ROC_UH60S_Unarmed"];
private _vehiclesHelisAttack = ["Flex_CUP_ROC_AH1Z_Dynamic", "Flex_CUP_ROC_AH64"];
private _vehiclesPlanesTransport = ["Flex_CUP_ROC_C130J"];
private _vehiclesPlanesCAS = ["Flex_CUP_ROC_Fighter"];
private _vehiclesPlanesAA = ["Flex_CUP_ROC_F16A"];
private _vehiclesPlanesGunship = [];
private _uavsPortable = ["Flex_CUP_ROC_UAV_06", "Flex_CUP_ROC_UAV_01"];
private _uavsAttack = [];

// Naval vehicles
private _vehiclesTransportBoats = ["Flex_CUP_ROC_Boat_Transport", "Flex_CUP_ROC_RHIB"];
private _vehiclesGunBoats = ["Flex_CUP_ROC_RHIB", "Flex_CUP_ROC_RHIB2Turret", "Flex_CUP_ROC_Frigate"];
private _vehiclesSDV = [];

// Static and special weapons
private _staticMortars = ["Flex_CUP_ROC_Mortar"];
private _mortarMagazineHE = "8Rnd_82mm_Mo_shells";
private _mortarMagazineSmoke = "8Rnd_82mm_Mo_Smoke_white";
private _mortarMagazineFlare = "8Rnd_82mm_Mo_Flare_white";
private _staticHowitzers = ["Flex_CUP_ROC_M119"];
private _howitzerMagazineHE = "CUP_30Rnd_105mmHE_M119_M";
private _staticAA = ["Flex_CUP_ROC_Stinger_AA_pod"];
private _staticMGs = ["Flex_CUP_ROC_HMG_high"];
private _staticAT = ["Flex_CUP_ROC_TOW2_TriPod"];
private _vehicleRadar = "Flex_CUP_ROC_Radar_System";
private _vehicleSAM = "Flex_CUP_ROC_SAM_System";
private _minefieldAT = ["CUP_Mine"];
private _minefieldAPERS = ["APERSMine"];

// Militia vehicles
private _vehiclesMilitiaCars = ["CUP_I_M151_SYND"];
private _vehiclesMilitiaLightArmed = ["CUP_I_M151_M2_SYND"];
private _vehiclesMilitiaTrucks = ["CUP_I_M151_SYND"];
private _vehiclesMilitiaAPCs = [];

// Police vehicles
private _vehiclesPolice = ["C_Offroad_01_comms_F", "C_Offroad_01_covered_F", "C_Van_02_transport_F"];

// Special usage vehicles
private _vehiclesAirPatrol = ["Flex_CUP_ROC_UH60S_Armed", "Flex_CUP_ROC_UH60S_Armed_FFV"];
private _vehiclesAirborne = [
    "Flex_CUP_ROC_M113A3",
    "Flex_CUP_ROC_M113A3_HQ",
    "Flex_CUP_ROC_APC_Wheeled_01",
    "Flex_CUP_ROC_APC_Wheeled_02"
];
private _vehiclesAmphibious = [
    "Flex_CUP_ROC_AAV_Unarmed",
    "Flex_CUP_ROC_AAV",
    "Flex_CUP_ROC_M113A3",
    "Flex_CUP_ROC_M113A3_HQ"
];

["animations", [
    ["C_Offroad_01_F", ["HideDoor1",0,"HideDoor2",0,"HideDoor3",0,"HideBackpacks",1,"HideBumper1",0,"HideBumper2",1,"HideConstruction",1,"hidePolice",0,"HideServices",1,"BeaconsStart",1,"BeaconsServicesStart",0]],
    ["C_Offroad_01_comms_F", ["hidePolice",0,"HideServices",1,"HideCover",0,"StartBeaconLight",0,"HideRoofRack",1,"HideLoudSpeakers",0,"HideAntennas",1,"HideBeacon",0,"HideSpotlight",0,"HideDoor3",0,"OpenDoor3",0,"HideDoor1",0,"HideDoor2",0,"HideBackpacks",1,"HideBumper1",0,"HideBumper2",1,"HideConstruction",0,"BeaconsStart",1]],
    ["C_Van_02_transport_F", ["Door_1_source",0,"Door_2_source",0,"Door_3_source",0,"Door_4_source",0,"Hide_Door_1_source",0,"Hide_Door_2_source",0,"Hide_Door_3_source",0,"Hide_Door_4_source",0,"lights_em_hide",1,"ladder_hide",1,"spare_tyre_holder_hide",0,"spare_tyre_hide",0,"reflective_tape_hide",1,"roof_rack_hide",1,"LED_lights_hide",0,"sidesteps_hide",0,"rearsteps_hide",0,"side_protective_frame_hide",1,"front_protective_frame_hide",1,"beacon_front_hide",0,"beacon_rear_hide",0]]
]] call _fnc_saveToTemplate;

["variants", [
    ["C_Offroad_01_F", ["White",1]],
    ["C_Offroad_01_comms_F", ["Black",1]],
    ["C_Van_02_transport_F", ["Black",0.5, "White", 0.5]],
    ["CUP_B_M270_DPICM_USA", ["USMC", 1]],
    ["CUP_B_M270_HE_USA", ["USMC", 1]]
]] call _fnc_saveToTemplate;

#include "..\Definitions\Vehicles_SaveToTemplate.sqf"





/////////////////////
///  Identities   ///
/////////////////////

private _faces = ["AsianHead_A3_01", "AsianHead_A3_02", "AsianHead_A3_03", "AsianHead_A3_04", "AsianHead_A3_05", "AsianHead_A3_06", "AsianHead_A3_07"];
private _eliteFaces = _faces + ["CamoHead_Asian_01_F", "CamoHead_Asian_02_F", "CamoHead_Asian_03_F"];
private _sfFaces = ["CamoHead_Asian_01_F", "CamoHead_Asian_02_F", "CamoHead_Asian_03_F"];

private _voices = ["Male01CHI", "Male02CHI", "Male03CHI"];

private _insignia = [""];

["faces", _faces] call _fnc_saveToTemplate;
["eliteFaces", _eliteFaces] call _fnc_saveToTemplate;
["sfFaces", _sfFaces] call _fnc_saveToTemplate;
["voices", _voices] call _fnc_saveToTemplate;
["insignia", _insignia] call _fnc_saveToTemplate;

"ChineseMen" call _fnc_saveNames;





//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData; // create the initial, default faction loadout data hashmap

// Basic Equipment
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_PVS14"]];

_loadoutData set ["traitorUniforms", []]; // TODO uniforms used by traitor units
_loadoutData set ["traitorVests", []]; // TODO vests used by traitor units
_loadoutData set ["traitorHats", []]; // TODO hats used by traitor units

_loadoutData set ["officerUniforms", []];
_loadoutData set ["officerVests", []];
_loadoutData set ["officerHats", []];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];
_loadoutData set ["cloakHats", []];

_loadoutData set ["uniforms", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["engVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", []];
_loadoutData set ["sniHats", []];
_loadoutData set ["glasses", ["CUP_G_Oakleys_Drk"]];
_loadoutData set ["goggles", ["CUP_G_ESS_RGR_Dark"]];

// Item sets
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

// Unit-specific items
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
// TODO private _mmItems = ["SpecialSniperEquipment"];

if (A3A_hasACE) then { // note how these items are added to the unit-specific extras arrays, only if ACE mod is loaded
	_slItems append ["ACE_microDAGR", "ACE_DAGR"];
	_eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
	_mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadLeader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

// Weapons
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["sidearms", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["lightATLaunchers", ["CUP_launch_M72A6"]];
_loadoutData set ["ATLaunchers", ["CUP_launch_M136"]];
_loadoutData set ["missileATLaunchers", ["CUP_launch_APILAS"]];
_loadoutData set ["missileAALaunchers", ["CUP_launch_FIM92Stinger"]];
_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_M67"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalSmokeGrenades", ["SmokeShellRed", "SmokeShellGreen", "SmokeShellBlue", "SmokeShellYellow", "SmokeShellOrange", "SmokeShellPurple", "SmokeShellYellow"]];
_loadoutData set ["ATMines", ["ATMine_Range_Mag", "CUP_Mine_M"]];
_loadoutData set ["APMines", ["APERSBoundingMine_Range_Mag", "APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];





////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_militiaLoadoutData set ["uniforms", [
    "CUP_U_B_BDUv2_ERDL_highland",
    "CUP_U_B_BDUv2_dirty_ERDL_highland",
    "CUP_U_B_BDUv2_gloves_ERDL_highland",
    "CUP_U_B_BDUv2_gloves_dirty_ERDL_highland",
    "CUP_U_B_BDUv2_roll2_ERDL_highland",
    "CUP_U_B_BDUv2_roll2_dirty_ERDL_highland",
    "CUP_U_B_BDUv2_roll2_gloves_ERDL_highland",
    "CUP_U_B_BDUv2_roll2_gloves_dirty_ERDL_highland",
    "CUP_U_B_BDUv2_roll_ERDL_highland",
    "CUP_U_B_BDUv2_roll_dirty_ERDL_highland",
    "CUP_U_B_BDUv2_roll_gloves_ERDL_highland",
    "CUP_U_B_BDUv2_roll_gloves_dirty_ERDL_highland"
]];
_militiaLoadoutData set ["slVests", ["CUP_V_B_RRV_TL", "CUP_V_B_RRV_Scout3_GRN"]];
_militiaLoadoutData set ["vests", ["CUP_V_B_Interceptor_Base_Olive", "CUP_V_B_Interceptor_Rifleman_Olive", "CUP_V_B_PASGT_OD", "CUP_V_B_PASGT_no_bags_OD", "CUP_V_B_RRV_Scout"]];
_militiaLoadoutData set ["glVests", ["CUP_V_B_Interceptor_Grenadier_Olive", "CUP_V_B_RRV_Scout2"]];
_militiaLoadoutData set ["medVests", ["CUP_V_B_RRV_Medic"]];
_militiaLoadoutData set ["mgVests", ["CUP_V_B_RRV_MG_GRN"]];
_militiaLoadoutData set ["sniVests", ["CUP_V_B_RRV_Light"]];
_militiaLoadoutData set ["officerVests", ["CUP_V_B_RRV_Officer"]];
_militiaLoadoutData set ["backpacks", ["CUP_B_AlicePack_OD"]];
_militiaLoadoutData set ["helmets", ["CUP_H_PASGTv2_ERDL_highland", "CUP_H_PASGTv2_NVG_ERDL_highland", "CUP_H_PASGTv2_OD", "CUP_H_USArmy_Helmet_M1_plain_Olive"]];
_militiaLoadoutData set ["slHat", ["CUP_H_US_patrol_cap_ERDL_highland"]];
_militiaLoadoutData set ["sniHats", ["H_Booniehat_oli"]];
_militiaLoadoutData set ["NVGs", ["CUP_NVG_PVS7"]];

_militiaLoadoutData set ["sidearms", [
    ["CUP_hgun_Colt1911", "", "", "", [], [], ""], 2,
    ["CUP_hgun_SWM327MP", "", "", "", [], [], ""], 1,
    ["CUP_hgun_M9", "", "", "", [], [], ""], 1
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_UZI", "", "", "", [], [], ""], 3,
    ["CUP_smg_M3A1", "", "", "", [], [], ""], 1
]];
_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_M16A1", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""], 2,
    ["CUP_arifle_M16A2", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""], 2,
    ["CUP_srifle_M14", "", "", "", ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR"], [], ""], 1
]];
_militiaLoadoutData set ["carbines", [
    ["CUP_arifle_Colt727", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M16A1GL", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""], 2,
    ["CUP_arifle_M16A2GL", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""], 2,
    ["CUP_glaunch_M79", "", "", "", ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], [], ""], 1
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_lmg_M240_norail", "", "", "", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""], 1,
    ["CUP_lmg_M249_E2", "", "", "", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""], 2
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_M14", "", "", "", ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR"], [], ""], 1,
    ["CUP_srifle_M14", "", "", "CUP_optic_Aimpoint_5000", ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR"], [], ""], 1,
    ["CUP_srifle_M14", "", "", "optic_KHS_old", ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR"], [], ""], 3
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldMk4_10x40_LRT_Woodland", [], [], "CUP_bipod_Harris_1A2_L"],
    ["CUP_srifle_M24_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_Harris_1A2_L"]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // create a copy of the base loadout data for military-specific modifications

_militaryLoadoutData set ["uniforms", [
    "CUP_ROC_U_B_BDUv2_dirty",
    "CUP_ROC_U_B_BDUv2_gloves_dirty",
    "CUP_ROC_U_B_BDUv2_gloves",
    "CUP_ROC_U_B_BDUv2",
    "CUP_ROC_U_B_BDUv2_roll_dirty",
    "CUP_ROC_U_B_BDUv2_roll_gloves_dirty",
    "CUP_ROC_U_B_BDUv2_roll_gloves",
    "CUP_ROC_U_B_BDUv2_roll",
    "CUP_ROC_U_B_BDUv2_roll2_dirty",
    "CUP_ROC_U_B_BDUv2_roll2_gloves_dirty",
    "CUP_ROC_U_B_BDUv2_roll2_gloves",
    "CUP_ROC_U_B_BDUv2_roll2"
]];
_militaryLoadoutData set ["medVests", ["CUP_V_B_CIRAS_Olive"]];
_militaryLoadoutData set ["slVests", ["CUP_V_PMC_CIRAS_OD_TL"]];
_militaryLoadoutData set ["sniVests", ["CUP_V_PMC_CIRAS_OD_Empty"]];
_militaryLoadoutData set ["glVests", ["CUP_V_PMC_CIRAS_OD_Grenadier"]];
_militaryLoadoutData set ["engVests", ["CUP_V_PMC_CIRAS_OD_Veh"]];
_militaryLoadoutData set ["vests", ["CUP_V_PMC_CIRAS_OD_Patrol"]];
_militaryLoadoutData set ["backpacks", ["B_AssaultPack_rgr"]];
_militaryLoadoutData set ["longRangeRadios", ["B_RadioBag_01_black_F", "Flex_CUP_ROC_Radio_Backpack"]];
_militaryLoadoutData set ["atBackpacks", ["B_Kitbag_rgr"]];
_militaryLoadoutData set ["slBackpacks", ["B_Kitbag_rgr"]];
_militaryLoadoutData set ["helmets", ["Flex_CUP_ROC_Helmet_02", "Flex_CUP_ROC_Helmet_02_Nohs", "Flex_CUP_ROC_Helmet_01_Nohs", "Flex_CUP_ROC_Helmet_01"]];
_militaryLoadoutData set ["slHat", ["Flex_CUP_ROC_Helmet_02_TL"]];
_militaryLoadoutData set ["sniHats", ["Flex_CUP_ROC_Boonie_Wood", "Flex_CUP_ROC_Boonie_Wood_hs"]];
_militaryLoadoutData set ["NVGs", ["CUP_NVG_PVS14"]];

private _opticsClose = ["CUP_optic_MicroT1", 3, "CUP_optic_HoloBlack", 1, "CUP_optic_VortexRazor_UH1_Black", 1, "", 5];
private _opticsMid = ["CUP_optic_AIMM_MICROT1_BLK", 1, "CUP_optic_ACOG2", 2, "CUP_optic_ACOG_TA31_KF", 2, "", 5];

_militaryLoadoutData set ["sidearms", [
    ["CUP_hgun_M9A1", "", "", "", [], [], ""], 4,
    ["CUP_hgun_Glock17_blk", "", "", "", [], [], ""], 1
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_UZI", "", "", "", [], [], ""], 2,
    ["CUP_smg_MP5A5", "", "", _opticsClose, [], [], ""], 2,
    ["CUP_smg_MP5A5_Rail", "", "", _opticsClose, [], [], ""], 1
]];
_militaryLoadoutData set ["shotguns", [
    ["CUP_sgun_SPAS12", "", "", "", [], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["Flex_CUP_ROC_ARifle_T91_blk", "", "", _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 3,
    ["CUP_arifle_M4A1_MOE_black", "", "", _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1,
    ["CUP_arifle_M4A1_standard_black", "", "", _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1
]];
_militaryLoadoutData set ["slRifles", [
    ["Flex_CUP_ROC_ARifle_T91_blk", "", "", _opticsMid, ["CUP_30Rnd_556x45_Stanag"], [], ""], 3,
    ["CUP_arifle_M4A1_MOE_black", "", "", _opticsMid, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1,
    ["CUP_arifle_M4A1_standard_black", "", "", _opticsMid, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1
]];
_militaryLoadoutData set ["carbines", [
    ["CUP_arifle_M4A1_MOE_short_black", "", "", _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1,
    ["CUP_arifle_M4A1_standard_short_black", "", "", _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 2
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M4A1_BUIS_GL", "", "", _opticsClose, ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_M240_B", "", "", ["CUP_optic_ACOG_TA648_308_black", 2, "CUP_optic_ElcanM145", 2, "CUP_optic_CWS", 1, "", 5], ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""], 1,
    ["CUP_lmg_m249_pip1", "", "", _opticsMid, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""], 2,
    ["CUP_mg_m249_pip2", "", "", _opticsMid, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""], 1
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_Mk18_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR"], [], "CUP_bipod_Harris_1A2_L_BLK"], 2,
    ["CUP_srifle_Mk18_blk", "", "", _opticsMid, ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR"], [], ""], 2,
    ["CUP_srifle_RSASS_Black", "", "", ["CUP_optic_LeupoldMk4", 3, "CUP_optic_Leupold_VX3", 1], ["CUP_20Rnd_762x51_L129_M"], [], "CUP_bipod_VLTOR_Modpod_black"], 1
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldMk4_10x40_LRT_Woodland", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_Harris_1A2_L"],
    ["CUP_srifle_M24_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_Harris_1A2_L"],
    ["CUP_srifle_M2010_blk", "", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_Harris_1A2_L_BLK"],
    ["CUP_srifle_M2010_ctrgt", "", "", "CUP_optic_LeupoldMk4_25x50_LRT_WOODLAND", ["CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_Harris_1A2_L_BLK"]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;

_eliteLoadoutData set ["uniforms", [
    "CUP_ROC_U_CRYE_Full",
    "CUP_ROC_U_CRYE_Full_RGR_Top",
    "CUP_ROC_U_CRYE_Full_RGR_Bottom",
    "CUP_ROC_U_CRYE_Roll",
    "CUP_ROC_U_CRYE_Roll_RGR_Top",
    "CUP_ROC_U_CRYE_Roll_RGR_Bottom"
]];
_eliteLoadoutData set ["medVests", ["CUP_ROC_V_CPC_medical", "CUP_ROC_V_CPC_medicalbelt"]];
_eliteLoadoutData set ["slVests", ["CUP_ROC_V_CPC_communications", "CUP_ROC_V_CPC_communicationsbelt"]];
_eliteLoadoutData set ["sniVests", ["CUP_ROC_V_CPC_light", "CUP_ROC_V_CPC_lightbelt"]];
_eliteLoadoutData set ["glVests", ["CUP_ROC_V_CPC_weapons", "CUP_ROC_V_CPC_weaponsbelt"]];
_eliteLoadoutData set ["engVests", ["CUP_ROC_V_CPC_tl", "CUP_ROC_V_CPC_tlbelt"]];
_eliteLoadoutData set ["vests", ["Flex_CUP_ROC_V_AVSCarrier_Belt", "Flex_CUP_ROC_V_AVSCarrier_Lite", "CUP_ROC_V_CPC_Fast", "CUP_ROC_V_CPC_Fastbelt"]];
_eliteLoadoutData set ["backpacks", ["Flex_CUP_ROC_Backpack_Compact"]];
_eliteLoadoutData set ["longRangeRadios", ["Flex_CUP_ROC_Radio_Backpack"]];
_eliteLoadoutData set ["atBackpacks", ["Flex_CUP_ROC_Kitbag"]];
_eliteLoadoutData set ["slBackpacks", ["Flex_CUP_ROC_Kitbag"]];
_eliteLoadoutData set ["helmets", [
    "Flex_CUP_ROC_H_Opscore_NoHS",
    "Flex_CUP_ROC_H_Opscore_Cover_NoHS",
    "Flex_CUP_ROC_H_Opscore_CoverCamo",
    "Flex_CUP_ROC_H_Opscore_Cover",
    "Flex_CUP_ROC_H_Opscore"
]];
_eliteLoadoutData set ["slHat", ["Flex_CUP_ROC_H_Opscore_CoverSpec"]];
_eliteLoadoutData set ["NVGs", ["CUP_NVG_PVS15_black"]];
_eliteLoadoutData set ["goggles", ["Flex_CUP_ROC_Balaclava_Alt_Camo", "Flex_CUP_ROC_Balaclava_Alt_1_Camo"]];
_eliteLoadoutData set ["glasses", ["Flex_CUP_ROC_Balaclava_Alt_Olive", "Flex_CUP_ROC_Balaclava_Alt_1_Olive"]];


private _opticsClose = ["CUP_optic_MicroT1", 2, "CUP_optic_Eotech553_black", 1, "CUP_optic_VortexRazor_UH1_Black", 1, "", 1];
private _opticsMid = ["CUP_optic_AIMM_MICROT1_BLK", 1, "CUP_optic_G33_HWS_BLK", 1, "CUP_optic_LeupoldMk4_CQ_T", 1, "CUP_optic_SB_11_4x20_PM", 1, "CUP_optic_ACOG", 1];
private _opticsMG = ["CUP_optic_ACOG_TA648_308_RDS_black", 2, "CUP_optic_ElcanM145", 2, "CUP_optic_CWS", 1];
private _accRifle = ["CUP_acc_Flashlight", 2, "CUP_acc_ANPEQ_15_Black", 1, "CUP_acc_ANPEQ_15_Flashlight_Black_L", 1, "", 1];
private _accT91 = ["acc_flashlight", 3, "acc_pointer_IR", 1, "", 1];

_eliteLoadoutData set ["sidearms", [
    ["CUP_hgun_M9A1", "", ["CUP_acc_CZ_M3X", "CUP_acc_Glock17_Flashlight", ""], "", [], [], ""], 2,
    ["CUP_hgun_Glock17_blk", "", ["CUP_acc_CZ_M3X", "CUP_acc_Glock17_Flashlight", ""], "", [], [], ""], 3
]];
_eliteLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5_Rail", ["CUP_muzzle_fh_MP5", 2, "", 1], _accRifle, _opticsClose, [], [], ""], 1,
    ["CUP_smg_MP5A5_Rail_AFG", ["CUP_muzzle_fh_MP5", 2, "", 1], _accRifle, _opticsClose, [], [], ""], 1,
    ["CUP_smg_MP5A5_Rail_VFG", ["CUP_muzzle_fh_MP5", 2, "", 1], _accRifle, _opticsClose, [], [], ""], 1,
    ["CUP_smg_p90_black", "", "", _opticsClose, [], [], ""], 2
]];
_eliteLoadoutData set ["shotguns", [
    ["CUP_sgun_M1014_Entry", "", "", _opticsClose, [], [], ""],
    ["CUP_sgun_M1014_Entry_vfg", "", "", _opticsClose, [], [], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["Flex_CUP_ROC_ARifle_T91_blk", "", _accT91, _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 3,
    ["CUP_arifle_M4A1_MOE_black", "", _accRifle, _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1,
    ["CUP_arifle_M4A1_standard_black", "", _accRifle, _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1
]];
_eliteLoadoutData set ["slRifles", [
    ["Flex_CUP_ROC_ARifle_T91_blk", "", _accT91, _opticsMid, ["CUP_30Rnd_556x45_Stanag"], [], ""], 3,
    ["CUP_arifle_M4A1_MOE_black", "", _accRifle, _opticsMid, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1,
    ["CUP_arifle_M4A1_standard_black", "", _accRifle, _opticsMid, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1
]];
_eliteLoadoutData set ["carbines", [
    ["CUP_arifle_M4A1_MOE_short_black", "", _accRifle, _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1,
    ["CUP_arifle_M4A1_standard_short_black", "", _accRifle, _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 2
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M4A1_BUIS_GL", "", "", _opticsClose, ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["CUP_lmg_M240_B", "", "", _opticsMG, ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""], 2,
    ["CUP_lmg_Mk48", "", _accRifle, _opticsMG, ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""], 1,
    ["CUP_lmg_Mk48_nohg", "", _accRifle, _opticsMG, ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""], 1,
    ["CUP_lmg_m249_pip3", "", _accRifle, _opticsMid, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""], 3,
    ["CUP_mg_m249_pip4", "", _accRifle, _opticsMid, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""], 3
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_Mk18_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR"], [], "CUP_bipod_Harris_1A2_L_BLK"], 1,
    ["CUP_srifle_Mk18_blk", "", "", _opticsMid, ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR"], [], ""], 1,
    ["CUP_srifle_RSASS_Black", "", "", ["CUP_optic_LeupoldMk4", 3, "CUP_optic_Leupold_VX3", 1], ["CUP_20Rnd_762x51_L129_M"], [], "CUP_bipod_VLTOR_Modpod_black"], 2,
    ["CUP_srifle_RSASS_Black", "", "", _opticsMid, ["CUP_20Rnd_762x51_L129_M"], [], "CUP_bipod_VLTOR_Modpod_black"], 2
]];
_eliteLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M2010_blk", "", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_Harris_1A2_L_BLK"],
    ["CUP_srifle_M2010_ctrgt", "", "", "CUP_optic_LeupoldMk4_25x50_LRT_WOODLAND", ["CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_Harris_1A2_L_BLK"],
    ["CUP_srifle_M107_Base", "", "", ["CUP_optic_AN_PVS_10_black", 1, "CUP_optic_AN_PAS_13c1", 1, "CUP_optic_LeupoldMk4_25x50_LRT", 3], [], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", ["CUP_launch_MAAWS"]];
_eliteLoadoutData set ["missileATLaunchers", ["CUP_launch_Javelin", "CUP_launch_NLAW"]];

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _eliteLoadoutData call _fnc_copyLoadoutData;

_sfLoadoutData set ["uniforms", [
    "CUP_U_CRYE_G3C_MC",
    "CUP_U_CRYE_G3C_MC_V2",
    "CUP_U_CRYE_G3C_MC_V3",
    "CUP_U_CRYE_G3C_RGR"
]];
_sfLoadoutData set ["medVests", ["CUP_V_JPC_medical_mc", "CUP_V_JPC_medicalbelt_mc"]];
_sfLoadoutData set ["slVests", ["CUP_V_JPC_communications_mc", "CUP_V_JPC_communicationsbelt_mc"]];
_sfLoadoutData set ["sniVests", ["CUP_V_JPC_light_mc", "CUP_V_JPC_lightbelt_mc"]];
_sfLoadoutData set ["glVests", ["CUP_V_JPC_weapons_mc", "CUP_V_JPC_weaponsbelt_mc"]];
_sfLoadoutData set ["engVests", ["CUP_V_JPC_tl_mc", "CUP_V_JPC_tlbelt_mc"]];
_sfLoadoutData set ["vests", ["CUP_V_JPC_Fast_mc", "CUP_V_JPC_Fastbelt_mc"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_rgr"]];
_sfLoadoutData set ["longRangeRadios", ["B_RadioBag_01_wdl_F"]];
_sfLoadoutData set ["atBackpacks", ["B_Kitbag_rgr"]];
_sfLoadoutData set ["slBackpacks", ["B_Kitbag_rgr"]];
_sfLoadoutData set ["helmets", [
    "CUP_H_OpsCore_Covered_MCAM_SF",
    "CUP_H_OpsCore_Covered_Tan_SF",
    "CUP_H_OpsCore_Spray_SF",
    "CUP_H_OpsCore_Spray_NoHS"
]];
_sfLoadoutData set ["slHat", ["CUP_H_OpsCore_Covered_MCAM_SF"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_GPNVG_black_WP"]];

private _opticsClose = ["CUP_optic_MicroT1", 2, "CUP_optic_Eotech553_black", 1, "CUP_optic_VortexRazor_UH1_Black", 1, "CUP_optic_AIMM_MICROT1_BLK", 1, "CUP_optic_G33_HWS_BLK", 1];
private _opticsMid = ["CUP_optic_SB_11_4x20_PM", 1, "CUP_optic_ACOG", 1, "CUP_optic_Elcan_reflex", 1];
private _opticsMG = ["CUP_optic_ACOG_TA648_308_RDS_black", 2, "CUP_optic_ElcanM145", 2, "CUP_optic_CWS", 1];
private _accRifle = ["CUP_acc_ANPEQ_15_Black", 1, "CUP_acc_ANPEQ_15_Flashlight_Black_L", 2];
private _accT91 = ["acc_flashlight", 1, "acc_pointer_IR", 2];

_sfLoadoutData set ["sidearms", [
    ["CUP_hgun_M9A1", "CUP_muzzle_snds_M9", ["CUP_acc_Glock17_Flashlight", 1, "CUP_acc_CZ_M3X", 2], "", [], [], ""], 1,
    ["CUP_hgun_MicroUzi", "CUP_muzzle_snds_MicroUzi", "", "", [], [], ""], 1,
    ["CUP_hgun_Glock17_blk", "muzzle_snds_L", ["CUP_acc_Glock17_Flashlight", 1, "CUP_acc_CZ_M3X", 2], ["optic_MRD_black", 2, "", 1], [], [], ""], 3
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5_Rail", "CUP_muzzle_snds_MP5", _accRifle, _opticsClose, [], [], ""], 1,
    ["CUP_smg_MP5A5_Rail_AFG", "CUP_muzzle_snds_MP5", _accRifle, _opticsClose, [], [], ""], 1,
    ["CUP_smg_MP5A5_Rail_VFG", "CUP_muzzle_snds_MP5", _accRifle, _opticsClose, [], [], ""], 1,
    ["CUP_smg_p90_black", "muzzle_snds_570", _accRifle, _opticsClose, [], [], ""], 1
]];
_sfLoadoutData set ["rifles", [
    ["Flex_CUP_ROC_ARifle_T91_blk", "", "", _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1,
    ["CUP_arifle_HK416_Wood", "CUP_muzzle_snds_M16_camo", _accRifle, _opticsClose + _opticsMid, ["CUP_30Rnd_556x45_Emag"], [], ""], 2,
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16_camo", _accRifle, _opticsClose + _opticsMid, ["CUP_30Rnd_556x45_Emag"], [], ""], 1,
    ["CUP_arifle_HK417_12_Wood", "CUP_muzzle_snds_socom762rc", _accRifle, _opticsClose + _opticsMid, ["CUP_20Rnd_762x51_HK417_Camo_Wood"], [], ""], 1
]];
_sfLoadoutData set ["slRifles", [
    ["Flex_CUP_ROC_ARifle_T91_blk", "", "", _opticsMid, ["CUP_30Rnd_556x45_Stanag"], [], ""], 2,
    ["CUP_arifle_HK416_Wood", "CUP_muzzle_snds_M16_camo", _accRifle, _opticsMid, ["CUP_30Rnd_556x45_Emag"], [], ""], 2,
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16_camo", _accRifle, _opticsMid, ["CUP_30Rnd_556x45_Emag"], [], ""], 1
]];
_sfLoadoutData set ["carbines", [
    ["CUP_arifle_SBR_black", ["CUP_muzzle_mfsup_Flashhider_556x45_Tan", "CUP_muzzle_snds_M16_coyote"], _accRifle, _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1,
    ["CUP_arifle_HK416_CQB_Wood", "CUP_muzzle_snds_M16_camo", _accRifle, _opticsClose, ["CUP_30Rnd_556x45_Emag"], [], ""], 1,
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16_camo", _accRifle, _opticsClose, ["CUP_30Rnd_556x45_Emag"], [], ""], 1
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16_camo", _accRifle, _opticsClose + _opticsMid, ["CUP_30Rnd_556x45_Emag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""], 1,
    ["CUP_arifle_HK416_CQB_M203_Wood", "CUP_muzzle_snds_M16_camo", _accRifle, _opticsClose + _opticsMid, ["CUP_30Rnd_556x45_Emag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""], 1,
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16_camo", _accRifle, _opticsClose + _opticsMid, ["CUP_30Rnd_556x45_Emag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""], 1,
    ["CUP_arifle_HK416_CQB_AG36_Wood", "CUP_muzzle_snds_M16_camo", _accRifle, _opticsClose + _opticsMid, ["CUP_30Rnd_556x45_Emag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""], 1,
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16_camo", _accRifle, _opticsClose + _opticsMid, ["CUP_30Rnd_556x45_Emag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""], 1,
    ["CUP_arifle_HK416_M203_Wood", "CUP_muzzle_snds_M16_camo", _accRifle, _opticsClose + _opticsMid, ["CUP_30Rnd_556x45_Emag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""], 1,
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16_camo", _accRifle, _opticsClose + _opticsMid, ["CUP_30Rnd_556x45_Emag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""], 1,
    ["CUP_arifle_HK416_AGL_Wood", "CUP_muzzle_snds_M16_camo", _accRifle, _opticsClose + _opticsMid, ["CUP_30Rnd_556x45_Emag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""], 1,
    ["CUP_arifle_HK417_12_M203", "CUP_muzzle_snds_socom762rc", _accRifle, _opticsClose + _opticsMid, ["CUP_20Rnd_762x51_HK417_Camo_Wood"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""], 1,
    ["CUP_arifle_HK417_12_M203_Wood", "CUP_muzzle_snds_socom762rc", _accRifle, _opticsClose + _opticsMid, ["CUP_20Rnd_762x51_HK417_Camo_Wood"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""], 1,
    ["CUP_arifle_HK417_12_AG36", "CUP_muzzle_snds_socom762rc", _accRifle, _opticsClose + _opticsMid, ["CUP_20Rnd_762x51_HK417_Camo_Wood"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""], 1,
    ["CUP_arifle_HK417_12_AG36_Wood", "CUP_muzzle_snds_socom762rc", _accRifle, _opticsClose + _opticsMid, ["CUP_20Rnd_762x51_HK417_Camo_Wood"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""], 1
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_M240_B", "", "", _opticsMG, ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""], 2,
    ["CUP_lmg_Mk48", "muzzle_snds_H_MG_blk_F", _accRifle, _opticsMG, ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""], 1,
    ["CUP_lmg_Mk48_nohg", "muzzle_snds_H_MG_blk_F", _accRifle, _opticsMG, ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""], 1,
    ["CUP_lmg_m249_pip3", "CUP_muzzle_snds_M16", _accRifle, _opticsMid, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""], 3,
    ["CUP_mg_m249_pip4", "CUP_muzzle_snds_M16", _accRifle, _opticsMid, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""], 3
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_RSASS_Black", "", "", ["CUP_optic_LeupoldMk4", 3, "CUP_optic_Leupold_VX3", 1], ["CUP_20Rnd_762x51_L129_M"], [], "CUP_bipod_VLTOR_Modpod_black"], 2,
    ["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", _accRifle, _opticsMid + ["CUP_optic_LeupoldM3LR", 1, "CUP_optic_Leupold_VX3", 1], ["CUP_20Rnd_762x51_HK417_Camo_Wood"], [], "CUP_bipod_VLTOR_Modpod_black"], 1,
    ["CUP_arifle_HK417_20_Wood", "CUP_muzzle_snds_socom762rc", _accRifle, _opticsMid + ["CUP_optic_LeupoldM3LR", 1, "CUP_optic_Leupold_VX3", 1], ["CUP_20Rnd_762x51_HK417_Camo_Wood"], [], "CUP_bipod_VLTOR_Modpod_od"], 1
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", [
    "CUP_ROC_U_B_BDUv2_pol_dirty",
    "CUP_ROC_U_B_BDUv2_pol_gloves_dirty",
    "CUP_ROC_U_B_BDUv2_pol_gloves",
    "CUP_ROC_U_B_BDUv2_pol",
    "CUP_ROC_U_B_BDUv2_pol_roll_dirty",
    "CUP_ROC_U_B_BDUv2_pol_roll_gloves_dirty",
    "CUP_ROC_U_B_BDUv2_pol_roll_gloves",
    "CUP_ROC_U_B_BDUv2_pol_roll",
    "CUP_ROC_U_B_BDUv2_pol_roll2_dirty",
    "CUP_ROC_U_B_BDUv2_pol_roll2_gloves_dirty",
    "CUP_ROC_U_B_BDUv2_pol_roll2_gloves",
    "CUP_ROC_U_B_BDUv2_pol_roll2"
]];
_policeLoadoutData set ["vests", [
    "CUP_V_PMC_CIRAS_Black_Veh",
    "CUP_V_PMC_CIRAS_Black_Empty"
]];
_policeLoadoutData set ["slVests", [
    "CUP_V_PMC_CIRAS_Black_TL",
    "CUP_V_PMC_CIRAS_Black_Patrol"
]];
_policeLoadoutData set ["helmets", [
    "CUP_H_Ger_M92_Black",
    "CUP_H_Ger_M92_Black_GG",
    ""
]];
_policeLoadoutData set ["slHat", ["H_Beret_blk", "CUP_H_USArmy_Helmet_ECH1_Black", "H_HeadSet_black_F"]];

_policeLoadoutData set ["sidearms", [
    ["CUP_hgun_Colt1911", "", "", "", [], [], ""], 1,
    ["CUP_hgun_SWM327MP", "", "", "", [], [], ""], 2,
    ["CUP_hgun_M9", "", "", "", [], [], ""], 2
]];
_policeLoadoutData set ["SMGs", [
    ["CUP_smg_UZI", "", "", "", [], [], ""], 2,
    ["CUP_smg_MP5A5", "", "", "", [], [], ""], 1
]];
_policeLoadoutData set ["shotguns", [
    ["CUP_sgun_SPAS12", "", "", "", ["CUP_8Rnd_12Gauge_Pellets_No0_Buck"], [], ""], 4,
    ["CUP_sgun_M1014", "", "", "", ["CUP_8Rnd_12Gauge_Pellets_No0_Buck"], [], ""], 1
]];
_policeLoadoutData set ["carbines", [
    ["CUP_arifle_Colt727", "", "", "", ["CUP_20Rnd_556x45_Stanag"], [], ""], 4,
    ["CUP_arifle_MR556", "", "", "", ["CUP_30Rnd_556x45_PMAG_BLACK"], [], ""], 1
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

// Note: crew loadout data is used for vehicle crew members / drivers / pilots, e.g. for helicopter, APC, and tank crews
//      Some templates separate _crewLoadoutData and _pilotLoadoutData, while some templates use just one. Again, it doesn't matter as long as the unit templates are updated to match.
//      Here, we leave them separate for simplicity.

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;

_crewLoadoutData set ["uniforms", ["CUP_U_B_USArmy_PilotOverall"]];
_crewLoadoutData set ["helmets", ["CUP_H_CVC"]];
_crewLoadoutData set ["vests", ["CUP_V_B_RRV_Light"]];

private _pilotLoadoutData = _crewLoadoutData call _fnc_copyLoadoutData;

_pilotLoadoutData set ["uniforms", ["CUP_U_B_USArmy_PilotOverall"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_B"]];
_pilotLoadoutData set ["vests", ["CUP_V_B_PilotVest", "CUP_ROC_V_B_PilotVest"]];





/////////////////////////////////
//        Unit Templates       //
/////////////////////////////////

#include "..\Definitions\Unit_Templates.sqf"
