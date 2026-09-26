//////////////////////////
//   DLC / Mod Content  //
//////////////////////////

#include "..\Definitions\DLC_Content.sqf" // definitions for DLC and mod content availability, e.g. _hasWS indicating that Western Sahara DLC is loaded and enabled

// This can also be used to check if a particular mod is loaded in a few different ways, like so:
private _hasQAV = "@QAV - Challenger 2" in (getLoadedModsInfo apply {_x select 1}); // QAV - Challenger 2 mod is loaded
private _hasTFAR = isClass (configFile >> "CfgPatches" >> "task_force_radio"); // TFAR mod is loaded





//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Faction Name"] call _fnc_saveToTemplate; // faction name as shown on the map and in game dialogs; should be short
["spawnMarkerName", format [localize "STR_supportcorridor", "Faction Name"]] call _fnc_saveToTemplate; // should match the faction name; will show in game as "Faction Name Support Corridor"
["flagTexture", "a3\data_f\flags\flag_nato_co.paa"] call _fnc_saveToTemplate; // path to the faction's flag texture
#include "..\Definitions\Side_Information.sqf" // definitions for side information, e.g. flag and flag marker classnames




//////////////////////////
//       Vehicles       //
//////////////////////////

// Note: vehicles do not support weighted lists; therefore, if you want a certain vehicle to have higher chance of being used than others, simply add it to the arry more than once
//      Example: _vehiclesTrucks = ["Truck_01_F", "Truck_01_F", "Truck_02_F"]; // Truck_01 should be selected about twice as often as Truck_02

// General equipment
private _ammobox = ""; // the outpost / milbase / airport ammo crate
private _surrenderCrate = ""; // the crate / box dropped by surrendered units
private _equipmentBox = ""; // the equipment crate at military administrations
private _smallBunker = ""; // the small bunker object used for roadblocks
private _sandbag = ""; // the sandbag object used for fortifications and roadblocks
private _sandbagRound = ""; // the round sandbag object used for mortar pits

// Ground vehicles
private _vehiclesBasic = []; // small, unarmed transport vehicles; generally, a quad bike, motorcycle, or similar
private _vehiclesLightUnarmed = []; // small, unarmed utility vehicles; generally, a jeep or similar
private _vehiclesLightArmed = []; // small, armed utility vehicles; generally, a jeep or similar with mounted weapon; most often encountered in patrols, roadblocks, and at outposts in early game
private _vehiclesTrucks = []; // larger transport vehicles; e.g. a Ural truck or similar; often seen in convoys transporting troops
private _vehiclesCargoTrucks = []; // larger cargo trucks for transporting supplies or equipment; e.g. a flatbed HEMTT
private _vehiclesAmmoTrucks = []; // vehicles (usually, but not always trucks) designed for transporting ammunition; used in ammo truck missions / convoys
private _vehiclesRepairTrucks = []; // vehicles (usually, but not always trucks) designed for repairing other vehicles; used in repair missions / convoys
private _vehiclesFuelTrucks = []; // vehicles (usually, but not always trucks) designed for transporting fuel; useful to fuel other vehicles in the field or in the garage when captured
private _vehiclesMedical = []; // medevac vehicles (usually a truck or APC); should only be ground vehicles

