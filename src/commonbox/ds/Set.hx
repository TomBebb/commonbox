package commonbox.ds;

import commonbox.adt.Collection;
import commonbox.adt.Set;
import commonbox.impl.MapSet;
import commonbox.adapter.MutableSetUpgrade;


/**
    Collection of non-repeating items.


    | Operation | Computational complexity |
    | --------- | ------------------------ |
    | length | O(1) |
    | add/remove | O(1) average. O(n) for Any/Dynamic. |
**/
class Set<T> extends MutableSetUpgrade<T> implements MutableSet<T> {
    public function new() {
        super(new MapSet(), MapSet.new);
    }

    /**
        Returns a new `Set` from the given collection.
    **/
    public static function fromCollection<T>(other:Collection<T>):Set<T> {
        var set = new Set<T>();

        for (item in other) {
            set.add(item);
        }

        return set;
    }
}
