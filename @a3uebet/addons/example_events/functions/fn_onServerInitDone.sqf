#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3UEBET_example_events_fnc_onServerInitDone

Description:
    CBA_EVENT_SERVER_INIT_DONE event handler

Parameters:

Optional:

Example:

Returns:
    Nothing

Environment:
    Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(onServerInitDone),_this);

Info("Server is ready and initialized.");

nil;
