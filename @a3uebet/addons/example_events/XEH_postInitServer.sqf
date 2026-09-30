#include "script_component.hpp"

/* Since, according to its documentation, CBA_EVENT_SERVER_INIT_DONE is a
 * server-server event (triggered _by_ the server and sent to itself), we'll
 * have to subscribe to it in server context. In _this_ file, `isServer` would
 * return `true`.
 */

// Subscribe to server initialization done event
[CBA_EVENT_SERVER_INIT_DONE, LINKFUNC(onServerInitDone)] call A3A_fnc_addEventHandler;
