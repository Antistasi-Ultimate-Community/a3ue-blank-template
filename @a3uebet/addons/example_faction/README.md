# Creating a Faction Template

This addon is a working reference for adding occupant, invader, rebel, rival,
or civilian factions to an [Antistasi Ultimate](https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate)
extender mod. The files in this addon are deliberately more heavily commented
than a normal faction template.

## Start here

1. Register the faction in [`CfgTemplates.hpp`](CfgTemplates.hpp). It shows
	both direct inheritance from Antistasi Ultimate's `Base` class and a local
	shared base class for multiple factions.
2. Copy the closest script from [`templates/Examples`](templates/Examples)
	and edit its class names and data pools.
3. Add the display names, descriptions, and other text to
	[`stringtable.xml`](stringtable.xml).
4. Check the detailed guides:
	[`templates/README.md`](templates/README.md) covers the template structure
	and data contract, while
	[`templates/Examples/README.md`](templates/Examples/README.md) compares the
	faction types and points to advanced examples.
5. For a complete, currently-registered faction that also adds new game
	content (retextured uniforms/vests and a custom map marker) instead of only
	reusing existing classes, see [`templates/CUP_ROC`](templates/CUP_ROC) and
	its [README](templates/CUP_ROC/README.md).

## Addon files

| File | Role |
| --- | --- |
| `config.cpp` | Declares the addon patch and includes `CfgTemplates.hpp`. |
| `CfgTemplates.hpp` | Registers template classes under `A3A > Templates`; defines inheritance, side, path, climate, logo, and localized metadata. |
| `templates/*.sqf` | Supplies the faction's Antistasi Ultimate template hashmap, vehicle pools, identities, equipment, loadouts, and unit generators. |
| `templates/CUP_ROC/` | A complete occupant faction that both configures a template and adds new content (`config.cpp`, `CfgMarkers.hpp`, `CfgVehicles.hpp`, `CfgWeapons.hpp`, `data/`) for use in it. |
| `stringtable.xml` | Localizes names and descriptions referenced by `CSTRING`, `LLSTRING`, and related macros. |
| `script_component.hpp` and `$PBOPREFIX$` | Provide the addon namespace, macros, and packed-PBO path. |

The two detailed READMEs are the maintained starting point for the template
format. The example scripts are the authoritative local examples for less
common keys and advanced behavior.

## Inheritance and localization

Each template class can inherit from Antistasi Ultimate's `Base`, or from a
local class that contains common `requiredAddons[]`, `logo`, `basepath`, or
`climate[]` values. A child class only needs to override properties that differ.
The example makes `Example_Inv` inherit from `Example_Occ` because occupant and
invader scripts have the same structure and differ primarily in `side`.

Use `stringtable.xml` for player-facing text. `CSTRING(Name)` and
`CSTRING(Description)` in the config, and `LLSTRING(NameShort)` in SQF, resolve
to keys in the addon package.

## External references

- [Templates guide](templates/README.md)
- [Template examples guide](templates/Examples/README.md)
- [CUP_ROC complete example guide](templates/CUP_ROC/README.md)
- [CBA_A3 Wiki](https://github.com/CBATeam/CBA_A3/wiki) for macros such as
  `CSTRING()` and `QPATHTO_T`.
- [Antistasi Ultimate source](https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate),
  especially its `addons/core/Templates` and template helper functions.
- [BIS ArmA 3 Community Wiki](https://community.bohemia.net/wiki/Main_Page),
  including [Scripting Commands](https://community.bohemia.net/wiki/Category:Scripting_Commands_Arma_3),
  config reference, `BIS_fnc_getVehicleCustomization`, and
  `BIS_fnc_initVehicle`.
