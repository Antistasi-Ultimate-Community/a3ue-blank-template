// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define MAINPREFIX z
#define PREFIX a3uebet

#include "script_version.hpp"

#define VERSION MAJOR.MINOR
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

#define A3UEBET_TAG A3UEBET

// MINIMAL Arma version required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 2.22

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(a3uebet - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(a3uebet - COMPONENT)
#endif
