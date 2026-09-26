# Shared Definitions

These files hold content that is largely fixed for a given faction type, or
that shouldn't be modified without understanding the wider loadout/template
system. The example scripts in [`../Examples`](../Examples) pull them in with
`#include` so the example files themselves only contain the data that
actually differs between factions. See [`../README.md`](../README.md) and
[`../Examples/README.md`](../Examples/README.md) for how these fit into a
full template.

Most new factions never need to edit these files directly. Copy the closest
example, declare the `private` variables it expects, and the includes take
care of saving and generating the rest. Edit an include only when you need a
capability it doesn't already provide.

## The `SKIP_NIL` pattern

The vehicle-save files use this macro:

```sqf
#define SKIP_NIL(name, data) if (!isNil QUOTE(data)) then { [name, data] call _fnc_saveToTemplate }
```

`isNil` checks whether the `private` variable was ever declared, not whether
the array is empty. This means a vehicle/equipment category is included only
if you declared its variable in your template file. **To drop a category
entirely, just don't declare that `private` variable** — do not edit the
include file. To add a brand-new category, declare the variable in your
template file *and* add a matching `SKIP_NIL(...)` line here, keeping the
saved key name identical to what Antistasi Ultimate expects.

## Files

### `DLC_Content.sqf`

Declares `private` booleans (`_hasWs`, `_hasMarksman`, `_hasTanks`, etc.) for
every official DLC that Antistasi Ultimate can detect via `A3A_enabledDLC`.
Included near the top of occupant/invader templates, before any soft-compat
vehicle or equipment additions that depend on them.

Edit this file only to add detection for a DLC that isn't listed yet. Checks
for non-DLC mods (`isClass (configFile >> "CfgPatches" >> ...)`, loaded-mod
info) are mod-specific and should stay inline in the template that needs them,
as shown for `_hasQAV` and `_hasTFAR` in the examples.

### `Side_Information.sqf` / `Reb_Side_Information.sqf`

Save the faction's flag object and flag-marker classnames
(`["flag", ...]` / `["flagMarkerType", ...]`). These rarely change: the
occupant/invader default is the NATO flag/marker, and the rebel default is the
FIA flag/marker. Both must exist in `CfgMarkers`.

Edit these only if your faction should use a custom flag object or marker
class instead of the shared default; otherwise leave them alone and just set
`name`, `flagTexture`, and any other side information inline in your template.

### `Vehicles_SaveToTemplate.sqf`, `Reb_Vehicles_SaveToTemplate.sqf`, `Riv_Vehicles_SaveToTemplate.sqf`, `Civ_Vehicles_SaveToTemplate.sqf`

Each file is a flat list of `SKIP_NIL` calls that save every vehicle, static
weapon, ammunition, and object pool for that faction type (occupant/invader,
rebel, rival, or civilian respectively) to the template hashmap in one place.

Edit these only to add a `SKIP_NIL` line for a genuinely new pool/key. Do not
edit them to omit a category your faction doesn't use — simply don't declare
that pool's `private` variable in your template file (see
[SKIP_NIL pattern](#the-skip_nil-pattern) above). Keep the string key exactly
as Antistasi Ultimate expects it; a mismatched key silently does nothing.

### `Unit_Templates.sqf`, `Reb_Unit_Templates.sqf`, `Riv_Unit_Templates.sqf`, `Civ_Unit_Templates.sqf`

Define the tier-agnostic role template functions (for example
`_squadLeaderTemplate`, `_riflemanTemplate`, `_medicTemplate`), the
`_unitTypes` array that lists which roles/prefixes to generate, and the final
`[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;`
call. They are included at the very end of a template file, after every
loadout hashmap they reference has been created.

Edit these only when you need to add, remove, or fundamentally change a role
(what equipment slots it fills, its chance-based behavior, etc.). Any loadout
data key referenced here (`"uniforms"`, `"slRifles"`, `"items_medic_extras"`,
and so on) must exist in the loadout hashmap(s) passed to the generator call,
or be reachable through `_fnc_fallback`. Test changes in game before relying
on them, per the warnings repeated throughout the example templates.

### `Reb_Loadouts.sqf`

Defines the single rebel loadout hashmap (`_loadoutData`) used to dress
AI-generated militia rebels: maps, watches, compasses, binoculars, uniforms,
facewear, and the standard medical/misc item sets. Rebels have no war-level
tiers, so unlike the occupant/invader and rival examples there is only one
hashmap to maintain.

Edit this file to change what AI rebel units spawn wearing/carrying. It does
not affect the player-facing rebel arsenal or store, which are defined
directly in [`Example_Reb.sqf`](../Examples/Example_Reb.sqf).

## References

- [Template structure guide](../README.md)
- [Faction examples](../Examples/README.md)
- [Antistasi Ultimate source](https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate),
  especially `addons/core/Templates`, for the authoritative list of supported
  template keys and loadout helper functions.
