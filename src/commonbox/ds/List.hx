package commonbox.ds;

import commonbox.adt.Collection;
import commonbox.adt.Sequence;
import commonbox.adt.NodeSequence;
import commonbox.impl.LinkedList;
import commonbox.adapter.MutableVariableSequenceUpgrade;


/**
    Variable length sequence optimized for insert & removal.


    | Operation | Computational complexity |
    | --------- | ------------------------ |
    | length | O(1) |
    | get/set, insert/remove | O(1) near the beginning and end of the sequence. O(n) otherwise. |
    | insertNode/removeNode | O(1) |
**/
class List<T>
        implements MutableVariableSequence<T>
        implements NodeSequence<T,LinkedListNode<T>>
        extends MutableVariableSequenceUpgrade<T> {
    var innerSequence:LinkedList<T>;

    public function new() {
        innerSequence = new LinkedList();
        super(innerSequence, LinkedList.new);
    }

    /**
        Returns a new `List` from the given collection.
    **/
    public static function fromCollection<T>(other:Collection<T>):List<T> {
        var array = new List<T>();

        for (item in other) {
            array.push(item);
        }

        return array;
    }

    public function getNodeAt(index:Int) {
        return innerSequence.getNodeAt(index);
    }
}
