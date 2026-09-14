// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define MAINPREFIX z
#define PREFIX a3uebet

#include "script_version.hpp"

#define VERSION MAJOR.MINOR
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

#define A3UEBET_TAG A3UEBET

// MINIMAL Arma version required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 2.22

/* Antistasi Ultimate compatibility
 *
 * Requires Antistasi Ultimate version 12.0 or higher
 *
 * Your extender _MAY_ declare compatibility with a major release of Antistasi
 * Ultimate by leaving the required minor version at 0. If, however, there is
 * an update to A3U to e.g. version 12.1, your extender will be considered
 * compatible, but still shown to administrators.
 *
 * The make sure your extender does not pop up in the extenders incompatibility
 * notice dialog, keep these numbers up to date to A3U's current MAJOR.MINOR version.
 */
#define A3A_COMPAT_MAJOR 12
#define A3A_COMPAT_MINOR 0

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(a3uebet - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(a3uebet - COMPONENT)
#endif