// Armored vehicles
// Note: the differences between Light APCs, APCs, and IFVs are subtle and most modsets do not provide enough variety in vehicles to necessitate the distinction in many cases.
//       Assuming sufficient unique vehicles, generally light APCs will be modern APCs whose value is derived from their armor rather than their armament, i.e. the focus is on armored *transport*. An example would be an unarmed M113.
//       APCs are similarly armored, but generally with light armament, e.g. a machine gun or missile. An example would be an M113 with M2 machine gun or TOW missile.
//       IFVs are generally distinguished by similar (light) armor to an APC, but with heavier armament, e.g. an autocannon, designed for frontline combat support after transporting troops. The quintessential example would be a BMP derivative or perhaps a Bradley,
//            though in many cases a Bradley would be better suited as a light tank due to its *significantly* heavier armor and armament. See light tanks below.
//       Sometimes, the dividing line between Light APCs and standard APCs can also be based on modernity, with legacy vehicles like a BTR-60 being considered a light APC while BTR-80 fulfills the APC role;
//            however, it may make more sense to focus splits based on age on militiaXXX vehicles than here (see section below for militia vehicles).
private _vehiclesLightAPCs = []; // light armored personnel carriers; generally, lightly armed or unarmed but more heavily armored than cars / trucks; used for troop transport
private _vehiclesAPCs = []; // armored personnel carriers; generally, more heavily armed and armored than light APCs; used for troop transport and combat support
private _vehiclesIFVs = []; // infantry fighting vehicles; generally, more heavily armed than APCs; used for frontline combat and troop support
// Note: the difference between light tanks and tanks is very similar to the difference between APCs and IFVs; generally, light tanks are less heavily armed and armored than tanks.
//       Militia tanks are not supported, so distinctions here can also be made based on age (older designs are generally smaller and less heavily armed and armored).
private _vehiclesLightTanks = []; // light tanks; generally, less heavily armed and armored than main battle tanks
private _vehiclesTanks = []; // main battle tanks; heavily armed and armored; used for frontline combat and breakthrough operations

// Miscellaneous ground vehicles
private _vehiclesArtillery = []; // long-range indirect fire support vehicles; generally either rocket artillery or self-propelled howitzers; may be armored or not (e.g. a BM-21 or 2S1 Gvozdika)
private _magazinesArtillery = createHashMapFromArray [ // magazines is used to define the ammunition available for each type of vehicle in vehiclesArtillery; see ROC faction example for reference
    ["artilleryVehicleClassname", ["ammoForArtilleryVehicle", "anotherAmmoForArtilleryVehicle"]],
    ["anotherArtilleryVehicleClassname", ["ammoForAnotherArtilleryVehicle"]]
];
private _vehiclesAA = []; // self-propelled anti-aircraft vehicles; used for engaging enemy aircraft; may be armed with missiles, autocannons, or both; e.g. a Gepard or Tunguska

// Air vehicles
private _vehiclesHelisLight = []; // small and light helicopters; used for general reconnaissance and light transport; e.g. an MD-500 / MH-6 Little Bird
private _vehiclesHelisLightAttack = []; // small and light attack helicopters; often rocket and / or machine gun armed; used for light attack and close air support; e.g. an AH-6 Little Bird / OH-58 Kiowa
private _vehiclesHelisTransport = []; // larger transport helicopters; can generally carry >4 troops; may be armed or unarmed, but generally only light weapons; e.g. a UH-60 Black Hawk / CH-47 Chinook
private _vehiclesHelisAttack = []; // dedicated attack helicopters; heavily armed with rockets, missiles, and machine guns; used for frontline combat and close air support; e.g. an AH-64 Apache / Mi-24 Hind
private _vehiclesPlanesTransport = []; // transport planes; used for personnel and/or vehicle airdrops
private _vehiclesPlanesCAS = []; // close air support planes; used for attacking ground targets with strafing / bombing attacks; e.g. an A-10 Thunderbolt II / Su-25 Frogfoot
private _vehiclesPlanesAA = []; // anti-aircraft planes / CAP (Close Air Patrol); used for engaging enemy aircraft; e.g. an F-15 Eagle / MiG-29 Fulcrum
private _vehiclesPlanesLargeCAS = []; // CAS plane that is larger and must be spawned on airstrip instead of in a hangar
private _vehiclesPlanesLargeAA = []; // large CAP that is larger and must be spawned on airstrip instead of in a hangar
private _vehiclesPlanesGunship = []; // gunship planes; heavily armed with cannons and/or machine guns for attacking ground targets in a slow patrol / orbiting fashion; e.g. an AC-130 Spectre
private _uavsPortable = []; // portable UAVs; generally small and used for reconnaissance; can be deployed by infantry units; should be air vehicles, not ground UGVs
private _uavsAttack = []; // attack UAVs; generally armed with missiles or rockets; used for engaging enemy ground targets

