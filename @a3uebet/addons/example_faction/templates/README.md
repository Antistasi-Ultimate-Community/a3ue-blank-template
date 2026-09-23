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
| Vehicles and static weapons | Pools used by the chosen faction type | Any unsupported category | Every saved key must use the key expected by Antistasi code. |
| Identities | Faces/voices when units need faction-specific identity | Insignia, tier-specific faces/voices, generic names | Generic names come from `configFile >> CfgWorlds >> GenericNames`. |
| Loadout data | A hashmap created with `_fnc_createLoadoutData` when units are generated | Tier, crew, pilot, or special-purpose copies | Child hashmaps can inherit defaults with `_fnc_copyLoadoutData`. |
| Unit templates | At least the roles passed to the generator | Extra specialist roles | Keep pool keys and unit-template keys synchronized. |
| Final generator call | `_fnc_generateAndSaveUnitsToTemplate` | None for generated units | Pass the prefix, unit types, and appropriate loadout hashmap. |

### Faction-specific minimums

| Faction | Required sections | Commonly optional or reduced |
| --- | --- | --- |
| Occupant / Invader | Side information, enemy vehicle/static pools, identities, default loadouts, war-level loadouts, unit templates, generator call | Police, elite, special-forces, crew/pilot overrides, advanced vehicle files, uncommon vehicle categories |
| Rebel | Rebel identity, rebel-store vehicles/static weapons, starting gear, identities, Petros data, one loadout hashmap, unit templates, generator call | Most enemy vehicle categories, tier loadouts, advanced vehicle files, specialized starting items |
| Rival | Rival name/leader, rival vehicles/static weapons, identities, loadouts, unit templates, generator call | War-level tier loadouts, police data, faction-store data not used by rivals |
| Civilian | Civilian vehicle pools, civilian uniforms/identities, civilian loadout hashmap, `Man`, `Worker`, `Press`, and `VIP` unit templates, generator call | Weapons beyond VIP sidearms, military equipment, enemy vehicles and tier loadouts |

See [`Examples/README.md`](Examples/README.md) for a side-by-side guide and
links to each complete example.

## Vehicles and equipment

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

Avoid changing the supplied unit templates until the loadout system is
understood and tested in game. The helper functions used here are implemented
by Antistasi Ultimate; inspect its `addons/core/Templates` and template
functions for additional supported keys.

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

## References

- [Faction examples](Examples/README.md)
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