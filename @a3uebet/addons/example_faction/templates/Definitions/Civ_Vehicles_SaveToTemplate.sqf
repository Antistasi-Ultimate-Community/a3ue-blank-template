// ! Skip adding to hashmap if the variable is not defined
#define SKIP_NIL(name,data) if (!isNil QUOTE(data)) then { [name, data] call _fnc_saveToTemplate }

SKIP_NIL("vehiclesCivCar",_vehiclesCivCar);
SKIP_NIL("vehiclesCivIndustrial",_vehiclesCivIndustrial);
SKIP_NIL("vehiclesCivRepair",_vehiclesCivRepair);
SKIP_NIL("vehiclesCivMedical",_vehiclesCivMedical);
SKIP_NIL("vehiclesCivFuel",_vehiclesCivFuel);
SKIP_NIL("vehiclesCivBoat",_vehiclesCivBoat);
SKIP_NIL("vehiclesCivPlanes",_vehiclesCivPlanes);
SKIP_NIL("vehiclesCivHeli",_vehiclesCivHeli);