// Naval vehicles
private _vehiclesTransportBoats = []; // transport boats; used for personnel and/or vehicle transport over water; generally small and unarmed
private _vehiclesGunBoats = []; // gunboats; armed for engaging enemy forces on water; generally equipped with machine guns and/or grenade launchers; used for patrolling harbors / bays / rivers / seaports
private _vehiclesSDV = []; // small submersible vehicles

// Static and special weapons
private _staticMortars = []; // static mortar emplacements; generally located at outpost, milbases, and airbases
private _mortarMagazineHE = ""; // high-explosive mortar round classname; must be compatible with the static mortars; note that this is a single classname, not an array
private _mortarMagazineSmoke = ""; // smoke mortar round classname; must be compatible with the static mortars; note that this is a single classname, not an array
private _mortarMagazineFlare = ""; // illumination mortar round classname; must be compatible with the static mortars; note that this is a single classname, not an array
private _staticHowitzers = []; // static howitzer emplacements; generally, much larger caliber / larger gun than mortars
private _howitzerMagazineHE = ""; // high-explosive howitzer round classname; must be compatible with the static howitzers; note that this is a single classname, not an array
private _staticAA = []; // static anti-aircraft emplacements; used for engaging enemy aircraft; e.g. a ZSU-23-4 Shilka
private _staticMGs = []; // static machine gun emplacements; used for engaging enemy infantry and light vehicles; e.g. an M2 Browning .50 cal; generally used in roadblocks and outposts
private _staticAT = []; // static anti-tank emplacements; used for engaging enemy armored vehicles; e.g. an ATGM launcher or a recoilless rifle
private _vehicleRadar = ""; // static radar emplacement; used for detecting and tracking enemy vehicles and aircraft; should be datalink capable to link with anti-aircraft emplacements / vehicles; note that this is a single classname, not an array
private _vehicleSAM = ""; // static surface-to-air missile emplacement; used for engaging enemy aircraft; should be datalink capable to link with radar; note that this is a single classname, not an array
private _minefieldAT = []; // anti-tank mines
private _minefieldAPERS = []; // anti-personnel mines

// Militia vehicles
// Note: Antistasi factions consist of several "tiers" of troops with increasingly better arms, armor, and equipment as war level rises. This will be covered in more detail below.
//       Here, it is only important to know that in the very early game, players will be facing militia forces. Generally, militia forces use older, less advanced and capable vehicles.
//       If the faction has sufficient variety in vehicles, generally the militia tier should use older designs, but the distinction can be made according to the vision of the template creator.
//       Following the example above, the militia APCs may be older BTR-40s rather than more modern BTR-60 / BTR-80. Similarly, militia cars may be UAZs while standard troops use TIGRs.
private _vehiclesMilitiaCars = []; // basic utility vehicles; generally unarmed and with 3-4 seats
private _vehiclesMilitiaLightArmed = []; // lightly-armed utility vehicles
private _vehiclesMilitiaTrucks = []; // basic transport trucks; may be armed or unarmed
private _vehiclesMilitiaAPCs = []; // armed or unarmed APCs

// Police vehicles
private _vehiclesPolice = []; // police vehicles; generally equipped with sirens and lights; should only be ground vehicles; used in and around cities

// Special usage vehicles
private _vehiclesAirPatrol = []; // air vehicles (should be helicopters) that patrol / may be involved as part of convoy movements
private _vehiclesAirborne = []; // ground vehicles that are air-deployable, i.e. can be paradropped; generally these are light APCs or IFVs that will transport troops into combat zones
private _vehiclesAmphibious = []; // amphibious vehicles; capable of operating both on land and in water; generally but not always APCs; Note: these are not actually used anywhere at this time
private _vehiclesDropPod = []; // drop pods (think space marines); used in unfair / scifi orbital qrf supports

// Advanced vehicle modifications
// Note: See the documentation in each #include'd file for details
#include "Vehicle_Attributes.sqf" // vehicle attributes allow changing the cost and threat of specific vehicles for a faction if needed

#include "Vehicle_Animations.sqf" // animations are used to add or remove cosmetic elements of a vehicle, e.g. spare tires, radio antennas, camouflage netting, etc

#include "Vehicle_Variants.sqf" // variants are used to select different available textures / skins for vehicles

