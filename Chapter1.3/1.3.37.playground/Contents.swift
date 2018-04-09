/*
 Josephus problem. In the Josephus problem from antiquity, N people are in dire straits and agree to the following strategy to reduce the population. They arrange them- selves in a circle (at positions numbered from 0 to N–1) and proceed around the circle, eliminating every Mth person until only one person is left. Legend has it that Josephus figured out where to sit to avoid being eliminated.
 */

struct Queue<T> {
    private var array = Array<T?>(repeating: nil, count: 1)
    private var headIndex = 0
    private var tailIndex = 0
    var count: Int {
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
}

func josephus(peopleCount: Int, turn: Int) -> Int {
    var queue = Queue<Int>()
    for i in 1...peopleCount {
        queue.enqueue(i)
    }

    while queue.count > 1 {
        for _ in 1..<turn {
            queue.enqueue(queue.dequeue()!)
        }
        queue.dequeue()
    }

    return queue.dequeue()!
}

josephus(peopleCount: 7, turn: 2)
josephus(peopleCount: 2, turn: 3)
josephus(peopleCount: 10, turn: 1)
