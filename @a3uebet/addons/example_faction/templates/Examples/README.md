
# Faction Template Examples

These files are complete, heavily commented examples of the four template
types supported by the addon. Copy the closest example and remove or replace
its class names and pools; do not treat every empty array as a bug because
empty optional capabilities are intentional.

## Which example should I copy?

| Template type | Example | Use it for |
| --- | --- | --- |
| Occupant | [`Example_Occ.sqf`](Example_Occ.sqf) | A conventional enemy faction with militia, police, military, elite, and special-forces progression. |
| Invader | [`Example_Occ.sqf`](Example_Occ.sqf) | An invader faction. It uses the same broad structure as an occupant faction but is registered with `side = "Inv"`; the config demonstrates the inheritance. |
| Rebel | [`Example_Reb.sqf`](Example_Reb.sqf) | The player faction, with a smaller rebel store, starting gear, Petros identity, and no enemy-style war-level tiers. |
| Rival | [`Example_Riv.sqf`](Example_Riv.sqf) | An independent rival faction with rival-specific vehicle keys and a single general force structure. |
| Civilian | [`Example_Civ.sqf`](Example_Civ.sqf) | Civilian ambient units and vehicles used for undercover gameplay and civilian events. |

The registration examples are in [`../../CfgTemplates.hpp`](../../CfgTemplates.hpp).
They show a local `Example_Base` class, an occupant child, an invader child
inheriting from that occupant, and separate rival, rebel, and civilian
children. `basepath` and `file` must match the directory and script filename.

## Shared Definitions

Each example `#include`s several files from [`../Definitions`](../Definitions)
for content that is largely fixed for that faction type: DLC/mod detection,
flag/marker side information, bulk vehicle-to-template saving, and unit role
templates. Declare the `private` variables the includes expect, then let the
include save and generate the rest.

| Faction type | DLC detection | Side information | Vehicle save | Unit templates | Loadout |
| --- | --- | --- | --- | --- | --- |
| Occupant / Invader | `DLC_Content.sqf` | `Side_Information.sqf` | `Vehicles_SaveToTemplate.sqf` | `Unit_Templates.sqf` | Defined inline (tiers vary too much to share) |
| Rebel | Extra checks stay inline | `Reb_Side_Information.sqf` | `Reb_Vehicles_SaveToTemplate.sqf` | `Reb_Unit_Templates.sqf` | `Reb_Loadouts.sqf` |
| Rival | Defined inline if needed | Defined inline (only `name`/`nameLeader`) | `Riv_Vehicles_SaveToTemplate.sqf` | `Riv_Unit_Templates.sqf` | Defined inline |
| Civilian | Defined inline if needed | Not applicable | `Civ_Vehicles_SaveToTemplate.sqf` | `Civ_Unit_Templates.sqf` | Defined inline |

See [`Definitions/README.md`](../Definitions/README.md) for what each include
does and when it is safe to edit versus leave alone.

## Occupant and invader

Start with [`Example_Occ.sqf`](Example_Occ.sqf) for the most complete template.
Edit these sections:

1. Optional DLC/mod checks and soft-compat additions. Common DLC checks come
	from `Definitions/DLC_Content.sqf`; add extra checks directly in the
	template for mods that file doesn't cover.
2. Faction information, including name and spawn marker name. Flag, flag
	texture default, and marker type come from `Definitions/Side_Information.sqf`
	unless overridden.
3. Vehicle and static-weapon pools, including militia, police, air, naval, and
	special-purpose categories. These are saved in bulk by
	`Definitions/Vehicles_SaveToTemplate.sqf`.
4. Identities, generic names, and optional tier-specific faces, voices, and
	insignia.
5. Default loadout data and role-specific item pools.
6. Militia, military, elite, special-forces, police, crew, and pilot loadout
	copies where the faction needs differences between tiers.
7. Unit templates and the final generator call, included from
	`Definitions/Unit_Templates.sqf`.

The invader version has the same requirements. Registering it as `Inv` is
usually the main difference, but review the source template if the faction's
unit progression should differ.

## Rebel

[`Example_Reb.sqf`](Example_Reb.sqf) is intentionally shorter. Rebels acquire
most specialized weapons and vehicles during gameplay, so define the smaller
rebel store pools and civilian undercover pools instead of copying every enemy
category. Flag/marker defaults come from `Definitions/Reb_Side_Information.sqf`,
vehicle pools are saved by `Definitions/Reb_Vehicles_SaveToTemplate.sqf`, the
default loadout hashmap is `Definitions/Reb_Loadouts.sqf`, and the unit roles
and generator call are `Definitions/Reb_Unit_Templates.sqf`. Edit:

