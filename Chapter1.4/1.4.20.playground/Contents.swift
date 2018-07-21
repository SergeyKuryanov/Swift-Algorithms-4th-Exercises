/*
 1.4.20 Bitonic search. An array is bitonic if it is comprised of an increasing sequence of integers followed immediately by a decreasing sequence of integers. Write a program that, given a bitonic array of N distinct int values, determines whether a given integer is in the array.
 */

func findBitonicPoint(_ input: [Int]) -> Int {
    var lo = 0
    var hi = input.count - 1

    while lo < hi {
        let mid = lo + (hi - lo) / 2
        let left = mid - 1
        let right = mid + 1
        if left < 0 || right >= input.count { return -1 }

        if input[mid] > input[left] && input[mid] > input[right] { return mid }
        else if input[mid] < input[left] { hi = mid }
        else if input[mid] < input[right] { lo = mid + 1 }
        else { return -1 }
    }

    return -1
}

func ascendingBinarySearch(_ input: [Int], lo: Int, hi: Int, target: Int) -> Int {
    var lo = lo
    var hi = hi
    while lo <= hi {
        let mid = lo + (hi - lo) / 2

        if input[mid] < target { lo = mid + 1 }
        else if input[mid] > target { hi = mid - 1}
        else { return mid }
    }

    return -1
}

func descendingBinarySearch(_ input: [Int], lo: Int, hi: Int, target: Int) -> Int {
    var lo = lo
    var hi = hi
    while lo <= hi {
        let mid = lo + (hi - lo) / 2

        if input[mid] > target { lo = mid + 1 }
        else if input[mid] < target { hi = mid - 1}
        else { return mid }
    }

    return -1
}

func bitonicSearch(_ input: [Int], target: Int) -> Int {
    guard input.count > 2 else { return -1 }

    let bp = findBitonicPoint(input)
    if bp == -1 || input[bp] == target { return bp }

    let index = ascendingBinarySearch(input, lo: 0, hi: bp - 1, target: target)
    return index != -1 ? index : descendingBinarySearch(input, lo: bp + 1, hi: input.count - 1, target: target)
}

bitonicSearch([1, 3, 5, 4, 2, -1, -10], target: 5)
bitonicSearch([1, 3, 5, 4, 2, -1, -10], target: -10)
bitonicSearch([1, 3, 5, 4, 2, -1, -10, -40], target: 1)
bitonicSearch([1, 2, 3, 4, 5, 6, 7], target: 5)
bitonicSearch([10, 9, 8, 7, 6, 5, 4, 3, 2, 1], target: 5)
