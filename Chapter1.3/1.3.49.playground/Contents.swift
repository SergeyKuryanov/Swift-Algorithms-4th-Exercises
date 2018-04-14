/*
 1.3.49 Queue with three stacks. Implement a queue with three stacks so that each queue operation takes a constant (worst-case) number of stack operations.
 */

struct Stack<T> {
    private var array = Array<T>()
    var count: Int {
        return array.count
    }

    mutating func pop() -> T {
        return array.removeLast()
    }

    mutating func push(_ value: T) {
        array.append(value)
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        return "\(array.compactMap { $0 })"
    }
}

struct Queue<T> {
    var dequeueStack = Stack<T>()
    var enqueueStack = Stack<T>()

    mutating func enqueue(_ value: T) {
        enqueueStack.push(value)
    }

    mutating func dequeue() -> T {
        if dequeueStack.count == 0 {
            while enqueueStack.count > 0 {
                dequeueStack.push(enqueueStack.pop())
            }
        }

        return dequeueStack.pop()
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        return "\(dequeueStack.description)<- | ->\(enqueueStack.description)"
    }
}

var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)
queue.dequeue()
queue.dequeue()
queue.enqueue(5)
queue.enqueue(6)
queue.dequeue()
queue.dequeue()


