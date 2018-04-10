class LinkedList<T> {
    typealias ListNode = Node<T>

    class Node<T>: CustomStringConvertible {
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

    func appendTail(_ value: T) {

        let newNode = ListNode(value)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode

        if head == nil {
            head = tail
        }
    }

    func removeHead() -> ListNode? {
        if head == nil && tail != nil {
            return removeTail()
        }

        let headNode = head
        head = head?.next
        head?.prev = nil

        return headNode
    }

    func removeTail() -> ListNode? {
        if tail == nil && head != nil {
            return removeHead()
        }

        let tailNode = tail
        tail = tailNode?.prev
        tail?.next = nil

        if tail == nil {
            head?.next = nil
        }

        return tailNode
    }

    func remove(at index: Int) -> ListNode? {
        guard index > 0 else {
            return removeHead()
        }

        var node = head

        for _ in 0..<index {
            node = node?.next
        }

        node?.prev?.next = node?.next
        node?.next?.prev = node?.prev

        return node
    }

    func removeAfter(_ node: ListNode) -> ListNode? {
        defer {
            if tail === node.next {
                tail = node
            }

            node.next = node.next?.next
            node.next?.prev = node
        }

        return node.next
    }

    func insert(_ node: ListNode?, after anotherNode: ListNode?) {
        guard let node = node, let anotherNode = anotherNode else { return }
        node.next = anotherNode.next
        node.prev = anotherNode

        anotherNode.next = node
        node.next?.prev = node
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

struct LinkedListGeneralizedQueue<T> {
    private let linkedList = LinkedList<T>()

    mutating func dequeue() -> T? {
        return linkedList.removeHead()?.value
    }

    mutating func enqueue(_ value: T) {
        linkedList.appendTail(value)
    }

    mutating func delete(at index: Int) -> T? {
        return linkedList.remove(at: index)?.value
    }
}

extension LinkedListGeneralizedQueue: CustomStringConvertible {
    public var description: String {
        return linkedList.description
    }
}


var linkedListGeneralizedQueue = LinkedListGeneralizedQueue<Int>()
linkedListGeneralizedQueue.enqueue(1)
linkedListGeneralizedQueue.enqueue(2)
linkedListGeneralizedQueue.enqueue(3)
linkedListGeneralizedQueue.enqueue(4)
linkedListGeneralizedQueue.delete(at: 2)

struct ArrayGeneralizedQueue<T> {
    private var array = Array<T?>(repeating: nil, count: 1)
    private var headIndex = 0
    private var tailIndex = 0
    private var count: Int {
        return tailIndex - headIndex
    }

    mutating func dequeue() -> T? {
        guard count > 0 else { return nil }

        defer {
            array[headIndex] = nil
            headIndex += 1
            resizeIfNeed()
        }

        return array[headIndex]
    }

    mutating func enqueue(_ value: T) {
        array[tailIndex] = value
        tailIndex += 1
        resizeIfNeed()
    }

    mutating private func resizeIfNeed() {
        if tailIndex >= array.count {
            resizeTo(size: count * 2)
        } else if count <= array.count / 4 {
            resizeTo(size: array.count / 2)
        }
    }

    mutating private func resizeTo(size: Int) {
        var newArray = Array<T?>(repeating: nil, count: size)
        newArray[0..<count] = array[headIndex..<tailIndex]
        array = newArray
        tailIndex = count
        headIndex = 0
    }

    mutating func delete(at index: Int) -> T? {
        guard array.count > index else { return nil }
        defer {
            tailIndex -= 1
            resizeIfNeed()
        }

        return array.remove(at: index)
    }
}

extension ArrayGeneralizedQueue: CustomStringConvertible {
    public var description: String {
        return "count: \(count), \(array.compactMap { $0 })"
    }
}

var arrayGeneralizedQueue = ArrayGeneralizedQueue<Int>()
arrayGeneralizedQueue.enqueue(1)
arrayGeneralizedQueue.enqueue(2)
arrayGeneralizedQueue.enqueue(3)
arrayGeneralizedQueue.enqueue(4)
arrayGeneralizedQueue.delete(at: 2)
