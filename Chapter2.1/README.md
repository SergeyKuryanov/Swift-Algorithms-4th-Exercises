## Chapter 2.1 Elementary Sorts

### Exercises

**2.1.2** Maximum number of exchanges for Selection sort will be n-1 for case where max element is on index 0.

**2.1.3** Min will be updated max times when order of elements is reversed.

**2.1.5** Inner loop for Insertion sort will fail if input already sorted.

**2.1.6** Insertion sort will be faster than selection sort for all identical array due to inner loop will be skipped since array is already sorted.

**2.1.7** For reversed order array Selection sort will be faster than Insertion sort due to less number of compares.

**2.1.8** Insertion sort running time for randomly ordered array of 3 items still will be quadratic worst case.

**2.1.10** Selection sort did not get any benefits from partitally sorted array, so h-sorting will not speed up it.

**2.1.15** _Expensive exchange._

Insertion sort should be used with modification to avoid unnesessary swaps. [Implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Sorting%20Algorithms/Insertion%20Sort)

### Experiments

**2.1.24** [Insertion sort with sentinel solution](2.1.24.md)

**2.1.25** Insertion sort without exchanges [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Sorting%20Algorithms/Insertion%20Sort)

