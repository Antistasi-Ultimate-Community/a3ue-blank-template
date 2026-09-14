# A3U extender blank example - Extending the store

This working example demonstrates how to add new categories to the black market
dealer's stock. In this case, we add items provided by the
[CTab Blufor Tracker][workshop-url-ctab] mod; hence this addon's dependency on
it.

## Configuration

All store configuration is done with config classes. Namely, two of them:

```sqf
class A3U {
    class traderAddons {
        /* This is where you'll put:
         *
         * - dependencies: i.e.: what other mods provide the items you want
         *   added to the store
         * - a weapons stock definition (it's called "weapons" but its actually
         *   used for any kind of item to buy that can be put in an inventory).
         * - a vehicle stock definition: for vehicles to buy
         */
    };
};

class CfgHALsAddons {
    class CfgHALsStore {
        class categories {
        /* This is where you define one or more buying categories. A3U separates
         * items by their type: rifles, SMGs, launchers, etc. It's a good idea
         * to stick to this principle. You can, however, stuff everything into
         * one category, too.
         */
        };

        class stores {
        /* This is where everything comes together.
         *
         * The stores config takes dependencies from A3U (above) and the
         * categories defined.
         */
        };
    };
};
```

## Tutorial

Suppose, you want players to use the ACE towing feature. You'll need some ropes
to use the feature, but they're not available in the store by default.

### Figure out the class names

The easiest way to find out how things are _really_ called in Arma is by using
the mission editor, 3DEN.

1. Place a playable unit into an empty (VR) mission
2. Edit its inventory and add things you need class names of into the unit's
backpack
3. Run the mission
4. In the in-game debug console, see what `backpackItems player` evaluates to.
5. Those are your class names. Copy them into the clipboard.

![In-game console view](images\console.png)

[workshop-url-ctab]: https://steamcommunity.com/sharedfiles/filedetails/?id=1643720957
