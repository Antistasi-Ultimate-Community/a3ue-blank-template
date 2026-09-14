// Our custom VERSION_CONFIG macro that also declares compatibility
// with Antistasi Ultimate
#define VERSION_CONFIG version = VERSION; \
    versionStr = QUOTE(VERSION_STR); \
    versionAr[] = {VERSION_AR}; \
    A3A_compatibility[] = {A3A_COMPAT_MAJOR, A3A_COMPAT_MINOR}
    
// Load CBA headers
#include "\x\cba\addons\main\script_macros.hpp"

// Load Antistasi Ultimate headers
// (a lot of them until we get our own stuff in order...)
#include "\x\A3A\addons\core\Includes\script_macros.hpp"
#include "\x\A3A\addons\core\Includes\common.inc"
