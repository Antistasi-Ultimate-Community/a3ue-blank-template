//////////////////////////
//   DLC / Mod Content  //
//////////////////////////

// Note: any line with _fnc_saveToTemplate indicates that the value is being added to the faction template hashmap during initialization of the game
//       This file is structured so that we first define mutable arrays of classnames for each category, then add them to the hashmap in bulk later
//       This allows us to easily modify the arrays before adding them to the hashmap. This is most often done to support "soft compats"; i.e., adding mod-specific vehicles or equipment only if the mod is present
//       See the example below for _vehiclesTanks
private _hasWs = "ws" in A3A_enabledDLC; // Western Sahara DLC is loaded *and* enabled in the AU setup dialog
private _hasMarksman = "mark" in A3A_enabledDLC; // Marksman DLC is loaded *and* enabled in the AU setup dialog
private _hasLawsOfWar = "orange" in A3A_enabledDLC; // Laws of War DLC is loaded *and* enabled in the AU setup dialog
private _hasTanks = "tank" in A3A_enabledDLC; // Tanks DLC is loaded *and* enabled in the AU setup dialog
private _hasContact = "enoch" in A3A_enabledDLC; // Contact DLC is loaded *and* enabled in the AU setup dialog
private _hasJets = "jets" in A3A_enabledDLC; // Jets DLC is loaded *and* enabled in the AU setup dialog
private _hasHelicopters = "heli" in A3A_enabledDLC; // Helicopters DLC is loaded *and* enabled in the AU setup dialog
private _hasArtOfWar = "aow" in A3A_enabledDLC; // Art of War DLC is loaded *and* enabled in the AU setup dialog
private _hasApex = "expansion" in A3A_enabledDLC; // Apex DLC is loaded *and* enabled in the AU setup dialog
private _hasGM = "gm" in A3A_enabledDLC; // Global Mobilization DLC is loaded *and* enabled in the AU setup dialog
private _hasCSLA = "csla" in A3A_enabledDLC; // CSLA DLC is loaded *and* enabled in the AU setup dialog
private _hasRF = "rf" in A3A_enabledDLC; // Reaction Forces DLC is loaded *and* enabled in the AU setup dialog
private _hasSOG = "vn" in A3A_enabledDLC; // SOG:PF DLC is loaded *and* enabled in the AU setup dialog
private _hasSPE = "spe" in A3A_enabledDLC; // Spearhead DLC is loaded *and* enabled in the AU setup dialog
private _hasEF = "ef" in A3A_enabledDLC; // Expeditionary Forces DLC is loaded *and* enabled in the AU setup dialog