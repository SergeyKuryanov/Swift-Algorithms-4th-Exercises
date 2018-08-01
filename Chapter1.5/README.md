## Chapter 1.5 Case Study: Union-Find

### Exercises

**1.5.1** Quick-Find: Access : 96 Contents: `[1, 1, 1, 1, 1, 1, 6, 1, 1, 1]`

**1.5.2** Quick-Union: Access: 34 Contents: `[4, 1, 1, 4, 1, 8, 6, 2, 1, 0]`

**1.5.3** Weighted Quick-Union: Access: 60 Contents: `[9, 7, 7, 9, 3, 9, 6, 5, 5, 9]`

**1.5.7** Quick-Find and Quick-Union [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Union-Find)

**1.5.8** This implementation may cause a bug when not all nodes will be updated, due to change of id[p]

### Creative Problems

**1.5.12** Quick-Union with Path Compression [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Union-Find)

**1.5.13** Weighted Quick-Union with Path Compression [implemented here](https://github.com/SergeyKuryanov/Swift-Data-Structures-and-Algorithms/tree/master/Union-Find)


**1.5.14** Weighted quick-union by height [solution](1.5.14.md)

**1.5.20** Dynamic growth. Using linked lists or a resizing array, develop a weighted quick-union implementation that removes the restriction on needing the number of objects ahead of time.

```swift
func updateStorage(index: Int, value: Int) {
        if index > storage.count {
            var newStorage = [Int]()
            newStorage += 0..<index * 2

            newStorage[0..<storage.count] = storage[0..<storage.count]
            storage = newStorage
        }
        storage[index] = value
    }
```