// Note: Civilian faction templates are the simplest and shortest of the faction templates.
// They are structured very similarly to occupant and invader templates, but we're only really concerned with defining civilian vehicles and a few types of civilian units
//      The basic sections of the template are:
//            - Vehicles
//            - Unit templates, loadouts, and loadout generation functions





//////////////////////////
//       Vehicles       //
//////////////////////////

// Note: the key difference here from other templates is that civilian template vehicles **must** be weighted arrays (except for planes and helicopters...for some reason)
// Example:
//      _vehiclesCivCar = ["C_Quadbike_01_F", 0.3, "C_Hatchback_01_F", 7.0, "C_Hatchback_01_sport_F", 0.3, "C_Offroad_01_F", 1.0, "C_SUV_01_F", 1.0];
// Also, keep in mind that vehicles defined in the civilian template will allow rebels to activate undercover while using them

private _vehiclesCivCar = []; // light cars and utility vehicles, typically used for civilian transport
private _vehiclesCivIndustrial = []; // industrial and commercial vehicles, typically used for civilian work and transport; e.g. flatbed truck, tow vehicles, cargo trucks, etc
private _vehiclesCivRepair = []; // repair and service vehicles, typically used for civilian maintenance and support; useful to "acquire" to repair rebel vehicles
private _vehiclesCivMedical = []; // medical and emergency vehicles, typically used for civilian medical support and emergency response; e.g. ambulances, medical transport vehicles, etc
private _vehiclesCivFuel = []; // fuel and service vehicles, typically used for civilian fuel transport and refueling operations; useful to "acquire" to refuel rebel vehicles
private _vehiclesCivBoat = []; // boats and watercraft, typically used for civilian water transport and recreational activities
private _vehiclesCivPlanes = []; // planes and civilian aircraft, typically used for civilian air transport and recreational flying; not really used for anything but ambient events
private _vehiclesCivHeli = []; // helicopters and civilian rotorcraft, typically used for civilian air transport and recreational flying; not really used for anything but ambient events; not really used for anything but ambient events

["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;
["vehiclesCivIndustrial", _vehiclesCivIndustrial] call _fnc_saveToTemplate;
["vehiclesCivRepair", _vehiclesCivRepair] call _fnc_saveToTemplate;
["vehiclesCivMedical", _vehiclesCivMedical] call _fnc_saveToTemplate;
["vehiclesCivFuel", _vehiclesCivFuel] call _fnc_saveToTemplate;
["vehiclesCivBoat", _vehiclesCivBoat] call _fnc_saveToTemplate;
["vehiclesCivPlanes", _vehiclesCivPlanes] call _fnc_saveToTemplate;
["vehiclesCivHeli", _vehiclesCivHeli] call _fnc_saveToTemplate;

// Advanced vehicle modifications
// Note: See the documentation in each #include'd file for details
#include "Vehicle_Animations.sqf" // animations are used to add or remove cosmetic elements of a vehicle, e.g. spare tires, radio antennas, camouflage netting, etc

#include "Vehicle_Variants.sqf" // variants are used to select different available textures / skins for vehicles





//////////////////////////
//       Loadouts       //
//////////////////////////

// identity
private _faces = []; // civilian faces, typically used for customizing the appearance of civilian characters
["faces", _faces] call _fnc_saveToTemplate;

// basic equipment
private _civUniforms = []; // general civilian uniforms
private _pressUniforms = []; // journalist / press uniforms
private _workerUniforms = []; // factory / resource worker uniforms
private _vipUniforms = []; // VIP and important civilian uniforms
private _civHats = []; // civilian hats and headgear
private _pressHelmets = []; // helmets and headgear for journalist / press uniforms
private _workerHelmets = []; // helmets and headgear for factory / resource workers

["uniforms", _civUniforms + _pressUniforms + _workerUniforms + _vipUniforms] call _fnc_saveToTemplate; // these will all be added to the rebel arsenal for undercover purposes
["headgear", _civHats] call _fnc_saveToTemplate; // these will be added to the rebel arsenal for undercover purposes

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms]; // this is where we add them to the civilian loadout data for dressing civilian (not rebel) units
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["vipUniforms", _vipUniforms];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["workerHelmets", _workerHelmets];
_loadoutData set ["pressHelmets", _pressHelmets];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["vipUniforms", _vipUniforms];

// weapons
_loadoutData set ["sidearms", ["hgun_Pistol_heavy_02_F", "hgun_ACPC2_F", "hgun_P07_F"]]; // Note that *only* VIPs have weapons, used in new town battles





/////////////////////////////////
//        Unit Templates       //
/////////////////////////////////

// Don't modify unless you *really* know what you're doing

private _manTemplate = {
  ["helmets"] call _fnc_setHelmet;
  ["uniforms"] call _fnc_setUniform;

  ["items_medical_standard"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
  [["workerHelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
  ["workerUniforms"] call _fnc_setUniform;

  ["items_medical_standard"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
  ["pressHelmets"] call _fnc_setHelmet;
  ["pressVests"] call _fnc_setVest;
  ["pressUniforms"] call _fnc_setUniform;

  ["items_medical_standard"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;
};
private _vipTemplate = {
  ["vipUniforms"] call _fnc_setUniform;

  ["items_medical_standard"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;

  ["sidearms"] call _fnc_setHandgun;
  ["handgun", 2] call _fnc_addMagazines;
};
private _prefix = "militia";
private _unitTypes = [
  ["VIP", _vipTemplate],
  ["Press", _pressTemplate],
  ["Worker", _workerTemplate],
  ["Man", _manTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
