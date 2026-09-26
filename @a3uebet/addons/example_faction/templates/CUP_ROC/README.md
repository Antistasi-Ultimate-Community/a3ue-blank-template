# CUP_ROC: A Complete Faction with New Content

Unlike [`../Examples`](../Examples), which only reuse existing Arma 3 or mod
classnames, this folder is a fully implemented, currently-registered occupant
faction (see `CUP_ROC` in [`../../CfgTemplates.hpp`](../../CfgTemplates.hpp)).
It uses CUP's Republic of China Army assets (`Flex_CUP_ROC_Faction`) as a base
and *adds new content on top of them*: retextured uniforms and vests, and a
custom map marker carrying the faction's flag. That content is what
`CUP_AI_ROC.sqf` then references.

This is a second, optional layer beyond the template SQF documented in
[`../README.md`](../README.md) and [`../Examples/README.md`](../Examples/README.md):
adding new config classes so a faction can look distinct, instead of only
recombining classnames that already exist.

## Files

| File | Purpose |
| --- | --- |
| `config.cpp` | Declares this as its own addon component (`CfgPatches`), lists every new class it adds, and includes the other `.hpp` files. |
| `CfgMarkers.hpp` | Adds the `flag_ROC` map marker used by the faction's flag/support corridor. |
| `CfgVehicles.hpp` | Retextures the *worn* uniform/vest object classes (the "vehicle" that represents clothing on a character). |
| `CfgWeapons.hpp` | Adds the *inventory item* classes for those uniforms/vests, and links each one back to its `CfgVehicles` class. |
| `data/*.paa` | The new textures (and one marker icon) referenced by the classes above. |
| `CUP_ROC_logo.paa` | The faction's logo, referenced by `logo` in `CfgTemplates.hpp`. |
| `CUP_AI_ROC.sqf` | The Antistasi Ultimate template script itself; structured like the occupant examples and documented by the same guides. |

## `config.cpp`

```cpp
class CfgPatches {
    class PATCHNAME(CUP_ROC) {
        name = COMPONENT_NAME;
        units[] = { "CUP_ROC_CRYE_Full", /* ...every new uniform/vest class... */ };
        weapons[] = {};
        requiredAddons[] = {"Flex_CUP_ROC_Faction"};
        skipWhenMissingDependencies = 1;
        ...
    };
};

#include "CfgMarkers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
```

- `PATCHNAME(CUP_ROC)` names this `CfgPatches` entry after the file/feature, so
  it can be its own addon component distinct from the main `example_faction`
  patch.
- `units[]` must list every new `CfgVehicles` class this file adds (uniform and
  vest "worn" objects included) so the game and mission editor recognize them.
  New `CfgWeapons` items generally do not need to be listed here.
