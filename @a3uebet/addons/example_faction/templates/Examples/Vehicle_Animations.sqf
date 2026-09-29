#pragma hemtt ignore_variables ["_fnc_saveToTemplate"]

// Note: animations are used to add or remove cosmetic elements of a vehicle, e.g. spare tires, radio antennas, camouflage netting, etc
//      Animations should be defined as weighted-list arrays, with each modifiable part of the vehicle and a chance of it being activated
//      Different vehicles may have few, many, or no animations
//
//      To get the animations array for a vehicle, place it in the in game editor, open its customization in the garage and add / remove items as you see fit,
//            then while looking at the vehicle, run this code in the ArmA 3 debug console:
//                  cursorObject call BIS_fnc_getVehicleCustomization;
//
//      The resulting array will look something like this:
//            [["MERDC_Winter",1],["hide_bustle_rack_ext",0,"hide_duke_antennas",0,"hide_loader_shield",1,"hide_rear_side_skirt",1,"hide_cip_panel_bustle",0,"hide_cip_panel_rear",0,"hide_front_ti_panels",0,"hide_reserve_wheels",0,"hide_Deployment_1_1",1,"hide_Deployment_1_2",1,"hide_Deployment_1_3",1,"hide_Deployment_2_1",1,"hide_Deployment_2_2",1,"hide_Deployment_2_3",1,"hide_net_cannon",0,"hide_net_turret",1,"hide_net_hull",0,"hide_turret_bundle",1]]
//      The first array within the array (the ["MERDC_Winter", 1] part) represents the *variant*, or texture / skin
//      The second array within the array ( the ["hide_bustle_rack_ext",0,"hide_duke_antennas",0, ...] part) is the animation array
//
//      For this file, we need the vehicle classname and the animation array, like so:
//            ["B_T_MBT_01_TUSK_F",["showCamonetTurret",0.3,"showCamonetHull",0.3,"showBags",0.3]]
//      Note the first element is the vehicle classname, then an array of animations with their respective weights, or chance of being "activated"
//            e.g. when this vehicle is spawned in game, the turret camo net will have a 30% chance of being shown
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

["animations", [
    ["B_Heli_Light_01_dynamicLoadout_F",["AddTread_Short",0.5,"AddTread",0.5]],
    ["B_Heli_Light_01_F",["AddBenches",0.7,"AddTread",0.3,"AddBackseats",1,"AddHoldingFrame",0.3,"AddTread_Short",0.3]],
    ["B_MBT_01_cannon_F",["showBags",0.3,"showCamonetTurret",0.3,"showCamonetHull",0.3]],
    ["B_MBT_01_TUSK_F",["showCamonetTurret",0.3,"showCamonetHull",0.3,"showBags",0.3]],
    ["B_T_APC_Tracked_01_AA_F",["showCamonetTurret",0.3,"showCamonetHull",0.3,"showBags",0.3]],
    ["B_T_APC_Wheeled_01_cannon_F",["showBags",0.3,"showCamonetHull",0.3,"showCamonetTurret",0.3,"showSLATHull",0.3,"showSLATTurret",0.3]],
    ["B_T_APC_Tracked_01_CRV_F",["showAmmobox",0.3,"showWheels",0.3,"showCamonetHull",0.3,"showBags",0.3]],
    ["B_T_APC_Tracked_01_rcws_F",["showCamonetHull",0.5,"showBags",0.5]],
    ["B_T_AFV_Wheeled_01_cannon_F",["showCamonetHull",0.3,"showCamonetTurret",0.3,"showSLATHull",0.3]],
    ["B_T_AFV_Wheeled_01_up_cannon_F",["showCamonetHull",0.3,"showCamonetTurret",0.3,"showSLATHull",0.3]],
    ["B_T_MBT_01_arty_F",["showCanisters",0.3,"showCamonetTurret",0.3,"showAmmobox",0.3,"showCamonetHull",0.3]],
    ["B_T_MBT_01_mlrs_F",["showCamonetTurret",0.5,"showCamonetHull",0.5]],
    ["B_T_Truck_01_cargo_F",["Tyre1_hide",0.5]],
    ["B_T_Truck_01_flatbed_F",["Tyre1_hide",0.5]],
    ["B_T_LSV_01_AT_F",["HideDoor1",0.3,"HideDoor2",0.3,"HideDoor3",0.3,"HideDoor4",0.3]],
    ["B_T_LSV_01_armed_F",["HideDoor1",0.3,"HideDoor2",0.3,"HideDoor3",0.3,"HideDoor4",0.3]],
    ["B_T_LSV_01_unarmed_F",["HideDoor1",0.3,"HideDoor2",0.3,"HideDoor3",0.3,"HideDoor4",0.3]],
    ["B_T_Heli_Light_01_dynamicLoadout_F",["AddTread_Short",0.5,"AddTread",0.5]],
    ["B_T_Heli_Light_01_F",["AddBenches",0.3,"AddTread",0.3,"AddBackseats",1,"AddHoldingFrame",0.3,"AddTread_Short",0.3]],
    ["B_T_MBT_01_cannon_F",["showBags",0.3,"showCamonetTurret",0.3,"showCamonetHull",0.3]],
    ["B_T_MBT_01_TUSK_F",["showCamonetTurret",0.3,"showCamonetHull",0.3,"showBags",0.3]]
]] call _fnc_saveToTemplate;
