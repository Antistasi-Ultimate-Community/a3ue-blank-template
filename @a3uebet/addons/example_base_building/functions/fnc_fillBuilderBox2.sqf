#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3UEBET_fnc_fillBuilderBox2

Description:
    Callback function to populate the contents of My Example Builder Box #2.

    If your custom builder box has static elements (as defined in 
    `buildableObjects[]` property), those are pre-filled in the `_outputArray`
    parameter. You'll have to modify it to add further custom elements.

Parameters:
    0: _outputArray - Static buildable objects of this builder box <ARRAY>

Optional:

Example:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if !(assert(params[
    ["_outputArray", nil, [[]]]
])) exitWith {};

// Allow this item for engineers, only
if ([player] call A3A_fnc_isEngineer) then {
    // Huron Repair Container
    _outputArray pushBack ["B_Slingload_01_Repair_F", 2000];
    // Taru Repair Pod
    _outputArray pushBack ["Land_Pod_Heli_Transport_04_repair_F", 2250];
};

nil;
