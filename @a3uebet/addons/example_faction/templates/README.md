# Template Structure

This guide documents the common SQF structure used by the faction templates in
this addon. Begin with the closest file in [`Examples`](Examples), then use the
tables below as a checklist. The examples are intentionally verbose and are
the best reference for exact key names and helper calls.

## How a template is loaded

`CfgTemplates.hpp` registers a config class under `A3A > Templates`. Its
`basepath` and `file` resolve to one SQF file. Antistasi Ultimate executes that
file with template helper functions in scope. Calls such as
`["vehiclesTanks", _vehiclesTanks] call _fnc_saveToTemplate` write values into
the template hashmap, which is later consumed by Antistasi systems.

The normal order is:

1. Detect optional DLC and mods.
2. Save faction identity and side-specific information.
3. Define vehicle, weapon, equipment, and ammunition pools.
4. Include optional vehicle attributes, animations, and variants.
5. Define identities and names.
6. Create loadout hashmaps and unit templates.
7. Call `_fnc_generateAndSaveUnitsToTemplate`.

Keep definitions before the save or include that consumes them. A soft-compat
vehicle must be added to its array before that array is saved.

## Shared Definitions

Content that rarely changes between factions of the same type, or that should
not normally be edited by hand, has been moved into
[`Definitions`](Definitions) and pulled into each example with `#include`.
This keeps the example scripts focused on the data that actually varies
between factions. Definitions files currently cover:

- DLC/mod detection (`DLC_Content.sqf`)
- Flag and flag-marker side information (`Side_Information.sqf`,
  `Reb_Side_Information.sqf`)
- Bulk `_fnc_saveToTemplate` calls for vehicle pools
  (`Vehicles_SaveToTemplate.sqf` and its `Reb_`/`Riv_`/`Civ_` counterparts)
- Tier-agnostic unit role templates and the final generator call
  (`Unit_Templates.sqf` and its `Reb_`/`Riv_`/`Civ_` counterparts)
- The rebel default loadout hashmap (`Reb_Loadouts.sqf`)

If you need to rename a category, add a new vehicle/equipment pool, add a new
role, or change a flag or marker, see
[`Definitions/README.md`](Definitions/README.md) for exactly what to edit and
what to leave alone. Most template creators only need to declare the
appropriate `private` variables in their own template file; the include files
take care of saving them.

## Sections and requirements

"Required" means required for a useful, valid implementation of that faction
type, not that every individual key must be non-empty. Empty arrays are valid
for capabilities a faction does not have, but a unit generator must not select
from an empty pool unless it has a fallback.

### Common sections

