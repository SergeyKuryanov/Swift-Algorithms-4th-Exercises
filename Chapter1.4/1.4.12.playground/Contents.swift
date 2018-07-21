/*
 1.4.12 Write a program that, given two sorted arrays of N int values, prints all elements that appear in both arrays, in sorted order. The running time of your program should be proportional to N in the worst case.
 */

var primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]
var fibonacci = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]

func printDuplicates(a: [Int], b: [Int]) {
    var aIndex = 0
    var bIndex = 0

    while aIndex < a.count, bIndex < b.count {
        if a[aIndex] == b[bIndex] {
            print(a[aIndex])
            aIndex += 1
            bIndex += 1
        }
        if a[aIndex] < b[bIndex] {
            aIndex += 1
        } else {
            bIndex += 1
        }
    }
}

printDuplicates(a: primes, b: fibonacci)
