## Chapter 1.4 Analysis of Algorithms

### Exercises

**1.4.8** Write a program to determine the number pairs of values in an input file that are equal.

Sort input in `n log n` and iterate with maintainig previous value to detect equal values.
```swift
let nums = nums.sorted()

var pairs = 0
for (index, number) in nums.enumerated().dropFirst() where number == nums[index - 1] {
    pairs += 1
}
```

**1.4.10** [Solution for 1.4.10: Element with the smallest index that matches the search element](1.4.10.md)

**1.4.12** [Solution for 1.4.12: Duplicates in sorted arrays](1.4.12.md)

**1.4.14** 4-sum [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Problems/N-Sum)

**1.4.15** 3-sum [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Problems/N-Sum)

**1.4.16** Closest pair

Sort input array, iterate over it and compare diference between previous item.
```swift
let nums = nums.sorted()

var closestPair = (nums[0], nums[1])
var difference = abs(closestPair.0 - closestPair.1)

for (index, number) in nums.enumerated().dropFirst() {
    let prevNumber = nums[index - 1]
    let currentDifference = abs(prevNumber - number)

    if currentDifference < difference {
        closestPair = (prevNumber, number)
        difference = currentDifference
    }
}

return closestPair
```

**1.4.17** Farthest pair

Sort input array, iterate over it and find min and max values.
```swift
var currentMin = nums[0]
var currentMax = nums[0]

for number in nums {
    currentMin = min(currentMin, number)
    currentMax = max(currentMax, number)
}

return (currentMin, currentMax)
```

**1.4.20** [Solution for 1.4.20: Bitonic search](1.4.20.md)

**1.4.22** [Solution for 1.4.22: Binary search with addition and substraction only, Fibonacci search](1.4.22.md)

**1.4.24** Throwing eggs from a building

Drop an edd from floor equal to degrees of two (1, 2, 4, 8 ...) After egg breaks use binary search to find exact floor.

**1.4.25** Throwing two eggs from a building

We can't user binary search for this. Good sollution is to use first egg to find 10-floor range and second to find exact floor with using linear search. Best solution will be to find range based on number of floors using triangular series formula:  
`n (n + 1) / 2 = number_of_floors`