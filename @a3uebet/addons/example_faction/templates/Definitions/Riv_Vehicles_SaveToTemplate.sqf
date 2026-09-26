// ! Skip adding to hashmap if the variable is not defined
#define SKIP_NIL(name,data) if (!isNil QUOTE(data)) then { [name, data] call _fnc_saveToTemplate }

SKIP_NIL("vehiclesRivalCars",_vehiclesLightUnarmed);
SKIP_NIL("vehiclesRivalsLightArmed",_vehiclesLightArmed);
SKIP_NIL("vehiclesRivalsTrucks",_vehiclesTrucks);
SKIP_NIL("vehiclesRivalsAPCs",_vehiclesAPCs);
SKIP_NIL("vehiclesRivalsTanks",_vehiclesTanks);
SKIP_NIL("vehiclesRivalsHelis",_vehiclesHelis);
SKIP_NIL("vehiclesRivalsUAVs",_vehiclesUAVs);
SKIP_NIL("staticLowWeapons",_staticLowWeapons);
SKIP_NIL("staticAT",_staticAT);
SKIP_NIL("staticMortars",_staticMortars);
SKIP_NIL("mortarMagazineHE",_staticMortarMagHE);
SKIP_NIL("minefieldAT",_minefieldAT);
SKIP_NIL("minefieldAPERS",_minefieldAPERS);
SKIP_NIL("handGrenadeAmmo",_handGrenades);

// here due to spaghetti code that introduced unneeded / basically duplicated keys
// special case where the ammo needs to be in an array structure
if (!isNil "_staticMortarMagHE") then { ["mortarAmmo",[_staticMortarMagHE]] call _fnc_saveToTemplate };
