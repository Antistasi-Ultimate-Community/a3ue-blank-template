// Note: Rival faction templates are structured very similarly to occupant and invader templates, but with significantly less vehicle and equipment definitions required,
//      since there are no rival "tiers" based on war level
//      The basic sections of the template are the same though:
//            - Basic faction information
//            - Vehicles and static weapons
//            - Unit templates, loadouts, and loadout generation functions





////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "faction_name"] call _fnc_saveToTemplate; // Faction name; should be short; e.g. "Remnants"
["nameLeader", ""] call _fnc_saveToTemplate; // full name of the faction leader, e.g. "Georgious Akhanteros"





//////////////////////////////////////
//       	Identities    			//
//////////////////////////////////////

private _faces = [];
private _voices = [];

["faces", _faces] call _fnc_saveToTemplate;
["voices", _voices] call _fnc_saveToTemplate;





//////////////////////////
//       Vehicles       //
//////////////////////////

// General equipment

["ammobox", ""] call _fnc_saveToTemplate;
["surrenderCrate", ""] call _fnc_saveToTemplate;

// Ground vehicles
private _vehiclesLightUnarmed = []; // small, unarmed utility vehicles; generally, a jeep or similar
private _vehiclesLightArmed = []; // small, armed utility vehicles; generally, a jeep or similar with mounted weapon
private _vehiclesTrucks = []; // general purpose trucks; used for transport and logistics
private _vehiclesAPCs = []; // armored personnel carriers; generally used for troop transport and support
private _vehiclesTanks = []; // main battle tanks; generally used for heavy fire support and frontline engagements

// Air vehicles
private _vehiclesHelis = []; // helicopters; generally used for transport, reconnaissance, and close air support
private _vehiclesUAVs = []; // unmanned aerial vehicles; generally used for reconnaissance and surveillance

// Static and miscellaneous weapons
private _staticLowWeapons = []; // generally tripod-mounted static machine guns, grenade launchers, or similar
private _staticAT = []; // static anti-tank weapons
private _staticMortars = []; // static mortars
private _staticMortarMagHE = ""; // high-explosive mortar ammunition; must be compatible with the static mortar(s)
private _minefieldAT = []; // anti-tank mines; generally used for area denial and defensive purposes; these are for script-created minefields, not carried by AI troops
private _minefieldAPERS = []; // anti-personnel mines; generally used for area denial and defensive purposes; these are for script-created minefields, not carried by AI troops
private _handGrenades = []; // these are hand grenades dropped by UAV flyovers, NOT carried by rival troops - hence here in vehicles instead of in loadout data

#include "..\Definitions\Riv_Vehicles_SaveToTemplate.sqf"

// Advanced vehicle modifications
// Note: See the documentation in each #include'd file for details
#include "Vehicle_Attributes.sqf" // vehicle attributes allow changing the cost and threat of specific vehicles for a faction if needed

#include "Vehicle_Animations.sqf" // animations are used to add or remove cosmetic elements of a vehicle, e.g. spare tires, radio antennas, camouflage netting, etc

#include "Vehicle_Variants.sqf" // variants are used to select different available textures / skins for vehicles





//////////////////////////
//       Loadouts       //
//////////////////////////

// Note: loadout data for rival templates is basically the same for occupant / invader factions, except that there aren't any specialized tiers
//      Additionally, rival unit templates are somewhat different from those in occupant / invader factions, with some of the templates using more specialized weapons and equipment,
//            and others using more basic / guerilla style weapons and equipment
//      Below is a somewhat standardized example of how most rival templates are structured

private _loadoutData = call _fnc_createLoadoutData;

// Basic equipment

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_INDEP"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["Rangefinder", ["Rangefinder"]];

