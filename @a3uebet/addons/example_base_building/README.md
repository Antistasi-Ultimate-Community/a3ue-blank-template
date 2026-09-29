# A3U extender blank example - Custom builder boxes

This working example demonstrates how to define boxes for Antistasi's base
building feature. We call them builder boxes in this example.

## Configuration

Builder boxes are just _objects_; they're defined in `CfgVehicles`.

```sqf
class CfgVehicles {
    class GVAR(MyBuilderBox) {
        // Static items list
        buildableObjects[] = { /* list of objects or categories */ };

        // Items list filled by calling a function
        buildableObjectsCode = "";
    };
};
```

> [!NOTE]
> Since builder boxes are _just objects_, Antistasi won't know what to do with
> them until you add your boxes to the _utility items_ lists.
> [There is an example how to do that][url-example-utility-items], too.

[url-example-utility-items]: https://github.com/Antistasi-Ultimate-Community/a3ue-blank-template/tree/master/%40a3uebet/addons/example_utility_items