- `requiredAddons[]` must include the `CfgPatches` name of the mod supplying
  the base classes being inherited from (here, CUP's ROC faction addon).
- `skipWhenMissingDependencies = 1` lets this component's PBO fail to load
  gracefully if the required addon isn't present, instead of erroring the
  whole mod.

## `CfgMarkers.hpp`

```cpp
class CfgMarkers {
    class flag_NATO; // import the base class
    class flag_ROC : flag_NATO {
        name = "Republic of China Army";
        icon = QPATHTO_T(templates\CUP_ROC\data\CUP_ROC_marker.paa);
        texture = QPATHTO_T(templates\CUP_ROC\data\CUP_ROC_marker.paa);
    };
};
```

Forward-declare the class you're inheriting from (`class flag_NATO;`) before
defining your child class. Overriding `icon`/`texture` swaps the marker's
flag image; the class name (`flag_ROC`) is what you then use for
`flagMarkerType` in the faction template (see `CUP_AI_ROC.sqf`).

## `CfgVehicles.hpp` and `CfgWeapons.hpp`: retexturing an outfit

Arma splits a piece of clothing into two linked classes, and this addon
follows that split:

- A **`CfgVehicles`** class is the object actually worn on the character. It
  carries the model and `hiddenSelectionsTextures[]` (the actual texture
  files) and is referenced by classname from the item below via
  `uniformClass` (or, for vests, indirectly through the base vest class).
- A **`CfgWeapons`** class (under `class Uniforms` / vest inheritance) is the
  inventory item players and the arsenal see. It carries `displayName`,
  `mass`, and an `ItemInfo` sub-class whose `uniformClass` points back at the
  `CfgVehicles` class.

To retexture an existing outfit, forward-declare its base classes, then
create a child of each and only override `hiddenSelectionsTextures[]` (plus
`uniformClass`/`displayName` to keep the pair correctly linked):

```cpp
// CfgVehicles.hpp
class CUP_CRYE_TAN_Full;
class CUP_ROC_Crye_Full : CUP_CRYE_TAN_Full {
    scope = 1; // not directly visible in the arsenal; only reached through its uniform item
    uniformClass = "CUP_ROC_U_CRYE_Full"; // must match the CfgWeapons item below
    hiddenSelectionsTextures[] = {QPATHTOFOLDER(templates\CUP_ROC\data\crye_g3_roc_dig_co.paa)};
};
```

```cpp
// CfgWeapons.hpp
class CUP_U_CRYE_TAN_Full;
class CUP_ROC_U_CRYE_Full : CUP_U_CRYE_TAN_Full {
    scope = 2; // visible/usable
    displayName = "Crye ROC Full";
    hiddenSelectionsTextures[] = {QPATHTOFOLDER(templates\CUP_ROC\data\crye_g3_roc_dig_co.paa)};
    class ItemInfo: UniformItem {
        uniformModel = "-";
        uniformClass = "CUP_ROC_Crye_Full"; // the CfgVehicles class above
        containerClass = "Supply60";
        mass = 25;
    };
};
```

`scope = 1` hides a class from menus/arsenal while still allowing other
classes to inherit from or reference it; `scope = 2` makes it selectable.
Vests follow the same two-class pattern but inherit vest base classes
instead of uniform base classes, and don't need a separate `ItemInfo` class
in these examples since the vest's `CfgWeapons` class already carries the
container/vest properties from its parent.

`hiddenSelectionsTextures[]` entries must be in the same order as the hidden
selections on the underlying model; when a class only changes one texture,
copying the base class's array order (and swapping only the changed entries)
avoids texture-swap glitches like a wrong camo pattern on gloves or pouches.

## `data/*.paa`

Texture files must be Arma's `.paa` format. To make your own retexture:

1. Find the base class's existing textures (check the source mod's config or
   ask its documentation/community which `hiddenSelectionsTextures[]` it
   uses).
2. Edit a copy of that texture (or a template UV layout) in an image editor,
   then convert/save it to `.paa` with a tool such as Bohemia's TexView 2 or
   the Arma 3 Tools PBO/texture pipeline.
3. Place the result under `data/` and reference it from `CfgVehicles.hpp`/
   `CfgWeapons.hpp` with `QPATHTOFOLDER(...)` so the path resolves correctly
   once packed into a PBO.

`QPATHTOFOLDER(...)` and `QPATHTO_T(...)` are quoting path macros supplied by
this addon's `script_macros.hpp` and CBA respectively; both build a path
rooted at this addon's own PBO prefix, so a relative path like
`templates\CUP_ROC\data\file.paa` resolves correctly however the addon is
packed.

## `CUP_AI_ROC.sqf`

This is a real, in-use faction template, not just an illustration. It follows
the same structure as [`../Examples/Example_Occ.sqf`](../Examples/Example_Occ.sqf)
and includes the same shared files from [`../Definitions`](../Definitions),
but its vehicle, equipment, and identity pools reference real CUP ROC
classnames (and, where relevant, the new retextured uniforms/vests and marker
added in this folder) instead of empty placeholder arrays.

## References

- [Templates guide](../README.md)
- [Faction examples](../Examples/README.md)
- [Shared Definitions guide](../Definitions/README.md)
- [BIS wiki: Class Inheritance](https://community.bohemia.net/wiki/Class_Inheritance)
  for the basics of forward-declaring and inheriting config classes.
- [BIS wiki: CfgVehicles](https://community.bohemia.net/wiki/CfgVehicles) config
  reference.
- [BIS wiki: CfgWeapons](https://community.bohemia.net/wiki/CfgWeapons) config
  reference.
- [BIS wiki: CfgMarkers](https://community.bohemia.net/wiki/CfgMarkers) config
  reference.
- [BIS wiki: Config Reference](https://community.bohemia.net/wiki/Config_Reference)
  for general config syntax, `hiddenSelectionsTextures`, and related properties.
- [CBA_A3 Wiki](https://github.com/CBATeam/CBA_A3/wiki) for the `QPATHTO_T`
  and related pathing macros.
