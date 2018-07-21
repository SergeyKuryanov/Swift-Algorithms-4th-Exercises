/*
 1.4.10 Modify binary search so that it always returns the element with the smallest index that matches the search element (and still guarantees logarithmic running time).
 */

var input = [1,2,2,3,4,4,5,6,6,6,6,6,6,6,7,8,9,10]

func binarySearch(from: Int, to: Int, value: Int, input: [Int]) -> Int {
    guard from <= to else { return Int.max }

    let mid = from + (to - from) / 2
    
    if input[mid] > value {
        return binarySearch(from: from, to: mid - 1, value: value, input: input)
    } else if input[mid] < value {
        return binarySearch(from: mid + 1, to: to, value: value, input: input)
    } else {
        return min(mid, binarySearch(from: from, to: mid - 1, value: value, input: input))
    }
}

binarySearch(from: 0, to: input.count - 1, value: 6, input: input)
