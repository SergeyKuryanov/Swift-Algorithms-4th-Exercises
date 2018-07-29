/*
 Weighted quick-union by height. Develop a UF implementation that uses the same basic strategy as weighted quick-union but keeps track of tree height and always links the shorter tree to the taller one.
 */

class WeightedHeightQuickUnion {
    var heights = [Int]()
    var storage = [Int]()

    init(count: Int) {
        heights = Array(repeating: 0, count: count)
        storage += 0..<count
    }

    func root(of node: Int) -> Int {
        var node = node

        while (node != storage[node]) {
            node = storage[node]
        }

        return node
    }

    func union(p: Int, q: Int) {
        let pRoot = root(of: p)
        let qRoot = root(of: q)

        guard pRoot != qRoot else { return }

        let pHeight = heights[pRoot]
        let qHeight = heights[qRoot]

        if pHeight < qHeight {
            storage[pRoot] = qRoot
            heights[qRoot] += pHeight
        } else if pHeight > qHeight {
            storage[qRoot] = pRoot
            heights[pRoot] += qHeight
        } else {
            storage[pRoot] = qRoot
            heights[qRoot] += 1
        }
    }
}

extension WeightedHeightQuickUnion: CustomStringConvertible {
    var description: String {
        return "\(storage) - \(heights)"
    }
}

let whqu = WeightedHeightQuickUnion(count: 10)
whqu.union(p: 9, q: 0)
whqu.union(p: 3, q: 4)
whqu.union(p: 5, q: 8)
whqu.union(p: 7, q: 2)
whqu.union(p: 2, q: 1)
whqu.union(p: 5, q: 7)
whqu.union(p: 0, q: 3)
whqu.union(p: 4, q: 2)
