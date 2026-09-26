// Note: Rebel faction templates are structured very similarly to occupant and invader templates, but with significantly less vehicle and equipment definitions required,
//      since the majority of their equipment will be acquired throughout gameplay.
//      The basic sections of the template are the same though:
//            - Basic faction information (name, side, flag, etc.)
//            - Vehicles and static weapons (for purchase from the rebel store)
//            - Basic uniforms, equipment and starting weapons
//            - Unit templates, loadouts, and loadout generation functions





///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "Faction Name"] call _fnc_saveToTemplate; // faction name as shown on the map and in game dialogs; should be short
["flagTexture", "a3\data_f\flags\flag_fia_co.paa"] call _fnc_saveToTemplate; // path to the faction's flag texture
#include "..\Definitions\Reb_Side_Information.sqf"





///////////////////////////
//       Vehicles        //
///////////////////////////

// Note: mostly the same as in the occupant and invader templates, but with fewer vehicles defined since rebels acquire most of their equipment during gameplay.
//      Pay attention to names as some are similar, but not the same as those used in the occupant and invader templates.

private _lootCrate = []; // the loot crate object
private _rallyPoint = []; // the rally point object

// Rebel vehicles. These will be available (depending on war level) for purchase in the rebel store.
private _vehiclesBasic = []; // small, unarmed transport vehicles; generally, a quad bike, motorcycle, or similar
private _vehiclesLightUnarmed = []; // small, unarmed utility vehicles; generally, a jeep or similar
private _vehiclesLightArmed = []; // small, armed utility vehicles; generally, a jeep or similar with mounted weapon
private _vehiclesTruck = []; // larger transport vehicles; e.g. a Ural truck or similar; often seen in convoys transporting troops
private _vehiclesAT = []; // anti-tank vehicles; generally equipped with missiles or recoilless anti-armor weaponry; you *can* have more than one, but usually only one is vehicle is provided for the rebel store as the majority of specialized weapons and vehicles should be acquired from enemy forces
private _vehiclesAA = []; // anti-air vehicles; generally equipped with surface-to-air missiles or anti-aircraft guns; you *can* have more than one, but usually only one is vehicle is provided for the rebel store as the majority of specialized weapons and vehicles should be acquired from enemy forces
private _vehiclesBoat = []; // boats and other watercraft; generally small and lightly armed, if at all
private _vehiclesPlanes = []; // small to medium transport planes; generally used for airdrops, air transport, and in later war levels rebel air support
private _vehiclesMedical = []; // medical vehicles; generally equipped with medical supplies and used for transporting injured personnel

// A special note on emplacements: rebel static / vehicle emplacements (e.g. roadblocks, static MG emplacements, static AA emplacements, etc) will always use the first vehicle defined in an array
//      For example, if _staticMGs is definend as ["B_MG_01_F", "B_MG_02_F"], the first vehicle in the array ("B_MG_01_F") will always be used for rebel static MG emplacements.

// Rebel static weapons and defenses. These will be available (depending on war level) for purchase in the rebel store.
private _staticMG = []; // static machine guns; generally used for defending positions and providing suppressive fire
private _staticAT = []; // static anti-tank weapons; generally used for defending against armored vehicles
private _staticAA = []; // static anti-air weapons; generally used for defending against aircraft
private _staticMortar = []; // static mortars; generally used for indirect fire support against enemy positions
private _staticMortarMagHE = []; // high-explosive mortar rounds; generally used for indirect fire support against enemy positions
private _staticMortarMagSmoke = []; // smoke mortar rounds; generally used for creating smoke screens and obscuring enemy vision
private _staticMortarMagFlare = []; // flare mortar rounds; generally used for illumination and signaling
private _minesAT = []; // anti-tank mines; generally used for defending against armored vehicles
private _minesAPERS = []; // anti-personnel mines; generally used for defending against infantry
private _breachingExplosivesAPC = []; // breaching explosives for armored personnel carriers; generally smaller / less explosive yield
private _breachingExplosivesTank = []; // breaching explosives for tanks; generally larger / higher explosive yield

// Civilian vehicles. These will be available (depending on war level) for purchase in the rebel store for undercover transport, and in some cases for special uses (e.g. supply convoys) that require civilian vehicles
private _vehiclesCivCar = []; // civilian cars; generally used for undercover transport and personal mobility
private _vehiclesCivTruck = []; // civilian trucks; generally used for transporting larger quantities of goods and equipment or personnel
private _vehiclesCivSupply = []; // civilian supply vehicles; generally equipped with cargo space for transporting goods and equipment and used in convoys
private _vehiclesCivHeli = []; // civilian helicopters
private _vehiclesCivBoat = []; // civilian boats and other watercraft
private _vehiclesCivPlane = []; // civilian planes

