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
["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

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
    _vehiclesAPCs pushback "Flex_CUP_ROC_APC_Wheeled_02"; // CM32
    _vehiclesIFVs pushback "Flex_CUP_ROC_APC_Wheeled_01"; // CM34
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

["vehiclesBasic", _vehiclesBasic] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _vehiclesLightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesTrucks", _vehiclesTrucks] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", _vehiclesCargoTrucks] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", _vehiclesAmmoTrucks] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", _vehiclesRepairTrucks] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", _vehiclesFuelTrucks] call _fnc_saveToTemplate;
["vehiclesMedical", _vehiclesMedical] call _fnc_saveToTemplate;
["vehiclesLightAPCs", _vehiclesLightAPCs] call _fnc_saveToTemplate;
["vehiclesAPCs", _vehiclesAPCs] call _fnc_saveToTemplate;
["vehiclesIFVs", _vehiclesIFVs] call _fnc_saveToTemplate;
["vehiclesLightTanks", _vehiclesLightTanks] call _fnc_saveToTemplate;
["vehiclesTanks", _vehiclesTanks] call _fnc_saveToTemplate;
["vehiclesArtillery", _vehiclesArtillery] call _fnc_saveToTemplate;
["magazines", _artilleryMagazines] call _fnc_saveToTemplate;
["vehiclesAA", _vehiclesAA] call _fnc_saveToTemplate;
["vehiclesHelisLight", _vehiclesHelisLight] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", _vehiclesHelisLightAttack] call _fnc_saveToTemplate;
["vehiclesHelisTransport", _vehiclesHelisTransport] call _fnc_saveToTemplate;
["vehiclesHelisAttack", _vehiclesHelisAttack] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", _vehiclesPlanesTransport] call _fnc_saveToTemplate;
["vehiclesPlanesCAS", _vehiclesPlanesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _vehiclesPlanesAA] call _fnc_saveToTemplate;
["vehiclesPlanesGunship", _vehiclesPlanesGunship] call _fnc_saveToTemplate;
["uavsPortable", _uavsPortable] call _fnc_saveToTemplate;
["uavsAttack", _uavsAttack] call _fnc_saveToTemplate;
["vehiclesTransportBoats", _vehiclesTransportBoats] call _fnc_saveToTemplate;
["vehiclesGunboats", _vehiclesGunboats] call _fnc_saveToTemplate;
["vehiclesSDV", _vehiclesSDV] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", _vehiclesMilitiaCars] call _fnc_saveToTemplate;
["vehiclesMilitiaLightArmed", _vehiclesMilitiaLightArmed] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", _vehiclesMilitiaTrucks] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", _vehiclesMilitiaAPCs] call _fnc_saveToTemplate;
["vehiclesPolice", _vehiclesPolice] call _fnc_saveToTemplate;
["vehiclesAirPatrol", _vehiclesAirPatrol] call _fnc_saveToTemplate;
["vehiclesAirborne", _vehiclesAirborne] call _fnc_saveToTemplate;
["vehiclesAmphibious", _vehiclesAmphibious] call _fnc_saveToTemplate;
["staticMortars", _staticMortars] call _fnc_saveToTemplate;
["mortarMagazineHE", _mortarMagazineHE] call _fnc_saveToTemplate;
["mortarMagazineSmoke", _mortarMagazineSmoke] call _fnc_saveToTemplate;
["mortarMagazineFlare", _mortarMagazineFlare] call _fnc_saveToTemplate;
["staticHowitzers", _staticHowitzers] call _fnc_saveToTemplate;
["howitzerMagazineHE", _howitzerMagazineHE] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;
["staticAT", _staticAT] call _fnc_saveToTemplate;
["staticMGs", _staticMGs] call _fnc_saveToTemplate;
["vehicleRadar", _vehicleRadar] call _fnc_saveToTemplate;
["vehicleSAM", _vehicleSAM] call _fnc_saveToTemplate;
["minefieldAT", _minefieldAT] call _fnc_saveToTemplate;
["minefieldAPERS", _minefieldAPERS] call _fnc_saveToTemplate;





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

_loadoutData set ["officerUniforms", []]; // TODO uniforms used by officer units
_loadoutData set ["officerVests", []]; // TODO vests used by officer units
_loadoutData set ["officerHats", []]; // TODO hats used by officer units

