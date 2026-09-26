/////////////////////////////////
//        Unit Templates       //
/////////////////////////////////

// Don't modify unless you *really* know what you're doing

private _manTemplate = {
  ["helmets"] call _fnc_setHelmet;
  ["uniforms"] call _fnc_setUniform;

  ["items_medical_standard"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
  [["workerHelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
  ["workerUniforms"] call _fnc_setUniform;

  ["items_medical_standard"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
  ["pressHelmets"] call _fnc_setHelmet;
  ["pressVests"] call _fnc_setVest;
  ["pressUniforms"] call _fnc_setUniform;

  ["items_medical_standard"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;
};
private _vipTemplate = {
  ["vipUniforms"] call _fnc_setUniform;

  ["items_medical_standard"] call _fnc_addItemSet;

  ["maps"] call _fnc_addMap;
  ["watches"] call _fnc_addWatch;
  ["compasses"] call _fnc_addCompass;

  ["sidearms"] call _fnc_setHandgun;
  ["handgun", 2] call _fnc_addMagazines;
};
private _prefix = "militia";
private _unitTypes = [
  ["VIP", _vipTemplate],
  ["Press", _pressTemplate],
  ["Worker", _workerTemplate],
  ["Man", _manTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;