- rebel name, flag, texture, and marker;
- rebel-store vehicles, static defenses, mines, and breaching explosives;
- initial arsenal equipment, rebel uniforms, headgear, and AI facewear;
- faces, voices, and generic names;
- Petros identity and weapons;
- one loadout hashmap and the standard rebel unit types.

Simple strings in `initialRebelEquipment` unlock items with unlimited use.
`[classname, count]` entries start with a limited quantity and are replenished
over time. Optional TFAR equipment should be guarded as shown in the example.
For rebel emplacements, the first class in an array is the class actually used.

## Rival

[`Example_Riv.sqf`](Example_Riv.sqf) documents the rival-specific keys such as
`vehiclesRivalsCars`, `vehiclesRivalsAPCs`, `staticLowWeapons`, and
`handGrenadeAmmo`, saved by `Definitions/Riv_Vehicles_SaveToTemplate.sqf`. Rival
factions do not normally need occupant-style militia/military/elite tiers.
Define the rival identities, vehicle/static pools, one main loadout hashmap,
optional crew/pilot copies, role templates, and generator call; the role
templates and generator call live in `Definitions/Riv_Unit_Templates.sqf`.

The rival example also demonstrates `A3A_hasACE` checks, custom role item
pools, and separate crew and pilot loadouts. Preserve the compatibility keys
`mortarMagazineHE` and `mortarAmmo` when the rival mortar scripts require them.

## Civilian

[`Example_Civ.sqf`](Example_Civ.sqf) is the smallest example. Define civilian
vehicle pools, faces, civilian/press/worker/VIP uniforms and headgear, the
civilian loadout hashmap, and the four unit templates: `Man`, `Worker`, `Press`,
and `VIP`. Vehicle pools are saved by `Definitions/Civ_Vehicles_SaveToTemplate.sqf`
and the four unit templates plus generator call live in
`Definitions/Civ_Unit_Templates.sqf`.

Civilian vehicle pools must normally be weighted arrays, for example:

```sqf
private _vehiclesCivCar = [
	 "C_Quadbike_01_F", 0.3,
	 "C_Hatchback_01_F", 7.0,
	 "C_Offroad_01_F", 1.0
];
```

Planes and helicopters are an exception in the current Antistasi behavior and
do not use the same civilian weighting convention. Civilian vehicles also make
them available for rebel undercover use, so only include vehicles that should
be acceptable for that purpose.

## Advanced examples

The vehicle includes can be shared by all faction types when their keys are
valid for that template:

| File | Demonstrates |
| --- | --- |
| [`Vehicle_Attributes.sqf`](Vehicle_Attributes.sqf) | Enemy `cost` and `threat` overrides. |
| [`Reb_Vehicle_Attributes.sqf`](Reb_Vehicle_Attributes.sqf) | Rebel-store `rebCost` overrides. |
| [`Vehicle_Animations.sqf`](Vehicle_Animations.sqf) | Weighted cosmetic animation states. |
| [`Vehicle_Variants.sqf`](Vehicle_Variants.sqf) | Weighted textures, skins, and liveries. |

The detailed syntax and editor workflow for these files is in
[`../README.md`](../README.md#advanced-vehicle-data). The include files can be
copied inline for a small template, but separate files are easier to maintain.

## Editing checklist

| Check | Occupant/Invader | Rebel | Rival | Civilian |
| --- | --- | --- | --- | --- |
| Register correct `side` in config | Yes | Yes | Yes | Yes |
| Set identity and names | Yes | Yes, including Petros | Yes | Faces are usually enough |
| Define vehicle pools | Full enemy pools | Store and civilian pools | Rival pools | Civilian pools |
| Define loadout tiers | Usually | No, one main hashmap | Usually one main hashmap | One civilian hashmap |
| Define role unit templates | Yes | Yes | Yes | Four civilian roles |
| Add advanced vehicle files | Optional | Optional | Optional | Variants/animations often useful |
| Finish with generator call | Yes | Yes | Yes | Yes |

## External references

- [Shared Definitions guide](../Definitions/README.md)
- [Template framework and built-in factions](https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate/tree/main/A3A/addons/core/Templates)
- [Antistasi Ultimate source](https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate)
  for `_fnc_saveToTemplate`, loadout helpers, default vehicle attributes,
  and generated unit definitions.
- [BIS ArmA 3 Wiki](https://community.bohemia.net/wiki/Main_Page) for
  [Scripting Commands](https://community.bohemia.net/wiki/Category:Scripting_Commands_Arma_3),
  [Config Reference](https://community.bohemia.net/wiki/Config_Reference),
  `BIS_fnc_getVehicleCustomization`, and `BIS_fnc_initVehicle`.
- [CBA_A3 Wiki](https://github.com/CBATeam/CBA_A3/wiki) for the config and
  string macros used by the addon.
