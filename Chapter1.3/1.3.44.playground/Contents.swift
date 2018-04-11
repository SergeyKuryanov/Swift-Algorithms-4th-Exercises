/*
 1.3.44 Text editor buffer. Develop a data type for a buffer in a text editor
 */

struct Stack<T> {
    private var array = Array<T>()
    var count: Int {
        return array.count
    }

    var isEmpty: Bool {
        return count == 0
    }

    mutating func pop() -> T {
        return array.removeLast()
    }

    mutating func push(_ value: T) {
        array.append(value)
    }

    func peek() -> T? {
        return array.last
    }
}

extension Stack: Sequence {
    struct StackItetator: IteratorProtocol {
        private var elements: [T]

        init(elements: [T]) {
            self.elements = elements
        }

        mutating func next() -> T? {
            guard !elements.isEmpty else { return nil }
            return elements.popLast()
        }
    }

    func makeIterator() -> StackItetator {
        return StackItetator(elements: array)
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        return "count: \(count), \(array.compactMap { $0 })"
    }
}

struct TextBuffer {
    private var leftBuffer = Stack<Character>()
    private var rightBuffer = Stack<Character>()

    var size: Int {
        return leftBuffer.count + rightBuffer.count
    }

    mutating func insert(_ char: Character) {
        leftBuffer.push(char)
    }

    mutating func delete() -> Character? {
        guard !leftBuffer.isEmpty else { return nil }

        return leftBuffer.pop()
    }

    mutating func left(by padding: Int) {
        for _ in 0..<padding {
            guard !leftBuffer.isEmpty else { return }

            rightBuffer.push(leftBuffer.pop())
        }
    }

    mutating func right(by padding: Int) {
        for _ in 0..<padding {
            guard !rightBuffer.isEmpty else { return }

            leftBuffer.push(rightBuffer.pop())
        }
    }
}

extension TextBuffer: CustomStringConvertible {
    public var description: String {
        return "size: \(size), \(leftBuffer.description) \(rightBuffer.description)"
    }
}

var textBuffer = TextBuffer()
textBuffer.insert("a")
textBuffer.insert("b")
textBuffer.insert("d")
textBuffer.delete()
textBuffer.insert("c")
textBuffer.left(by: 1)
textBuffer.delete()
textBuffer.insert("e")
textBuffer.right(by: 5)