if (_hasQAV) then { _vehiclesTanks pushBack "acm_gm_aaf2028_afor_gb_tracked_qav_challenger2" }; // add the challenger 2 tank to tanks array only if the QAV - Challenger 2 mod is loaded, *before* we add the vehicle data to the faction hashmap below

#include "Vehicles_SaveToTemplate.sqf" // save all vehicle arrays to the faction template





/////////////////////
///  Identities   ///
/////////////////////

private _faces = []; // default faces / heads used for troops in this faction; will always be used for militia; will be used for other tiers if their own faces are not defined
private _milFaces = []; // faces / heads used for military tier troops
private _eliteFaces = []; // faces / heads used for elite tier troops
private _sfFaces = []; // faces / heads used for special forces tier troops
private _polFaces = []; // faces / heads used for police tier troops

private _voices = []; // default voices used for troops in this faction; will always be used for militia; will be used for other tiers if their own voices are not defined
private _milVoices = []; // voices used for military tier troops
private _eliteVoices = []; // voices used for elite tier troops
private _sfVoices = []; // voices used for special forces tier troops
private _polVoices = []; // voices used for police tier troops

private _insignia = []; // uniform insignia used for troops in this faction; will always be used for militia; will be used for other tiers if their own insignia are not defined; only works with supported uniforms
private _milInsignia = []; // insignia used for military tier troops
private _eliteInsignia = []; // insignia used for elite tier troops
private _sfInsignia = []; // insignia used for special forces tier troops
private _polInsignia = []; // insignia used for police tier troops

["faces", _faces] call _fnc_saveToTemplate;
["milFaces", _milFaces] call _fnc_saveToTemplate; // remove if not using
["eliteFaces", _eliteFaces] call _fnc_saveToTemplate; // remove if not using
["sfFaces", _sfFaces] call _fnc_saveToTemplate; // remove if not using
["polFaces", _polFaces] call _fnc_saveToTemplate; // remove if not using
["voices", _voices] call _fnc_saveToTemplate; 
["milVoices", _milVoices] call _fnc_saveToTemplate; // remove if not using
["eliteVoices", _eliteVoices] call _fnc_saveToTemplate; // remove if not using
["sfVoices", _sfVoices] call _fnc_saveToTemplate; // remove if not using
["polVoices", _polVoices] call _fnc_saveToTemplate; // remove if not using
["insignia", _insignia] call _fnc_saveToTemplate;
["milInsignia", _milInsignia] call _fnc_saveToTemplate; // remove if not using
["eliteInsignia", _eliteInsignia] call _fnc_saveToTemplate; // remove if not using
["sfInsignia", _sfInsignia] call _fnc_saveToTemplate; // remove if not using
["polInsignia", _polInsignia] call _fnc_saveToTemplate; // remove if not using

"TakistaniMen" call _fnc_saveNames; // names used for the troops in this faction. Names must be defined in a class within configFile >> CfgWorlds >> GenericNames; If this line is not included, faction will use default ArmA 3 Greek names





//////////////////////////
//       Loadouts       //
//////////////////////////

