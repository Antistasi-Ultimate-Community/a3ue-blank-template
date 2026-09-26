class CfgMarkers {
    class flag_NATO; // import the base class

    class flag_ROC : flag_NATO { // create a new marker class for the ROC faction, inheriting from the base class. We do this so we can change the name, icon, and texture for our own faction
        name = "Republic of China Army"; // display name for the marker
        icon = QPATHTO_T(templates\CUP_ROC\data\CUP_ROC_marker.paa); // icon for the marker
        texture = QPATHTO_T(templates\CUP_ROC\data\CUP_ROC_marker.paa); // texture for the marker
    };
};
