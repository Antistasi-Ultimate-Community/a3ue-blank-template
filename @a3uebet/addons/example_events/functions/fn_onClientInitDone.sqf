#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3UEBET_example_events_fnc_onClientInitDone

Description:
    CBA_EVENT_CLIENT_INIT_DONE event handler

Parameters:

Optional:

Example:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(onClientInitDone),_this);

Info("Client is ready and initialized.");

nil;