// Note: Loadout data hashmaps contain all the clothing, weapons, and other equipment that a faction's troops use in the various tiers
//       The default loadout data hashmap (_loadoutData) contains default equipmment and equipment for special uses that are not defined in the tier-specific hashmaps, e.g. traitor uniforms
//       Each tier of troops also has its own loadout data hashmap that is initialized as a copy of the default _loadoutData, e.g. _policeLoadoutData or _militaryLoadoutData
//       Any key in the tier-specific loadout data hashmap that is not overridden will use the data specified in the default _loadoutData hashmap
//       For example, if a faction default uniform is set in the default hashmap with 
//           _loadoutData set ["uniforms", ["default_uniform"]];
//       all other tiers will _also_ use this uniform unless they set override it, e.g.
//           _militaryLoadoutData set ["uniforms", ["military_uniform"]];
//
//       Additionally, loadout data allows the use of weighted arrays to bias the selecvtion of certain items
//       For example, if a faction should use certain headgear at a 2:1:1 ratio, it may be set like
//           _loadoutData set ["headgear", ["headgear1", 2, "headgear2", 1, "headgear3", 1]];
//
//      Important note regarding hashmap key names:
//      The keys used in the loadout data hashmaps are mostly (but not entirely) standardized, but not all that you may see in the templates included with Antistasi Ultimate are required.
//      The keys **must** match between the loadout data hashmaps and the unit templates located at the bottom of the faction template files (see unit templates below).
//      For example, all loadouts *should* contain headgear for the faction. You may see this referred to as "hats", "slHats" (for squad leaders), "headgear", "helmets", etc
//      The name doesn't actually matter, as long as it's used in the unit templates. If squad leaders don't need unique hats, simply omit defining _slHats. If medics should have their own unique hats, consider adding _medHats.
//      This allows for a lot of flexibility for faction template createors to achieve their vision for a faction;
//      however, modifying unit templates is an advanced exercise that should be left to experienced creators. Therefore, for consistency and standardization, the keys / variable names below
//          are the recommended names and should not be changed unless you know exactly what you're doing.

private _loadoutData = call _fnc_createLoadoutData; // create the initial, default faction loadout data hashmap

// Basic Equipment
_loadoutData set ["maps", []]; // topographic maps for navigation
_loadoutData set ["compasses", []]; // compasses for navigation
_loadoutData set ["radios", []]; // communication devices
_loadoutData set ["binoculars", []]; // optical devices for observation
_loadoutData set ["rangefinders", []]; // devices for measuring distances
_loadoutData set ["gpses", []]; // GPS devices for navigation
_loadoutData set ["NVGs", []]; // night vision goggles for low-light operations

_loadoutData set ["traitorUniforms", []]; // uniforms used by traitor units
_loadoutData set ["traitorVests", []]; // vests used by traitor units
_loadoutData set ["traitorHats", []]; // hats used by traitor units

_loadoutData set ["officerUniforms", []]; // uniforms used by officer units
_loadoutData set ["officerVests", []]; // vests used by officer units
_loadoutData set ["officerHats", []]; // hats used by officer units

_loadoutData set ["cloakUniforms", []]; // not required, but generally used for patrol sniper unit templates
_loadoutData set ["cloakVests", []]; // not required, but generally used for patrol sniper unit templates
_loadoutData set ["cloakHats", []]; // not required, but generally used for patrol sniper unit templates

_loadoutData set ["uniforms", []]; // standard uniforms for regular units
_loadoutData set ["slUniforms", []]; // uniforms for squad leaders
_loadoutData set ["mgVests", []]; // vests for machine gunners
_loadoutData set ["medVests", []]; // vests for medics
_loadoutData set ["slVests", []]; // vests for squad leaders
_loadoutData set ["sniVests", []]; // vests for snipers
_loadoutData set ["glVests", []]; // vests for grenadiers
_loadoutData set ["engVests", []]; // vests for engineers
_loadoutData set ["vests", []]; // general-purpose vests for regular units
_loadoutData set ["backpacks", []]; // standard backpacks for regular units
_loadoutData set ["longRangeRadios", []]; // long-range radio (backpacks) for communication
_loadoutData set ["atBackpacks", []]; // anti-tank backpacks (generally larger to carry multiple rockets / missiles)
_loadoutData set ["slBackpacks", []]; // backpacks for squad leaders
_loadoutData set ["helmets", []]; // standard helmets for regular units
_loadoutData set ["slHat", []]; // hats for squad leaders
_loadoutData set ["sniHats", []]; // hats for snipers
_loadoutData set ["glasses", []]; // standard glasses for regular units
_loadoutData set ["goggles", []]; // standard goggles for regular units

// Item sets
// these are predefined sets of items defined in Antistati Ultimate itself that can be added to certain types of units based on rols
// Medical item sets may be either "BASIC", "STANDARD", or "MEDIC" with increasing levels of medical supplies and capabilities for each. The exact contents depend on whether ACE mod is loaded or not
// Misc essentials item set contains earplugs, map tools, cable ties, and a flashlight if ACE is loaded
// If you wish to define your own item sets, simple replace the function calls with your custom item arrays or functions that return item arrays., e.g.
//      _loadoutData set ["items_medical_medic", ["medical_item_1", "medical_item_2", "medical_item_3"]];
// or
//      _loadoutData set ["items_custom", [] call A3A_fnc_itemset_custom];
// and ensure you update the unit template(s) to use your item set
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

