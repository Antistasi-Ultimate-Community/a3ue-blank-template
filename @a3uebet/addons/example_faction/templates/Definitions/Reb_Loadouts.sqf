// Note: rebel faction templates only have one loadout data hashmap as there are no rebel "tiers"
private _loadoutData = call _fnc_createLoadoutData;

// Basic equipment
_loadoutData set ["maps", ["ItemMap"]]; // change as needed
_loadoutData set ["watches", ["ItemWatch"]]; // change as needed
_loadoutData set ["compasses", ["ItemCompass"]]; // change as needed
_loadoutData set ["binoculars", ["Binocular"]]; // change as needed

_loadoutData set ["uniforms", _rebUniformsAI];
_loadoutData set ["facewear", _rebFacewear];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];