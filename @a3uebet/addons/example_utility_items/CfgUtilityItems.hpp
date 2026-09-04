/**
 * This file demonstrates how to append stuff to the rebel buy menu;
 * specifically, its "OTHER" category where "utility items" can be
 * bought.
 */
class A3A {
    class UtilityItems {
        class Base;

        class GVAR(SupplyBoxBase): Base {
            /**
             * Available flags:
             *
             * - "build": Item is considered a "build box" that opens the base
             *      building interface.
             * - "loot": Item is considered a "loot box" with which loot can be
             *     vacuumed from the game world.
             * - "move": Indicates that the item can be moved around in the
             *      game world after purchase and repeated placement.
             * - "noclear": Inventory of everything is usually cleared, so
             *      default items don't show up in containers; this flag
             *      prevents that.
             * - "place": Indicates that the item can be placed in the game
             *      world after purchase; will just randomly spawn somewhere
             *      otherwise.
             * - "rotate": Indicates that the item can be rotated after
             *      placement.
             */
            flags[] = {};
        };

        class GVAR(SupplyBoxSmall): GVAR(SupplyBoxBase) {
            scope = 1; // Important; won't show otherwise
            displayName = CSTRING(SupplyBoxSmall_DisplayName);
            flags[] = {"place", "move"}; // Small boxes may be moved around
            price = 500; // Price before discounts etc.
        };

        class GVAR(SupplyBoxMedium): GVAR(SupplyBoxBase) {
            scope = 1; // Important; won't show otherwise
            displayName = CSTRING(SupplyBoxMedium_DisplayName);
            flags[] = {"place", "move"}; // Medium boxes may be moved around
            price = 1500; // Price before discounts etc.
        };

        class GVAR(SupplyBoxLarge): GVAR(SupplyBoxBase) {
            scope = 1; // Important; won't show otherwise
            displayName = CSTRING(SupplyBoxLarge_DisplayName);
            flags[] = {"place"}; // Large boxes can only be placed, not moved around
            price = 2500; // Price before discounts etc.
        };
    };
};