// Unit-specific items
// As mentioned before, unit templates at the bottom of this file will be used to define which items from loadout data a specific type of unit will use,
//       e.g. a sniper will user sniper rifles, a machine gunner will use machine guns, etc.
// When the game is started, loadouts are generated for each type of unit and each tier of troops. Therefore, the unit templates define what each type of equipment each specific type of unit uses,
//      and the tier-specific loadout data hashmap determines which item of that type the unit will be equipped with.
// While all unit types have minimum equipment requirements (e.g. uniform, load-bearing equipment, weapons, etc), some unit classes require additional specialty equipment
// The unit classes most often given their own specialty equipment are squad leaders, explosives experts / engineers, and marksmen / snipers
// Note that this is effectively doing the same thing as item sets, with the distinction being that item sets generally refer to the standardized sets provided by functions **outside** of the faction template,
//      while these are defined as basic arrays within the faction template itself.
//      The other distinction is that *in general*, item sets are added to ALL troops in a faction, though their exact composition may differ according to type of troop (most troops get "STANDARD" medical supplies while others get "BASIC" or "MEDIC" level),
//          whereas unit-specific extras are only added to the specific types of units that require them.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = ["SpecialSniperEquipment"];

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
_loadoutData set ["rifles", []]; // standard infantry rifles
_loadoutData set ["carbines", []]; // shorter rifles, usually less capable but lighter and more maneuverable; used by specialty troops like medics or vehicle crews
_loadoutData set ["SMGs", []]; // submachine guns, generally low caliber but fast firing; typically used by close-quarters specialists or specialty troops as above
_loadoutData set ["machineGuns", []]; // fully automatic weapons designed for sustained fire, typically used by support troops
_loadoutData set ["marksmanRifles", []]; // precision rifles used by designated marksmen within a squad
_loadoutData set ["sniperRifles", []]; // high-caliber rifles used by snipers for long-range engagements
_loadoutData set ["sidearms", []]; // pistols and other small, easily carried secondary weapons
_loadoutData set ["grenadeLaunchers", []]; // launchers designed to fire grenades, typically attached to rifles or used as standalone weapons
_loadoutData set ["lightATLaunchers", []]; // anti-tank weapons; generally disposable / one-shot and lighter than more capable launchers (e.g. M72 LAW)
_loadoutData set ["ATLaunchers", []]; // reusable anti-tank weapons, typically more versatile than light launchers but not auto-homing (e.g. RPG-7)
_loadoutData set ["missileATLaunchers", []]; // guided anti-tank weapons, typically more accurate and effective than unguided launchers
_loadoutData set ["AALaunchers", []]; // anti-aircraft weapons, generally used to target low-flying aircraft
_loadoutData set ["missileAALaunchers", []]; // guided anti-aircraft weapons, typically more accurate and effective than unguided launchers
_loadoutData set ["antiInfantryGrenades", []]; // grenades designed to target enemy personnel (e.g. fragmentation or concussion grenades)
_loadoutData set ["smokeGrenades", []]; // grenades that produce smoke for signaling or concealment
_loadoutData set ["signalSmokeGrenades", []]; // smoke grenades specifically used for signaling purposes (e.g. colored smoke grenades)
_loadoutData set ["ATMines", []]; // anti-tank mines, designed to disable or destroy armored vehicles
_loadoutData set ["APMines", []]; // anti-personnel mines, designed to target enemy infantry
_loadoutData set ["lightExplosives", []]; // small explosive devices, typically used for breaching
_loadoutData set ["heavyExplosives", []]; // large explosive devices, typically used for demolition or anti-vehicle purposes