private _facewear = []; // facewear items used by rival units, e.g., glasses, goggles
private _fullmask = []; // full-face masks used by rival units, e.g. balaclavas, masks
private _headgear = []; // headgear items used by rival units, generally unarmored
private _helmets = []; // helmets used by rival units providing armored protection
private _uniforms = []; // uniforms worn by rival units
private _offUniforms = []; // officer uniforms worn by rival units, generally indicating higher rank or specialized roles
private _vests = []; // vests worn by rival units, providing varying levels of protection and storage capacity
private _heavyVests = []; // heavy vests worn by rival units, providing enhanced protection and storage capacity
private _backpacks = []; // backpacks used by rival units for carrying additional equipment and supplies

_loadoutData set ["facewear", _facewear];
_loadoutData set ["fullmask", _fullmask];
_loadoutData set ["headgear", _headgear];
_loadoutData set ["helmets", _helmets];
_loadoutData set ["uniforms", _uniforms];
_loadoutData set ["offUniforms", _offUniforms];
_loadoutData set ["vests", _vests];
_loadoutData set ["heavyVests", _heavyVests];
_loadoutData set ["backpacks", _backpacks];

// Item sets
// See documentation in occupant template
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadleader_extras", _slItems];
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
private _rifles = []; // standard rifles used by rival units
private _tunedRifles = []; // rifles with specialized modifications or attachments, e.g. scopes, suppressors, or extended magazines
private _enforcerRifles = []; // rifles used by enforcer units within the rival faction (typically more offensive firepower, e.g. large extended mags, grenade launchers, etc)
private _carbines = []; // generally used by vehicle crews, support units, or those requiring a more compact weapon
private _grenadeLaunchers = []; // standalone grenade launchers or those attached to rifles
private _machineGuns = []; // general-purpose machine guns used by rival units
private _marksmanRifles = []; // rifles used by marksman units within the rival faction
private _launchersAT = []; // anti-tank launchers used by rival units
private _launchersAA = []; // anti-air launchers used by rival units
private _launchersHE = []; // high-explosive anti-personnel launchers used by rival units
private _pistols = []; // sidearms used by rival units
private _minesAT = []; // anti-tank mines carried / used by rival units
private _minesAPERS = []; // anti-personnel mines carried / used by rival units
private _lightExplosives = []; // light explosives carried / used by rival units
private _heavyExplosives = []; // heavy explosives carried / used by rival units
private _antiInfantryGrenades = []; // anti-infantry grenades carried / used by rival units
private _smokeGrenades = []; // smoke grenades carried / used by rival units
private _signalSmokeGrenades = []; // signal smoke grenades carried / used by rival units

_loadoutData set ["rifles", _rifles];
_loadoutData set ["tunedRifles", _tunedRifles];
_loadoutData set ["enforcerRifles", _enforcerRifles];
_loadoutData set ["carbines", _carbines];
_loadoutData set ["grenadeLaunchers", _grenadeLaunchers];
_loadoutData set ["machineGuns", _machineGuns];
_loadoutData set ["marksmanRifles", _marksmanRifles];
_loadoutData set ["lightATLaunchers", _launchersAT];
_loadoutData set ["AALaunchers", _launchersAA];
_loadoutData set ["lightHELaunchers", _launchersHE];
_loadoutData set ["sidearms", _pistols];
_loadoutData set ["ATMines", _minesAT];
_loadoutData set ["APMines", _minesAPERS];
_loadoutData set ["lightExplosives", _lightExplosives];
_loadoutData set ["heavyExplosives", _heavyExplosives];
_loadoutData set ["antiInfantryGrenades", _antiInfantryGrenades];
_loadoutData set ["smokeGrenades", _smokeGrenades];
_loadoutData set ["signalSmokeGrenades", _signalSmokeGrenades];





//////////////////////////
//    Misc Loadouts     //
//////////////////////////

// These specialized loadout data hashmaps are only necessary if you want vehicle crew and / or pilots to use different equipment,
//      e.g. uniforms, vests, helmets, weapons, etc from those defined in the default loadout data
//      See documentation in occupant template for more details

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData; // copy of the main loadout data specifically for crew units

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData; // copy of the main loadout data specifically for pilot units





/////////////////////////////////
//        Unit Templates       //
/////////////////////////////////

#include "..\Definitions\Riv_Unit_Templates.sqf"
