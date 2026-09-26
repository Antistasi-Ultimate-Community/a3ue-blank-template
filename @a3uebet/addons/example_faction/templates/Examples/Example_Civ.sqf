#include "..\..\script_component.hpp"
#pragma hemtt ignore_variables ["_fnc_createLoadoutData","_fnc_generateAndSaveUnitsToTemplate","_fnc_saveToTemplate"]

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

#include "..\Definitions\Civ_Vehicles_SaveToTemplate.sqf"

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

#include "..\Definitions\Civ_Unit_Templates.sqf"
