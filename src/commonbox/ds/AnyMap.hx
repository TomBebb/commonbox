package commonbox.ds;

import commonbox.adapter.MutableMappingUpgrade;
import commonbox.adt.Mapping;
import commonbox.impl.AnyKeyArrayMap;


/**
    Mapping that supports Any/Dynamic keys.

    In most cases, more optimized mapping data structures should be used.
    However, in the cases where small maps are needed, such as tracking
    anonymous callback functions, this is suitable.

    | Operation | Computational complexity |
    | --------- | ------------------------ |
    | length | O(1) |
    | get/set/remove | O(n) |
**/
class AnyMap<K,V> extends MutableMappingUpgrade<K,V>
        implements MutableMapping<K,V> {
    public function new() {
        super(new AnyKeyArrayMap(), AnyKeyArrayMap.new);
    }
}
