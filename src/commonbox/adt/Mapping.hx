package commonbox.adt;

import haxe.ds.Option;


/**
    Collection of items pairs (key and value).

    At most one key is associated with a value.
**/
interface BaseMapping<K,V> extends Collection<V> {
    /**
        Returns whether the given key is in the collection.
    **/
    function containsKey(key:K):Bool;

    /**
        Returns the value associated with the given key.
    **/
    function get(key:K):Option<V>;

    /**
        Returns the keys in the collection.
    **/
    function keys():IIterator<K>;
}


interface Mapping<K,V>
        extends BaseMapping<K,V> extends
        Copyable<Mapping<K,V>> {
    /**
        Returns the value if the key exists, otherwise the given default.
    **/
    function getOrElse(key:K, ?defaultItem:V):V;

    /**
        Returns the value if the key exists, otherwise throws `NotFoundException`.
    **/
    function getOnly(key:K):V;

    /**
        Returns whether the collection is empty.
    **/
    function isEmpty():Bool;

    /**
        Returns whether this collection has the same items in the given collection.
    **/
    function contentEquals(other:BaseMapping<K,V>):Bool;
}


interface BaseMutableMapping<K,V> extends BaseMapping<K,V> {
    /**
        Sets the value associated with the key.

        If the given key already has an association, it is replaced.
    **/
    function set(key:K, value:V):Void;

    /**
        Remove the association by the given key.
    **/
    function remove(key:K):Bool;
}


interface MutableMapping<K,V>
        extends Mapping<K,V>
        extends BaseMutableMapping<K,V>
        extends Copyable<MutableMapping<K,V>> {
    /**
        Remove all associations.
    **/
    function clear():Void;
}
