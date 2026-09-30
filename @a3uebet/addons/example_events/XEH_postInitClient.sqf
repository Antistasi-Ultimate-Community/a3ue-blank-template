#include "script_component.hpp"

/* Since, according to its documentation, CBA_EVENT_CLIENT_INIT_DONE is a
 * local client event (triggered _by_ the client and sent to itself), we'll
 * have to subscribe to it in client context. In _this_ file, `isServer` would
 * return `false`.
 */

// Subscribe to client initialization done event
[CBA_EVENT_CLIENT_INIT_DONE, LINKFUNC(onClientInitDone)] call A3A_fnc_addEventHandler;
