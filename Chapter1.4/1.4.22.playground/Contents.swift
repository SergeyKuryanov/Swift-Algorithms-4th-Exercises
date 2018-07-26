/*
 1.4.22 Binary search with only addition and subtraction. [Mihai Patrascu] Write a program that, given an array of N distinct int values in ascending order, determines whether a given integer is in the array. You may use only additions and subtractions and a constant amount of extra memory. The running time of your program should be proportional to log N in the worst case.
 */

func fibonacciSearch(_ input: [Int], target: Int) -> Int {
    var minFib = 1
    var maxFib = 1

    while minFib + maxFib < input.count {
        let sum = minFib + maxFib
        minFib = maxFib
        maxFib = sum
    }

    var lo = 0
    var hi = input.count - 1

    while lo <= hi && minFib >= 0 {
        defer {
            let prev = maxFib - minFib
            maxFib = minFib
            minFib = prev
        }

        let mid = min(minFib + lo, hi)

        guard mid <= hi else { continue }

        let value = input[mid]

        if value < target {
            lo = mid
        } else if value > target {
            hi = mid
        } else {
            return mid
        }
    }

    return -1
}

fibonacciSearch([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], target: 5)
fibonacciSearch([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], target: 15)
fibonacciSearch([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15], target: 1)
fibonacciSearch([1], target: 1)
fibonacciSearch([1], target: 0)