_loadoutData set ["cloakUniforms", []]; // TODO not required, but generally used for patrol sniper unit templates
_loadoutData set ["cloakVests", []]; // TODO not required, but generally used for patrol sniper unit templates
_loadoutData set ["cloakHats", []]; // TODO not required, but generally used for patrol sniper unit templates

_loadoutData set ["uniforms", []];
_loadoutData set ["mgVests", []]; // TODO vests for machine gunners
_loadoutData set ["medVests", []]; // TODO vests for medics
_loadoutData set ["slVests", []]; // TODO vests for squad leaders
_loadoutData set ["sniVests", []]; // TODO vests for snipers
_loadoutData set ["glVests", []]; // TODO vests for grenadiers
_loadoutData set ["engVests", []]; // TODO vests for engineers
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
_loadoutData set ["rifles", []]; // TODO
_loadoutData set ["carbines", []]; // TODO shorter rifles, usually less capable but lighter and more maneuverable; used by specialty troops like medics or vehicle crews
_loadoutData set ["SMGs", []]; // TODO submachine guns, generally low caliber but fast firing; typically used by close-quarters specialists or specialty troops as above
_loadoutData set ["machineGuns", []]; // TODO fully automatic weapons designed for sustained fire, typically used by support troops
_loadoutData set ["marksmanRifles", []]; // TODO precision rifles used by designated marksmen within a squad
_loadoutData set ["sniperRifles", []]; // TODO high-caliber rifles used by snipers for long-range engagements
_loadoutData set ["sidearms", []]; // TODO pistols and other small, easily carried secondary weapons
_loadoutData set ["grenadeLaunchers", []]; // TODO launchers designed to fire grenades, typically attached to rifles or used as standalone weapons
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
    ["CUP_hgun_Colt1911", "", "", "", [], [], ""], 1,
    ["CUP_hgun_M9", "", "", "", [], [], ""], 2
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

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _sfLoadoutData call _fnc_copyLoadoutData;

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

private _opticsClose = ["CUP_optic_MicroT1", 3, "CUP_optic_HoloBlack", 1, "CUP_optic_VortexRazor_UH1_Black", 1, "", 5];
private _opticsMid = ["CUP_optic_AIMM_MICROT1_BLK", 1, "CUP_optic_ACOG2", 2, "CUP_optic_ACOG_TA31_KF", 2, "", 5];

