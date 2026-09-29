#pragma hemtt ignore_variables ["_fnc_saveToTemplate"]

// Note: the idea of rebel vehicle attributes is similar to enemy vehicle attributes,
//      but here we are adjusting how much vehicles cost for rebels to buy in the rebel store based
//      the attributes of the vehicle being particularly high or low for the type of vehicle.
//
//      For example, we may set the cost of an unarmed vehicle higher if it has particularly high speed, good off-road performance, or large number of seats.
//      Conversely, we may lower the cost for particularly slow, poorly armored, or otherwise undesirable vehicles. (e.g. a pedal bicycle instead of motorbike / quadbike)
//
//      As in the vehicle attributes example, the rest of this file is just an example of how this file should be structured.

["attributesVehicles", [
    // light armed stuff (PK machine guns are relatively weak compared to M2 or DShK heavy machine guns, so we lower the cost)
    ["CUP_I_Datsun_PK", ["rebCost", 600]],
    ["Flex_CUP_LUF_Datsun_PK", ["rebCost", 600]],

    // up-armored vehicles (these vehicles, while still lightly armored, have additional protection compared to standard light vehicles, so we increase the cost accordingly)
    ["Flex_CUP_LUF_BTR40", ["rebCost", 1000]],
    ["Flex_CUP_LUF_BTR40_MG", ["rebCost", 1500]],
    ["Flex_CUP_LUF_Hilux_armored_unarmed", ["rebCost", 1000]],
    ["Flex_CUP_LUF_Hilux_armored_DSHKM", ["rebCost", 2000]],
    ["Flex_CUP_LUF_Hilux_armored_M2", ["rebCost", 2000]],
    ["Flex_CUP_LUF_Hilux_armored_zu23", ["rebCost", 3000]],
    ["Flex_CUP_FIA_Hilux_armored_unarmed", ["rebCost", 1000]],
    ["Flex_CUP_FIA_Hilux_armored_M2", ["rebCost", 2000]],
    ["Flex_CUP_FIA_Hilux_armored_zu23", ["rebCost", 3000]]
]] call _fnc_saveToTemplate;
