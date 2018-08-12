/*
 2.1.24 Insertion sort with sentinel. Develop an implementation of insertion sort that eliminates the j>0 test in the inner loop by first putting the smallest item into position. Use SortCompare to evaluate the effectiveness of doing so.
 */

extension Array where Element: Comparable {
    mutating func insertionSortWithSentinel() {

        guard self.count > 0 else { return }

        var min = self[0]
        var minIndex = 0

        for (index, value) in self.enumerated() {
            if min > value {
                min = value
                minIndex = index
            }
        }

        swapAt(0, minIndex)

        for i in 1..<self.count {
            let temp = self[i]

            var j = i

            while temp < self[j - 1] {
                self[j] = self[j - 1]

                j -= 1
            }

            self[j] = temp
        }
    }
}

var array = [1,2,19,23,14,37,8,33,45,8,3]
array.insertionSortWithSentinel()