// A note on structuring weapon data:
//      The format of weapon data is extremely important.
//      Each weapon entry should follow this format:
//            ["weaponClassName", "muzzleDeviceClassName", "railAttachmentClassName", "opticClassName", ["magazineClassName1", "magazineClassName2", ...], ["underbarrelMagazineClassName1", "underbarrelMagazineClassName2", ...], "bipod"];
//      Example:
//            ["arifle_MX_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_blk"];
//
//      - Weapon class name must be defined as a string
//      - Muzzle device (flash hider, muzzle brake, suppressor) may be defined as a string classname (e.g. "muzzle_snds_H"), an array of classnames from which one will be randomly selected (e.g. ["muzzle_snds_H", "muzzle_snds_M"]), a weighted array of classnames (e.g. [["muzzle_snds_H", 0.7, "muzzle_snds_M", 0.3]), or left as an empty string ("") if no muzzle device is desired.
//      - Rail attachment (usually lights or laser pointers) may be defined similarly to the muzzle device.
//      - Optic may be defined similarly to the muzzle device and rail attachment.
//      - Magazines must be defined as an array. If an empty array is specified ([]), Antistasi will attempt to automatically equip the weapon with appropriate magazines. Otherwise, it should be an array of strings, each representing a magazine class name. Magazines will be added to the unit in round-robin fasion; e.g. ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"] where two standard mags will be added, then a tracer mag, and so on until the appropriate amount of mags are given to the unit
//      - Underbarrel magazines (such as grenades for an underbarrel grenade launcher) are defined in the same way as regular magazines. If the weapon does not have a secondary muzzle / underbarrel, simply use an empty array ( [] )
//      - Bipod must be defined as a string classname (e.g. "bipod_01_F_blk"), or left as an empty string ("") if no bipod is desired.
//
//      Arrays (regular or weighted) may be defined outside of the weapon entry and referenced within it by variable name. This can help reduce redundancy and make it easier to update multiple weapons that share the same attachments or magazines.
//      For example, 
//            _muzzleDevices = ["muzzle_snds_H", "muzzle_snds_M"];
//            _railAttachments = ["acc_pointer_IR", 2, "acc_flashlight", 1];
//            _optics = ["optic_Hamr", "optic_ACO"];
//            ["arifle_MX_F", _muzzleDevices, _railAttachments, _optics, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_blk"];
//
//      Lastly, each weapon key within the loadout data hashmap should be set to an array of weapon entry arrays, thay may or may not be weighted
//      For example, squad leader rifles might be weighted like so:
//            _militaryLoadoutData set ["slRifles", [
//                  ["arifle_MX_F", _muzzleDevices, _railAttachments, _optics, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_blk"], 1,
//                  ["arifle_MX_Black_F", _muzzleDevices, _railAttachments, _optics, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_blk"], 2
//            ]];
//     In this case, squad leaders use black MX rifles at a 2:1 ratio to standard tan MX rifles.
//     Alternatively, they could be unweighted, meaning each weapon has an equal chance of being selected:
//            _militaryLoadoutData set ["slRifles", [
//                  ["arifle_MX_F", _muzzleDevices, _railAttachments, _optics, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_blk"],
//                  ["arifle_MX_Black_F", _muzzleDevices, _railAttachments, _optics, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_blk"]
//            ]];





////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // create a copy of the base loadout data for militia-specific modifications
// The rest of this section would include militia-specific overrides for uniforms, vests, rifles, SMGs, and other equipment, similar to how it was done for the military loadout data

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // create a copy of the base loadout data for military-specific modifications

// Note: keep in mind, everything in this section is either overriding what was defined for the default loadout data, or adding data where nothing was defined in the default loadout data
//      Thus, if a certain type of equipment does not need to be different from the default, it does not need to be re-defined here;
//            however, keep in mind that each tier (militia, police, military, elite, special forces) should contain unique equipment and weapons for variety in game play.
//      Additionally, equipment should *generally* improve in capability as one progresses through the tiers, reflecting the increasing skill and resources available to higher-tier units.
//      For example, optics and suppressors on weapons may be extremely rare for militia units, used seldomly or for specific military units, and near ubiquitous for elite and special forces units.
//      Most templates included with Antistasi Ultimate follow this pattern; however, an extender creator may equip the faction however they desire to achieve their vision.
//
//      For each tier-specific loadout data, generally you'll include uniform, equipment, and weapon overrides. The following is just an example of what that may look like,
//            but very minimal.