#include "..\Definitions\Reb_Vehicles_SaveToTemplate.sqf"

// Advanced vehicle modifications
// Note: See the documentation in each #include'd file for details
#include "Reb_Vehicle_Attributes.sqf" // vehicle attributes allow changing the cost and threat of specific vehicles for a faction if needed

#include "Vehicle_Animations.sqf" // animations are used to add or remove cosmetic elements of a vehicle, e.g. spare tires, radio antennas, camouflage netting, etc

#include "Vehicle_Variants.sqf" // variants are used to select different available textures / skins for vehicles





///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

// Note: This section defines the starting gear for rebel units, including weapons, ammunition, and equipment they will have available at the start of the game.
//      Any item added as a simple classname will be unlocked in the arsenal, with unlimited quantity available for use.
//      Any item added as an array with classname and quantity will have that quantity of the item in the arsenal at the start of the game, and with each resource tick (every 10min), a small amount of that item will be added to the arsenal to replenish losses incurred in the course of the game.
//      Example:
//            _initialRebelEquipment = [
//                  "hgun_Pistol_01_F", // unlimited pistols available at the start
//                  ["arifle_AK12_F", 5] // 5 AK-12 rifles available at the start and replenished over time
//            ];
//      Initial rebel equipment should generally include as unlimited:
//          - Sidearms (pistols)
//          - Basic ammunition for sidearms
//          - Basic medical supplies (bandages, first aid kits)
//          - Basic grenades (if applicable)
//          - Basic melee weapons (if applicable)
//          - Basic load-bearing / cargo equipment (vests, backpacks)
//     and as limited items:
//          - Mines (anti-tank, anti-personnel)
//          - Explosives (if applicable)
//          - Unguided launchers

private _initialRebelEquipment = [];

// Add TFAR radios to the initial rebel equipment if the mod is present and the player starts with long-range radios
if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr", "tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {
    _initialRebelEquipment pushBack "tf_anprc155";
    _initialRebelEquipment pushBack "tf_anprc155_coyote";
};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr", "TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {
    _initialRebelEquipment pushBack "TFAR_anprc155";
    _initialRebelEquipment pushBack "TFAR_anprc155_coyote";
};

_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];

["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = []; // Uniforms available to rebel players in the arsenal
private _rebUniformsAI = []; // Uniforms available to AI-controlled rebels
private _rebHeadgear = []; // Headgear used by AI rebels until armored headgear (helmets) are unlocked in the arsenal
private _rebFacewear = []; // Facewear used by AI rebels

["uniforms", _rebUniforms] call _fnc_saveToTemplate;
["headgear", _rebHeadgear] call _fnc_saveToTemplate;





/////////////////////
///  Identities   ///
/////////////////////

// Faces, voices, and names for the rebel faction AI

private _rebFaces = [];
private _rebVoices = [];

["faces", _rebFaces] call _fnc_saveToTemplate;
["voices", _rebVoices] call _fnc_saveToTemplate;

"EnglishMen" call _fnc_saveNames; // names used for the troops in this faction. Names must be defined in a class within configFile >> CfgWorlds >> GenericNames; If this line is not included, faction will use default ArmA 3 Greek names





/////////////////////
//     Petros      //
/////////////////////

["petrosIdentity", createHashMapFromArray [
    ["face", ""], // face classname, e.g. "WhiteHead_01"
    ["speaker", ""], // speaker (voice) classname, e.g. "Male01ENGB"
    ["pitch", 1.1], // pitch of the voice
    ["firstName", ""], // first name of the character, e.g. "Petros"
    ["lastName", ""] // last name of the character, e.g. ":)"
]] call _fnc_saveToTemplate;

["petrosPrimary", ["weapon_classname", 4]] call _fnc_saveToTemplate; // Petros primary weapon and number of mags, e.g. ["arifle_MXM_F", 4]
["petrosHandgun", ["weapon_classname", 5]] call _fnc_saveToTemplate; // Petros handgun and number of mags, e.g. ["hgun_Pistol_01_F", 5]

["petrosHeadgear", "headgear_classname"] call _fnc_saveToTemplate; // Petros headgear, e.g. "H_HelmetB"
["petrosUniform", "uniform_classname"] call _fnc_saveToTemplate; // Petros uniform, e.g. "U_B_CombatUniform_mcam"
["petrosGoggles", "goggles_classname"] call _fnc_saveToTemplate; // Petros facewear, e.g. "G_Balaclava_blk"





//////////////////////////
//       Loadouts       //
//////////////////////////

#include "..\Definitions\Reb_Loadouts.sqf"





////////////////////////
//  Rebel Unit Types  //
///////////////////////.

#include "..\Definitions\Reb_Unit_Templates.sqf"