| Section | Required | Optional | Notes |
| --- | --- | --- | --- |
| Faction information | Name; usually flag, flag texture, and marker type | Spawn marker name and other metadata | See `Example_Occ.sqf` and `Example_Reb.sqf`. |
| Mod/DLC checks | Only when optional content is used | All checks | Use `A3A_enabledDLC`, `isClass (configFile >> "CfgPatches" >> ...)`, or loaded-mod information. |
| Vehicles and static weapons | Pools used by the chosen faction type (see [Required Vehicles](#required-vehicles)) | See [Optional Vehicles](#optional-vehicles) | Every saved key must use the key expected by Antistasi code. |
| Identities | Faces/voices when units need faction-specific identity | Insignia, tier-specific faces/voices, generic names | Generic names come from `configFile >> CfgWorlds >> GenericNames`. |
| Loadout data | A hashmap created with `_fnc_createLoadoutData` when units are generated | Tier, crew, pilot, or special-purpose copies | Child hashmaps can inherit defaults with `_fnc_copyLoadoutData`. |
| Unit templates | At least the roles passed to the generator | Extra specialist roles | Keep pool keys and unit-template keys synchronized. |
| Final generator call | `_fnc_generateAndSaveUnitsToTemplate` | None for generated units | Pass the prefix, unit types, and appropriate loadout hashmap. |

### Faction-specific minimums

| Faction | Required sections | Optional or Not Used |
| --- | --- | --- |
| Occupant / Invader | Side information, enemy vehicle/static pools, identities, default loadouts, war-level loadouts (militia/military/elite/sf/police), unit templates, generator call | crew/pilot overrides (depending on unit templates), advanced vehicle files, uncommon vehicle categories |
| Rebel | Rebel identity, rebel-store vehicles/static weapons, starting gear, identities, Petros data, one loadout hashmap, unit templates, generator call | Most enemy vehicle categories, tier loadouts, advanced vehicle files, specialized starting items |
| Rival | Rival name/leader, rival vehicles/static weapons, identities, loadouts, unit templates, generator call | War-level tier loadouts, police data, faction-store data not used by rivals |
| Civilian | Civilian vehicle pools, civilian uniforms/identities, civilian loadout hashmap, `Man`, `Worker`, `Press`, and `VIP` unit templates, generator call | Weapons beyond VIP sidearms, military equipment, enemy vehicles and tier loadouts |

See [`Examples/README.md`](Examples/README.md) for a side-by-side guide and
links to each complete example.

## Vehicles and equipment

Vehicle and static-weapon pools are saved in bulk by
`#include "..\Definitions\Vehicles_SaveToTemplate.sqf"` (or its `Reb_`/`Riv_`/
`Civ_` counterpart). These files use a `SKIP_NIL` macro that only calls
`_fnc_saveToTemplate` for a pool if its `private` variable was actually
declared. To leave out a category entirely, omit the `private` declaration in
your template file instead of editing the include file; to add a brand new
category, see [`Definitions/README.md`](Definitions/README.md).

Use the variable names and save keys shown in the examples. Enemy templates
separate cars, trucks, APCs, IFVs, tanks, aircraft, boats, militia vehicles,
police vehicles, and special-purpose vehicles because Antistasi uses those
categories for spawning and progression. Rebels use a smaller set of store
categories. Rivals use `vehiclesRivals...` keys. Civilians use keys such as
`vehiclesCivCar` and `vehiclesCivIndustrial`.

Vehicles do **not** use weighted-list syntax. To make a vehicle twice as likely
as another, list it twice:

```sqf
private _vehiclesTrucks = ["Truck_01_F", "Truck_01_F", "Truck_02_F"];
```

Static emplacements commonly use the first vehicle in their array. This matters
especially for rebel static MG, AT, AA, and mortar arrays; put the preferred
class first. Ensure mortar and howitzer magazine class names are compatible
with the selected weapon.

### Required Vehicles

**Note:** Required in this context doesn't mean that the game won't load without these. It means code throughout the game (missions, encounters, convoys, patrols, garrisons, attacks / counterattacks, etc) will at least attempt to spawn these on a regular basis. Without these bare minimum classes, the game will either be very broken, very empty, or both.

| Faction | Vehicles |
| --- | --- |
| Occupant / Invader | `_vehiclesBasic`, `_vehiclesLightUnarmed`, `_vehiclesLightArmed`, `_vehiclesTrucks`, `_vehiclesCargoTrucks`, `_vehiclesAmmoTrucks`, `_vehiclesRepairTrucks`, `_vehiclesFuelTrucks`, `_vehiclesMedical`, `_vehiclesAPCs`, `_vehiclesTanks`, `_vehiclesArtillery`, `_magazinesArtillery`, `_vehiclesAA`, `_vehiclesHelisTransport`, `_vehiclesHelisAttack`, `_vehiclesPlanesCAS`, `_vehiclesMilitiaCars`, `_vehiclesMilitiaLightArmed`, `_vehiclesMilitiaTrucks`, `_vehiclesMilitiaAPCs`, `_vehiclesPolice`, `_staticMortars`, `_mortarMagazineHE`, `_mortarMagazineSmoke`, `_mortarMagazineFlare`, `_staticAA`, `_staticAT`, `_staticMGs`, `_minefieldAT`, `_minefieldAPERS` |
| Rebel | `_vehiclesBasic`, `_vehiclesTruck`, `_vehiclesLightUnarmed`, `_vehiclesLightArmed`, `_vehiclesAT`, `_vehiclesAA`, `_vehiclesBoat`, `_vehiclesPlane`, `_vehiclesMedical`, `_staticMG`, `_staticAT`, `_staticAA`, `_staticMortar`, `_staticMortarMagHE`, `_staticMortarMagSmoke`, `_staticMortarMagFlare`, `_minesAT`, `_minesAPERS`, `_breachingExplosivesAPC`, `_breachingExplosivesTank`, at least one of `_vehiclesCivCar` OR `_vehiclesCivTruck` (for undercover travel) |
| Rival | `_vehiclesLightUnarmed`, `_vehiclesLightArmed`, `_vehiclesTrucks`, `_vehiclesAPCs`, `_staticLowWeapons`, `_staticAT`, `_staticMortars`, `_staticMortarMagHE`, `_staticAA`, `_staticMGs`, `_minefieldAT`, `_minefieldAPERS` |
| Civilian | `_vehiclesCivCar`, `_vehiclesCivIndustrial`, `_vehiclesCivRepair`, `_vehiclesCivMedical`, `_vehiclesCivFuel`, `_vehiclesCivBoat` |

### Optional Vehicles

**Note:** These vehicles provide additional functionality to the game when provided, but are not required for a faction.

| Faction | Vehicles |
| --- | --- |
| Occupant / Invader | `_vehiclesLightAPCs`, `_vehiclesIFVs`, `_vehiclesLightTanks`, `_vehiclesHelisLight`, `_vehiclesHelisLightAttack`, `_vehiclesPlanesTransport`, `_vehiclesPlanesAA`, `_vehiclesPlanesLargeCAS`, `_vehiclesPlanesLargeAA`, `_vehiclesPlanesGunship`, `_uavsPortable`, `_uavsAttack`, `_vehiclesTransportBoats`, `_vehiclesGunboats`, `_vehiclesSDV`, `_vehiclesMilitiaAPCs`, `_vehiclesAirPatrol`, `_vehiclesAirborne`, `_vehiclesAmphibious`, `_vehiclesDropPod`, `_staticHowitzers`, `_howitzerMagazineHE` (required if providing `_staticHowitzers`), `_vehicleRadar`, `_vehicleSAM` |
| Rebel | `_vehiclesCivSupply`, `_vehiclesCivHeli`, `_vehiclesCivBoat`, `_vehiclesCivPlane` (for undercover travel) |
| Rival | `_vehiclesTanks`, `_vehiclesHelis`, `_vehiclesUAVs`, `_staticHowitzers`, `_handGrenades` |
| Civilian | `_vehiclesCivPlanes`, `_vehiclesCivHeli` |

## Identities and names

Save faces, voices, and insignia as arrays. Tier-specific values can fall back
to the default arrays when the unit templates are written that way. Generic
names are selected with `_fnc_saveNames`, for example:

```sqf
"TakistaniMen" call _fnc_saveNames;
```

The class must exist under `configFile >> CfgWorlds >> GenericNames`; see the
[BIS config reference](https://community.bohemia.net/wiki/Config_Reference) and
the generic-name classes in Arma 3's config.

## Loadouts and unit templates

`_loadoutData` is a hashmap of pools. Tier-specific copies override only what
they need:

```sqf
private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["U_B_CombatUniform_mcam"]];
```

The names are conventions, but the key passed to `_fnc_setUniform`,
`_fnc_setPrimary`, `_fnc_addItemSet`, and similar helpers must exist in the
hashmap. Recommended pools include uniforms, vests, helmets, facewear, rifles,
carbines, machine guns, launchers, sidearms, magazines, medical sets, and
role-specific extras.

| Loadout data | Required when used by | Optional |
| --- | --- | --- |
| `uniforms`, load-bearing gear, and a primary weapon pool | Most armed unit templates | Specialized role variants such as `slUniforms` or `heavyVests` |
| Medical and miscellaneous item sets | Normal generated units | Custom item sets and role-specific extras |
| Sidearms and their magazines | Unit templates that call `_fnc_setHandgun` | Omit for roles that do not carry sidearms |
| Launcher pools and launcher magazines | AT, AA, or demolition roles | Guided, heavy, or disposable variants |
| Tier copies | Occupant/invader templates using different war-level equipment | Rebels, civilians, and rivals generally use fewer or no tiers |
| Crew/pilot copies | Templates whose crew or pilot unit templates reference them | Use the normal loadout data when no distinction is needed |

Weapon entries follow the Antistasi format:
`[weapon, muzzle, rail, optic, magazines, underbarrelMagazines, bipod]`.
Attachments can be a string, an ordinary array, or a weighted array. An empty
magazine array lets Antistasi attempt automatic magazine selection; a populated
array is used round-robin.

Unit templates map roles to those pools and are passed to the generator:

```sqf
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate]
];
[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
```

In these examples, the role template functions and this final generator call
live in `#include "..\Definitions\Unit_Templates.sqf"` (or its `Reb_`/`Riv_`/
`Civ_` counterpart), included once the faction's loadout hashmap(s) are
defined. The rebel loadout hashmap itself is also shared, in
`Definitions\Reb_Loadouts.sqf`; occupant/invader, rival, and civilian loadout
hashmaps stay inline because their tiers and roles vary too much to share.

Avoid changing the supplied unit templates until the loadout system is
understood and tested in game. The helper functions used here are implemented
by Antistasi Ultimate; inspect its `addons/core/Templates` and template
functions for additional supported keys. See
[`Definitions/README.md`](Definitions/README.md) for what is safe to edit in
those include files.

## Random and weighted pools

`selectRandom` selects uniformly from an array. `selectRandomWeighted` accepts
alternating values and weights:

```sqf
selectRandomWeighted ["helmets", 2, "slHat", 1]
```

This gives `helmets` twice the selection weight of `slHat`. An empty array can
be used as a weighted choice to equip nothing. Weighted arrays also work for
loadout items, attachments, variants, and animations. Do not use this syntax
for vehicle pools; duplicate vehicle class names instead.

`_fnc_fallback` selects the first non-empty pool from a list of hashmap keys:

```sqf
[["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
```

This uses `slRifles` when available and falls back to `rifles`. It is useful for
optional role-specific equipment, but it does not make a completely empty
fallback chain valid. Supply at least one usable item for every required slot.

## Advanced vehicle data

The example files can be included in a template or copied inline:

```sqf
#include "Vehicle_Attributes.sqf"
#include "Vehicle_Animations.sqf"
#include "Vehicle_Variants.sqf"
```

### Attributes

Enemy attributes adjust a vehicle's `cost` and `threat`; rebel attributes use
`rebCost` for the rebel store. The examples are
[`Vehicle_Attributes.sqf`](Examples/Vehicle_Attributes.sqf) and
[`Reb_Vehicle_Attributes.sqf`](Examples/Reb_Vehicle_Attributes.sqf). Antistasi
Ultimate's `addons/core/functions/init/fn_initVarServer.sqf` documents the
default values and is the reference when balancing overrides.

### Animations

Animations toggle cosmetic vehicle parts such as spare wheels, antennas, and
camouflage nets. Define `[vehicleClass, [animationName, weight, ...]]` entries
under `"animations"`. In the Eden editor, customize a vehicle and run
`cursorObject call BIS_fnc_getVehicleCustomization;` to inspect animation names.
The example is [`Vehicle_Animations.sqf`](Examples/Vehicle_Animations.sqf).

### Variants

Variants select textures, paint schemes, or liveries. Define
`[vehicleClass, [variantName, weight, ...]]` entries under `"variants"`.
`BIS_fnc_getVehicleCustomization` and the editor's Export function are useful
ways to obtain valid values. See [`Vehicle_Variants.sqf`](Examples/Vehicle_Variants.sqf)
and the BIS documentation for [`BIS_fnc_initVehicle`](https://community.bohemia.net/wiki/BIS_fnc_initVehicle).

## Soft compatibility and includes

Guard optional content before adding it to a pool. `A3A_enabledDLC` reports DLC
enabled in the Antistasi setup; `isClass` can check a CfgPatches entry; loaded
mod information can check a specific mod. This keeps a faction available when
optional content is not installed.

Small templates may keep all code in one file. Larger templates should use
`#include` files for attributes, animations, variants, or shared data. The
include is preprocessor text substitution, so variables declared in the main
file remain available and included files must be inserted at the correct point.

## Complete example: CUP_ROC

[`Examples`](Examples) is illustrative only; [`CUP_ROC`](CUP_ROC) is a
complete, currently-registered occupant faction built on CUP's Republic of
China Army assets. Its template file, `CUP_AI_ROC.sqf`, follows the same
structure documented above and includes the same `Definitions` files as the
other occupant examples.

CUP_ROC also goes one step further than a template: its folder adds new
reusable game content — retextured uniforms and vests, and a custom map
marker carrying the faction's flag — via its own `config.cpp`, `CfgMarkers.hpp`,
`CfgVehicles.hpp`, `CfgWeapons.hpp`, and `data` textures. That is a different
layer from the template SQF covered in this guide: it defines new classnames
that the template then references, rather than only reusing classnames from
other mods. The faction is also self-contained: it registers itself with its
own `CfgTemplates.hpp`, included from its `config.cpp`, instead of being added
to the shared root `CfgTemplates.hpp`. See [`CUP_ROC/README.md`](CUP_ROC/README.md)
for how those files are structured and how to add your own retextures or
markers.

## References

- [Faction examples](Examples/README.md)
- [Shared Definitions guide](Definitions/README.md)
- [CUP_ROC complete example guide](CUP_ROC/README.md)
- [Antistasi Ultimate source](https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate),
    especially `addons/core/Templates`, template initialization, and loadout
    helper functions.
- [BIS ArmA 3 Community Wiki](https://community.bohemia.net/wiki/Main_Page),
    including [Scripting Commands](https://community.bohemia.net/wiki/Category:Scripting_Commands_Arma_3),
    [Config Reference](https://community.bohemia.net/wiki/Config_Reference),
    [`BIS_fnc_getVehicleCustomization`](https://community.bohemia.net/wiki/BIS_fnc_getVehicleCustomization),
    and [`BIS_fnc_initVehicle`](https://community.bohemia.net/wiki/BIS_fnc_initVehicle).
- [CBA_A3 Wiki](https://github.com/CBATeam/CBA_A3/wiki) for macros such as
    `CSTRING`, `LLSTRING`, `GVAR`, and `QPATHTO_T`.