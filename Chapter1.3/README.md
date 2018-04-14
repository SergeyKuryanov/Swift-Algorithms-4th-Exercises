## Chapter 1.3 Bags, Queues, and Stacks

### Exercises

**1.3.1**  `isFull()` implemetation could check for `N == cap`, where `cap` is internal variable set on `init`

**1.3.2** Output is: `was` `best` `times` `of` `the` `was` `the` `it`

**1.3.3** `f. 0 4 6 5 3 8 1 7 2 9` is impossible with stack `push` and `pop` operations

**1.3.4** [Solution for 1.3.4](1.3.4.md)

**1.3.5** Binary representation of 50 - `110010`

**1.3.6** This code fragment reverses the queue

**1.3.7** `peek()` may look like this `return array[size() - 1]` or `return array.last`

**1.3.8** Contents `it` size `1`

**1.3.9** [Solution for 1.3.9](1.3.9.md)

**1.3.10** [Solution for 1.3.10](1.3.10.md)

**1.3.11** [Solution for 1.3.11](1.3.11.md)

**1.3.12** Stack iterator [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Stack#array). Swift stack implemtation does not need copy() method because of value type. Anyway this method trivial to implement with iterator

**1.3.13** `b`, `c`, `d` sequences is not possible with queue

**1.3.14** Resizable Queue [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Queue#resizable-array)

**1.3.15** Queue iterator [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Queue#array). With iterator we just return k-th string from queue

### Linked-List Exercises

**1.3.18** Deletes from the list the node immediately following x

**1.3.19** Such behaviour [impemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Linked%20List#double-linked-list) with double linked list

**1.3.20** `remove(at:)` [impemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Linked%20List)

**1.3.21** Stack iterator [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Linked%20List). Solution is trivial - iterate and return `true` if string found

**1.3.22** Inserts node t immediately after node x

**1.3.23** When it comes time to update t.next, x.next is no longer the original node following x, but is instead t itself!

**1.3.24** `removeAfter(_)` [impemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Linked%20List)

**1.3.25** `insert(_, after:)` [impemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Linked%20List)

**1.3.26** Iterate over nodes and remove matches. For singly linked list we need to remember previus node and current, for double linked lise we just exchange next and prev poiners:

```swift
repeat {
    if node.value == search {
        node.next.prev = node.prev
        node.prev.next = node.next
    }

    node = node.next
} while node != nil
```

**1.3.27** Implementation similar to previous, but instead of comparsion we remember max node value.

**1.3.28** Solution is trivial:
```swift
func maxNode(_ node: Node<Int>?, currentMax: Int) -> Int {
    guard let node = node else { return currentMax }
    let newMax = max(currentMax, node.value)
    return maxNode(node.next, currentMax: newMax)
}
```

**1.3.29** Queue [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Queue)

**1.3.30**

**1.3.31** Double Linked List [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Linked%20List#double-linked-list)

### Creative Problems

**1.3.32** Steque [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Steque)

**1.3.33** Deque [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Deque)

**1.3.34** Bag [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Bag)

**1.3.35** Random Queue [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Queue#random-queue)

**1.3.36** Random Queue iterator [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Queue#random-queue)

**1.3.37** [Solution for 1.3.37](1.3.37.md)

**1.3.38** [Solution for 1.3.38](1.3.38.md)

**1.3.39** Ring Buffer [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Ring%20Buffer)

**1.3.40** [Solution for 1.3.40](1.3.40.md)

**1.3.41**

**1.3.42** 

**1.3.43** [Solution for 1.3.43](1.3.43.md)

**1.3.44** [Solution for 1.3.44](1.3.44.md)

**1.3.45** [Solution for 1.3.45](1.3.45.md)

**1.3.46**

**1.3.47** Use linked list to catenate

**1.3.48** One stack push and pop left on deque, another on right

**1.3.49** [Solution for 1.3.49](1.3.49.md)

**1.3.50** 



