# A3U extender blank example - A3U CBA event catalog

Since all examples include A3U's header files, the event catalog header
`cba_events.hpp` is also included.

This header defines the event names used by the A3U framework through CBA-style
event handlers. Each macro is a string constant and is designed to be used with
the [corresponding event functions](#functions).

## Functions

A3U provides a couple of functions used to handle, register and unregister
events. They're mostly wrappers around their CBA equivalents with logging and
stricter parameter validation on top of them. They are:

### Event subscription

Please refer to the linked files' documentation for further information.

> [!CAUTION]
> To subscribe to events, game must be in post-init phase!

Function                                                                | Description
------------------------------------------------------------------------|------------
[`A3A_fnc_addEventHandler`][url-gh-unstable-func-addEventHandler]       | Subscribe to an event
[`A3A_fnc_removeEventHandler`][url-gh-unstable-func-removeEventHandler] | Unsubscribe from an event

[url-gh-unstable-func-addEventHandler]: https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate/blob/unstable/A3A/addons/core/functions/Events/fn_addEventHandler.sqf
[url-gh-unstable-func-removeEventHandler]: https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate/blob/unstable/A3A/addons/core/functions/Events/fn_removeEventHandler.sqf

### Event triggers

Please refer to the linked files' documentation for further information.

Function                                                        | Description
----------------------------------------------------------------|------------
[`triggerGlobalEvent`][url-gh-unstable-func-triggerGlobalEvent] | Raises event on all machines including the local one.
[`triggerLocalEvent`][url-gh-unstable-func-triggerLocalEvent]   | Raises a CBA event on the local machine.
[`triggerOwnerEvent`][url-gh-unstable-func-triggerOwnerEvent]   | Raises a CBA event on the target client ID’s machine.
[`triggerRemoteEvent`][url-gh-unstable-func-triggerRemoteEvent] | Raises a CBA event on all machines, except the local one.
[`triggerResultEvent`][url-gh-unstable-func-triggerResultEvent] | Raises a local CBA event until the first subscriber function returns a non-nil value.
[`triggerServerEvent`][url-gh-unstable-func-triggerServerEvent] | Raises a CBA event on the server machine.
[`triggerTargetEvent`][url-gh-unstable-func-triggerTargetEvent] | Raises a CBA event on all machines where this object or at least one of these objects are local.

[url-gh-unstable-func-triggerGlobalEvent]: https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate/blob/unstable/A3A/addons/core/functions/Events/triggerGlobalEvent.sqf
[url-gh-unstable-func-triggerLocalEvent]: https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate/blob/unstable/A3A/addons/core/functions/Events/triggerLocalEvent.sqf
[url-gh-unstable-func-triggerOwnerEvent]: https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate/blob/unstable/A3A/addons/core/functions/Events/triggerOwnerEvent.sqf
[url-gh-unstable-func-triggerRemoteEvent]: https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate/blob/unstable/A3A/addons/core/functions/Events/triggerRemoteEvent.sqf
[url-gh-unstable-func-triggerResultEvent]: https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate/blob/unstable/A3A/addons/core/functions/Events/triggerResultEvent.sqf
[url-gh-unstable-func-triggerServerEvent]: https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate/blob/unstable/A3A/addons/core/functions/Events/triggerServerEvent.sqf
[url-gh-unstable-func-triggerTargetEvent]: https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate/blob/unstable/A3A/addons/core/functions/Events/triggerTargetEvent.sqf

## Events

Following is an _excerpt_ of the available events that can be subscribed to.
For a full documentation, refer to the
[event catalog header][url-gh-unstable-hdr-cba_events].

> [!NOTE]
> As of the time of this writing, there's no need to trigger any of those
> events yourself.

[url-gh-unstable-hdr-cba_events]: https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate/blob/unstable/A3A/addons/core/Includes/cba_events.hpp

### Event conventions

- Client events are usually local to the player machine unless otherwise noted.
- Server events are raised on the server and may target specific clients.
- Parameters are passed in order as an array to the subscriber callback.
- Broadcast events reach multiple machines; targeted events go to a single client.

### Client events

#### `CBA_EVENT_CLIENT_BUILDER_ABORT` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when a player aborts builder mode.
    Parameters: none.
    Scope: client -> client.

#### `CBA_EVENT_CLIENT_BUILDER_START` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when a player starts builder mode.
    Parameters: [builderPos, builderRadius].
    Scope: client -> client.

#### `CBA_EVENT_CLIENT_HQ_PLACED` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when moving the HQ is complete.
    Parameters: [position, player].
    Scope: client -> all machines including sender.

#### `CBA_EVENT_CLIENT_INIT_DONE` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered after client initialization is complete.
    Parameters: none.
    Scope: client -> client.

#### `CBA_EVENT_CLIENT_PLAYER_LOAD` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when the server loads a player's custom save data.
    Parameters: [saveData].
    Scope: server -> client.

#### `CBA_EVENT_CLIENT_PLAYER_SAVE` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when the server prepares custom player save data.
    Parameters: [saveData].
    Scope: server -> client.

#### `CBA_EVENT_CLIENT_TEARDOWN_MODE_CHANGED` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when the client changes teardown mode.
    Parameters: [player, isInTeardownMode].
    Scope: client -> client.

#### `CBA_EVENT_CLIENT_UNDERCOVER_CHANGED` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when the player's undercover state changes.
    Parameters: [undercoverStatus, undercoverBrokenReason?].
    Scope: client -> client.

#### `CBA_EVENT_CLIENT_VEHICLE_BOX_RESTORE` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when a client restores nearby vehicles from the vehicle box.
    Parameters: [position].
    Scope: client -> client.

### Server events

#### `CBA_EVENT_SERVER_CREATE_REBEL_CONTROL` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when a rebel control is established.
    Parameters: [marker, controlType].
    Scope: server -> server.

#### `CBA_EVENT_SERVER_GAME_LOAD` ![available since version 12.1.0][url-version-badge-since-12.1.0]
    Triggered when the game is loaded on the server.
    Parameters: [saveData]
    Scope: server -> server.

#### `CBA_EVENT_SERVER_GAME_SAVE` ![available since version 12.1.0][url-version-badge-since-12.1.0]
    Triggered when the game is saved on the server.
    Parameters: [saveData]
    Scope: server -> server.

#### `CBA_EVENT_SERVER_ENTITY_POSTMORTEM` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when an entity dies.
    Parameters: [entity, killer?].
    Scope: server -> server.

#### `CBA_EVENT_SERVER_INIT_AI_UNIT` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when an AI unit is initialized.
    Parameters: [unit, side, marker, isSpawner].
    Scope: server -> server.

#### `CBA_EVENT_SERVER_INIT_AI_VEHICLE` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when an AI vehicle is initialized.
    Parameters: [vehicle, side].
    Scope: server -> server.

#### `CBA_EVENT_SERVER_INIT_CIVILIAN_UNIT` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when a civilian unit is initialized.
    Parameters: [unit].
    Scope: server -> server.

#### `CBA_EVENT_SERVER_INIT_CIVILIAN_VEHICLE` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when a civilian vehicle is initialized.
    Parameters: [vehicle].
    Scope: server -> server.

#### `CBA_EVENT_SERVER_INIT_DONE` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered after preliminary server setup completes.
    Parameters: none.
    Scope: server -> server.

#### `CBA_EVENT_SERVER_MARKER_CHANGE` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when a marker changes ownership.
    Parameters: [marker, winner, loser].
    Scope: server -> server.

#### `CBA_EVENT_SERVER_PLAYER_SAVE` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when the server saves player data.
    Parameters: [uuid].
    Scope: server -> client.

#### `CBA_EVENT_SERVER_SPAWN_LOCATION` ![available since version 12.0.4][url-version-badge-since-12.0.4]
    Triggered when a location spawns or despawns.
    Parameters: [location, locationType, isSpawning].
    Scope: server -> server.

#### `CBA_EVENT_SERVER_STARTUP` ![available since version 12.1.0][url-version-badge-since-12.1.0]
    Triggered very early in `fn_initServer.sqf` when the server starts up.
    Parameters: none
    Scope: server -> server

[url-version-badge-since-12.0.4]: https://img.shields.io/badge/since-12.0.4-blue
[url-version-badge-since-12.1.0]: https://img.shields.io/badge/since-12.1.0-orange