_sfLoadoutData set ["sidearms", [
    ["CUP_hgun_M9A1", "", "", "", [], [], ""], 4,
    ["CUP_hgun_Glock17_blk", "", "", "", [], [], ""], 1
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5_Rail", "", "", _opticsClose, [], [], ""], 1,
    ["CUP_smg_MP5A5_Rail_AFG", "", "", _opticsClose, [], [], ""], 1,
    ["CUP_smg_MP5A5_Rail_VFG", "", "", _opticsClose, [], [], ""], 1,
    ["CUP_smg_p90_black", "", "", _opticsClose, [], [], ""], 1,
]];
_sfLoadoutData set ["rifles", [
    ["Flex_CUP_ROC_ARifle_T91_blk", "", "", _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 3,
    ["CUP_arifle_M4A1_MOE_black", "", "", _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1,
    ["CUP_arifle_M4A1_standard_black", "", "", _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1
]];
_sfLoadoutData set ["slRifles", [
    ["Flex_CUP_ROC_ARifle_T91_blk", "", "", _opticsMid, ["CUP_30Rnd_556x45_Stanag"], [], ""], 3,
    ["CUP_arifle_M4A1_MOE_black", "", "", _opticsMid, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1,
    ["CUP_arifle_M4A1_standard_black", "", "", _opticsMid, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1
]];
_sfLoadoutData set ["carbines", [
    ["CUP_arifle_M4A1_MOE_short_black", "", "", _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 1,
    ["CUP_arifle_M4A1_standard_short_black", "", "", _opticsClose, ["CUP_30Rnd_556x45_Stanag"], [], ""], 2
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M4A1_BUIS_GL", "", "", _opticsClose, ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_M240_B", "", "", ["CUP_optic_ACOG_TA648_308_black", 2, "CUP_optic_ElcanM145", 2, "CUP_optic_CWS", 1, "", 5], ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""], 1,
    ["CUP_lmg_m249_pip1", "", "", _opticsMid, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""], 2,
    ["CUP_mg_m249_pip2", "", "", _opticsMid, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""], 1
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_Mk18_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR"], [], "CUP_bipod_Harris_1A2_L_BLK"], 2,
    ["CUP_srifle_Mk18_blk", "", "", _opticsMid, ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR"], [], ""], 2,
    ["CUP_srifle_RSASS_Black", "", "", ["CUP_optic_LeupoldMk4", 3, "CUP_optic_Leupold_VX3", 1], ["CUP_20Rnd_762x51_L129_M"], [], "CUP_bipod_VLTOR_Modpod_black"], 1
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldMk4_10x40_LRT_Woodland", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_Harris_1A2_L"],
    ["CUP_srifle_M24_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_Harris_1A2_L"],
    ["CUP_srifle_M2010_blk", "", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_Harris_1A2_L_BLK"],
    ["CUP_srifle_M2010_ctrgt", "", "", "CUP_optic_LeupoldMk4_25x50_LRT_WOODLAND", ["CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_Harris_1A2_L_BLK"]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

// urban digital camouflage equipment

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

// Note: unit templates are where we define which keys / variables within the loadout data hashmap are used for each type of unit by role
//      They are tier-agnostic, meaning the same unit template can be used across different tiers (e.g., military, police, crew) without modification.
//      For example, this is the section where we define that squad leaders use _slHats for their headgear, _slVests for their vests, etc.
//      It is recommended not to modify these templates (or anything else left in this template file) until you have a thorough understanding of how the loadout system works,
//            and have already tested your changes in-game.
//
// Note also the use of selectRandom, selectRandomWeighted, and [] call _fnc_fallback within many of the templates
//      - selectRandom is used to pick a random element from an array, e.g. for a rifleman to randomly select between rifles or carbines
//      - selectRandomWeighted is used to pick a random element from an array with weighted probabilities, e.g. for a squad leader to have a higher chance of selecting a helemt over a hat
//      - [] call _fnc_fallback is used to provide a fallback value in case the array is empty or the selection fails, ensuring that the unit always has a valid piece of equipment
//            For example, [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary is used in the squad leader template for squad leader to select a primary weapon from the slRifles array *if it exists*, otherwise it falls back to the rifles array.

private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _radiomanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["longRangeRadios"] call _fnc_setBackpack;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandomWeighted ["carbines", 0.4, "SMGs", 0.6]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_medic"] call _fnc_addItemSet;
    ["items_medic_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 1.25]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    if (random 1 < 0.3) then {
        [["designatedGrenadeLaunchers", "grenadeLaunchers"] call _fnc_fallback] call _fnc_setPrimary;
        ["backpacks"] call _fnc_setBackpack;
    } else {
        ["grenadeLaunchers"] call _fnc_setPrimary;
    };
    
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_explosivesExpert_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["lightExplosives", 2] call _fnc_addItem;
    if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandomWeighted ["carbines", 0.4, "SMGs", 0.6]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 1]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandomWeighted ["rifles", 0.2, "carbines", 0.5, "SMGs", 0.3]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandomWeighted ["rifles", 0.2, "carbines", 0.5, "SMGs", 0.3]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandomWeighted ["rifles", 0.2, "carbines", 0.5, "SMGs", 0.3]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    [selectRandomWeighted ["helmets", 2, "sniHats", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["sniVests","vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["SMGs"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_crew_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
    ["traitorHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["traitorVests"] call _fnc_setVest;
    ["traitorUniforms"] call _fnc_setUniform;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _officerTemplate = {
    ["officerHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["officerVests"] call _fnc_setVest;
    ["officerUniforms"] call _fnc_setUniform;

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;
    
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _patrolSniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["cloakVests","vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _patrolSpotterTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["cloakVests","vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [selectRandom ["rifles", "carbines", "marksmanRifles"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};





// Finally, the sections below map the unit templates to the types of units that will be spawned in game,
//      and generate the randomized loadouts for each unit type within each tier.
// There is no real reason to modify anything within this section unless you know exactly what you're doing.

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]],
    ["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    ["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]] 
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
	["SquadLeader", _policeTemplate, [], [_prefix]],
	["Standard", _policeTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]],
    ["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    ["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]] 
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Elite Units   //
///////////////////////
private _prefix = "elite";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]],
    ["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    ["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]] 
];

[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate, [], ["other"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate, [], ["other"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _officerTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
