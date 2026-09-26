#pragma hemtt ignore_variables ["_fnc_saveToTemplate"]

// Note: variants are used to define different visual appearances of a vehicle, e.g. different camouflage patterns, paint jobs, or liveries.
//      Variants should be defined as weighted-list arrays, with each paint scheme of the vehicle and a chance of it being used
//      Different vehicles may have few, many, or no variants
//
//      To get the variants array for a vehicle, place it in the in game editor, open its customization in the garage and add / remove items as you see fit,
//            then while looking at the vehicle, run this code in the ArmA 3 debug console:
//                  cursorObject call BIS_fnc_getVehicleCustomization;
//
//      The resulting array will look something like this:
//            [["MERDC_Winter",1],["hide_bustle_rack_ext",0,"hide_duke_antennas",0,"hide_loader_shield",1,"hide_rear_side_skirt",1,"hide_cip_panel_bustle",0,"hide_cip_panel_rear",0,"hide_front_ti_panels",0,"hide_reserve_wheels",0,"hide_Deployment_1_1",1,"hide_Deployment_1_2",1,"hide_Deployment_1_3",1,"hide_Deployment_2_1",1,"hide_Deployment_2_2",1,"hide_Deployment_2_3",1,"hide_net_cannon",0,"hide_net_turret",1,"hide_net_hull",0,"hide_turret_bundle",1]]
//      The first array within the array (the ["MERDC_Winter", 1] part) represents the *variant*, or texture / skin
//      The second array within the array ( the ["hide_bustle_rack_ext",0,"hide_duke_antennas",0, ...] part) is the animation array
//
//      For this file, we need the vehicle classname and the variants array, like so:
//            ["I_LT_01_AA_F", ["Indep_Olive", 0, "Indep_01", 0.5]],
//      Note the first element is the vehicle classname, then an array of variants with their respective weights, or chance of being used
//            e.g. when this vehicle is spawned in game, the "Indep_Olive" variant will have a 0% chance of being used (never), and the "Indep_01" variant will have a 50% chance of being used (with the other 50% chance being the default skin)
//
//      Another, perhaps easier, way to get vehicle variants and animations is to place a vehicle in the editor, customize its appearance in the garage, and click "Export"
//      The resulting code will look something like this:
//            _veh = createVehicle ["CUP_B_M1A2C_TUSK_II_NATO",position player,[],0,"NONE"];
//            [
//                  _veh,
//                  ["NATO_Arid",1], 
//                  ["hide_bustle_rack_ext",0,"hide_duke_antennas",1,"hide_loader_shield",1,"hide_rear_side_skirt",1,"hide_cip_panel_bustle",0,"hide_cip_panel_rear",0,"hide_front_ti_panels",1,"hide_reserve_wheels",1,"hide_Deployment_1_1",0,"hide_Deployment_1_2",1,"hide_Deployment_1_3",1,"hide_Deployment_2_1",0,"hide_Deployment_2_2",1,"hide_Deployment_2_3",1,"hide_net_cannon",0,"hide_net_turret",0,"hide_net_hull",0,"hide_turret_bundle",0]
//            ] call BIS_fnc_initVehicle;
//      Note that here the variants array is the second element within the array, and the animations array is the third element.
//
//      The rest of this file is just an example of how this file should be structured.

["variants", [
    ["I_LT_01_AA_F", ["Indep_Olive", 0, "Indep_01", 0.5]],
    ["I_LT_01_cannon_F", ["Indep_Olive", 0, "Indep_01", 0.5]],
    ["I_LT_01_AT_F", ["Indep_Olive", 0, "Indep_01", 0.5]],
    ["I_LT_01_scout_F",["Indep_Olive", 0, "Indep_01", 0.5]],
    ["I_Plane_Fighter_04_F", ["CamoGrey",0.1, "DigitalCamoGrey", 0.4, "DigitalCamoGreen",0.5]],
    ["I_Heli_light_03_unarmed_F", ["Indep", 0.5]],
    ["a3a_Offroad_02_LMG_black_F", ["Olive",1]],
    ["I_C_Offroad_02_unarmed_F", ["Olive",1]]
]] call _fnc_saveToTemplate;
