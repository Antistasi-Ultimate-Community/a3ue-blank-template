#pragma hemtt ignore_variables ["_vehiclesCivCar","_vehiclesCivIndustrial","_vehiclesCivRepair","_vehiclesCivMedical","_vehiclesCivFuel","_vehiclesCivBoat","_vehiclesCivPlanes","_vehiclesCivHeli","_fnc_saveToTemplate"]

// ! Skip adding to hashmap if the variable is not defined
#define SKIP_NIL(VAR_NAME,VAR_DATA) if (!isNil VAR_DATA) then { [VAR_NAME, VAR_DATA] call _fnc_saveToTemplate };

SKIP_NIL("vehiclesCivCar",_vehiclesCivCar)
SKIP_NIL("vehiclesCivIndustrial",_vehiclesCivIndustrial)
SKIP_NIL("vehiclesCivRepair",_vehiclesCivRepair)
SKIP_NIL("vehiclesCivMedical",_vehiclesCivMedical)
SKIP_NIL("vehiclesCivFuel",_vehiclesCivFuel)
SKIP_NIL("vehiclesCivBoat",_vehiclesCivBoat)
SKIP_NIL("vehiclesCivPlanes",_vehiclesCivPlanes)
SKIP_NIL("vehiclesCivHeli",_vehiclesCivHeli)