_militaryLoadoutData set ["uniforms", ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_tshirt"]]; // military-specific uniforms
_militaryLoadoutData set ["vests", ["V_PlateCarrier1_rgr", 2, "V_PlateCarrier2_rgr", 1]]; // military-specific vests

_militaryLoadoutData set ["rifles", [
    ["arifle_MX_F", _muzzleDevices, _railAttachments, _optics, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_blk"],
    ["arifle_MX_Black_F", _muzzleDevices, _railAttachments, _optics, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_blk"],
    ["arifle_MXC_F", _muzzleDevices, _railAttachments, _optics, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_blk"]
]];

private _milSMGOptics = ["optic_Holosight", 2, "optic_ACO_grn", 2, "optic_MRD", 1];
_militaryLoadoutData set ["SMGs", [
    ["SMG_01_F", "", _railAttachments, _milSMGOptics, ["30Rnd_45ACP_Mag_SMG_01"], [], "bipod_01_F_blk"]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; // create a copy of the base loadout data for elite-specific modifications
// The rest of this section would include elite-specific overrides for uniforms, vests, rifles, SMGs, and other equipment, similar to how it was done for the military loadout data.

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

// Note: this shows how you could have the special forces loadout data build upon the elite loadout data instead of the default loadout data.
//      This is not required, just another option if one tier should be very similar to another.
private _sfLoadoutData = _eliteLoadoutData call _fnc_copyLoadoutData; // create a copy of the elite loadout data for special forces-specific modifications
// The rest of this section would include special forces-specific overrides for uniforms, vests, rifles, SMGs, and other equipment, similar to how it was done for the military loadout data.

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // create a copy of the base loadout data for police-specific modifications
// The rest of this section would include police-specific overrides for uniforms, vests, rifles, SMGs, and other equipment, similar to how it was done for the military loadout data.
// Note that police unit templates are different from all the rest of the tiers, in that there are *generally* only two police unit templates instead of several;
//      therefore, police loadout data generally does not need to include as many different types of weapons, etc
//      Refer to unit templates below - generally police tier will only have squad leader and patrolman templates, most commonly armed with shotguns, SMGs, carbines, and sidearms
//      However, some extensions to Antistasi Ultimate may introduce additional mechanics for the police tier, including specialized troops like SWAT units.
//      It does not hurt anything (except for inconsequentual load time overhead) to include extra data here, that may or may not be used in the mod now or in the future.

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

// Note: crew loadout data is used for vehicle crew members / drivers / pilots, e.g. for helicopter, APC, and tank crews
//      Some templates separate _crewLoadoutData and _pilotLoadoutData, while some templates use just one. Again, it doesn't matter as long as the unit templates are updated to match.
//      Here, we leave them separate for simplicity.

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // create a copy of the military loadout data for crew-specific modifications
// The rest of this section would include crew-specific overrides for uniforms, vests, rifles, SMGs, and other equipment, similar to how it was done for the military loadout data.

private _pilotLoadoutData = _crewLoadoutData call _fnc_copyLoadoutData; // create a copy of the crew loadout data for pilot-specific modifications
// The rest of this section would include pilot-specific overrides for uniforms, vests, rifles, SMGs, and other equipment, similar to how it was done for the military loadout data.





/////////////////////////////////
//        Unit Templates       //
/////////////////////////////////

// Note: unit templates are where we define which keys / variables within the loadout data hashmap are used for each type of unit by role
//      They are tier-agnostic, meaning the same unit template can be used across different tiers (e.g., military, police, crew) without modification.
//      For example, this is the section where we define that squad leaders use _slHats for their headgear, _slVests for their vests, etc.
//      It is recommended not to modify these templates (or anything else left in this template file) until you have a thorough understanding of how the loadout system works,
//            and have already tested your changes in-game.
//
// See ..\Definitions\Unit_Templates.sqf for the default structure and examples of unit templates.

#include "..\Definitions\Unit_Templates.sqf"
