/*
1.3.40 Move-to-front. Read in a sequence of characters from standard input and maintain the characters in a linked list with no duplicates. When you read in a previ- ously unseen character, insert it at the front of the list. When you read in a duplicate character, delete it from the list and reinsert it at the beginning.
*/

class LinkedList<T> {
    typealias ListNode = Node<T>

    class Node<T> {
        var next: Node<T>?
        var prev: Node<T>?
        let value: T

        init(_ value: T) {
            self.value = value
        }

        public var description: String {
            return String(describing: value)
        }
    }

    var head: ListNode?
    var tail: ListNode?

    func isEmpty() -> Bool {
        return head == nil
    }

    func appendHead(_ value: T) {
        let newNode = ListNode(value)
        head?.prev = newNode
        newNode.next = head
        head = newNode

        if tail == nil {
            tail = head
        }
    }
}

extension LinkedList: Sequence {
    struct ListItetator: IteratorProtocol {
        private var current: ListNode?

        init(current: ListNode?) {
            self.current = current
        }

        mutating func next() -> ListNode? {
            defer {
                current = current?.next
            }

            return current
        }
    }

    func makeIterator() -> ListItetator {
        return ListItetator(current: head)
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var desc = "["
        var node = head
        while node != nil {
            desc += "\(node!.value)"
            node = node?.next
            if node != nil { desc += ", " }
        }
        return desc + "]"
    }
}

func moveToFront(_ input: String) -> String {
    let linkedList = LinkedList<Character>()

    for character in input {
        for node in linkedList {
            if node.value == character {
                node.next?.prev = node.prev
                node.prev?.next = node.next
                break;
            }
        }

        linkedList.appendHead(character)
    }


    return linkedList.description
}

moveToFront("abcdefghazxycdzxqa")
