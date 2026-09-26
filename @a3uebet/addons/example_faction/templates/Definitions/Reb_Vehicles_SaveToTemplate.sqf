#pragma hemtt ignore_variables ["_vehiclesBasic","_vehiclesTruck","_vehiclesLightUnarmed","_vehiclesLightArmed","_vehiclesAT","_vehiclesAA","_vehiclesBoat","_vehiclesPlane","_vehiclesMedical","_staticMG","_staticAT","_staticAA","_staticMortar","_staticMortarMagHE","_staticMortarMagSmoke","_staticMortarMagFlare","_minesAT","_minesAPERS","_breachingExplosivesAPC","_breachingExplosivesTank","_vehiclesCivCar","_vehiclesCivTruck","_vehiclesCivSupply","_vehiclesCivHeli","_vehiclesCivBoat","_vehiclesCivPlane","_lootCrate","_rallyPoint","_fnc_saveToTemplate"]

// ! Skip adding to hashmap if the variable is not defined
#define SKIP_NIL(VAR_NAME,VAR_DATA) if (!isNil VAR_DATA) then { [VAR_NAME, VAR_DATA] call _fnc_saveToTemplate };

SKIP_NIL("vehiclesBasic",_vehiclesBasic)
SKIP_NIL("vehiclesTruck",_vehiclesTruck)
SKIP_NIL("vehiclesLightUnarmed",_vehiclesLightUnarmed)
SKIP_NIL("vehiclesLightArmed",_vehiclesLightArmed)
SKIP_NIL("vehiclesAT",_vehiclesAT)
SKIP_NIL("vehiclesAA",_vehiclesAA)
SKIP_NIL("vehiclesBoat",_vehiclesBoat)
SKIP_NIL("vehiclesPlane",_vehiclesPlane)
SKIP_NIL("vehiclesMedical",_vehiclesMedical)
SKIP_NIL("staticMG",_staticMG)
SKIP_NIL("staticAT",_staticAT)
SKIP_NIL("staticAA",_staticAA)
SKIP_NIL("staticMortar",_staticMortar)
SKIP_NIL("staticMortarMagHE",_staticMortarMagHE)
SKIP_NIL("staticMortarMagSmoke",_staticMortarMagSmoke)
SKIP_NIL("staticMortarMagFlare",_staticMortarMagFlare)
SKIP_NIL("minesAT",_minesAT)
SKIP_NIL("minesAPERS",_minesAPERS)
SKIP_NIL("breachingExplosivesAPC",_breachingExplosivesAPC)
SKIP_NIL("breachingExplosivesTank",_breachingExplosivesTank)

SKIP_NIL("vehiclesCivCar",_vehiclesCivCar)
SKIP_NIL("vehiclesCivTruck",_vehiclesCivTruck)
SKIP_NIL("vehiclesCivSupply",_vehiclesCivSupply)
SKIP_NIL("vehiclesCivHeli",_vehiclesCivHeli)
SKIP_NIL("vehiclesCivBoat",_vehiclesCivBoat)
SKIP_NIL("vehiclesCivPlane",_vehiclesCivPlane)

SKIP_NIL("lootCrate",_lootCrate)
SKIP_NIL("rallyPoint",_rallyPoint)
