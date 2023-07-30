import UIKit

var greeting = "Hello, playground"

// MARK: Use Dijkstra's Algorithm to find the shortest route between one point and another point

class Student {
    var mark: Int
    var name: String
    
    init(mark: Int, name: String) {
        self.mark = mark
        self.name = name
    }
}

var listOfStudents: [Student] = [
    .init(mark: 100, name: "Aung Ko Ko"),
    .init(mark: 70, name: "Htun Zaw"),
    .init(mark: 65, name: "Bo Phyu")
]


// reduce

let totalMarks = listOfStudents.reduce(0) { $0 + $1.mark }
debugPrint(totalMarks)

// MARK: How would you find the second largest element in an array of integers on iOS?

extension Array where Element: Comparable {
    func extractSecondLargestNumber() -> Element? {
        guard self.count >= 2 else {
            return nil
        }
        return self.sorted(by: >)[1]
    }
    
    mutating func reverseArrayInPlace() -> [Element] {
        var start = 0
        var end = self.count - 1
        
        while start < end {
            self.swapAt(start, end)
            start += 1
            end -= 1
        }
        
        return self
    }
    
    func binarySearch( target: Element) -> Int? {
        var low = 0
        var high = self.count - 1
        
        while low <= high {
            let mid = low + (high - low) / 2
            let midValue = self[mid]
            
            if midValue == target {
                return mid // Target found at index mid
            } else if midValue < target {
                low = mid + 1 // Search the right half of the array
            } else {
                high = mid - 1 // Search the left half of the array
            }
        }
        return nil // Target not found
    }
    
    // MARK: Merge Sort
    func mergeSort() -> [Element] {
        guard count > 1 else { return self }
        
        let mid = count / 2
        let left = Array(self[..<mid]).mergeSort()
        let right = Array(self[mid...]).mergeSort()
        
        return merge(left, right)
    }
    
    func merge(_ left: [Element], _ right: [Element]) -> [Element] {
        var mergedArray = [Element]()
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] < right[rightIndex] {
                mergedArray.append(left[leftIndex])
                leftIndex += 1
            } else {
                mergedArray.append(right[rightIndex])
                rightIndex += 1
            }
        }
        
        if leftIndex < left.count {
            mergedArray.append(contentsOf: left[leftIndex...])
        }
        
        if rightIndex < right.count {
            mergedArray.append(contentsOf: right[rightIndex...])
        }
        
        return mergedArray
    }
    
    // MARK: Quick Sort
    mutating func quickSort() {
        quickSortHelper(low: 0, high: count - 1)
    }
    
    private mutating func quickSortHelper(low: Int, high: Int) {
        if low < high {
            let pivotIndex = partition(low: low, high: high)
            quickSortHelper(low: low, high: pivotIndex - 1)
            quickSortHelper(low: pivotIndex + 1, high: high)
        }
    }
    
    private mutating func partition(low: Int, high: Int) -> Int {
        let pivot = self[high]
        var i = low - 1
        
        for j in low..<high {
            if self[j] <= pivot {
                i += 1
                swapAt(i, j)
            }
        }
        
        swapAt(i + 1, high)
        return i + 1
    }
}

// MARK: Find Missing Number in Int Array
extension Array where Element == Int {
    func findMissingNumber() -> Element? {
        let n = self.count
        let expectedSum = (n * (n + 1)) / 2
        let actualSum = self.reduce(0, +)
        return expectedSum - actualSum
    }
}

// MARK: Factorial
extension Int {
    func factorial() -> Int {
        if self == 0 {
            return 1
        } else {
            return self * (self - 1).factorial()
        }
    }
}

// MARK:  Given an array of integers, how would you remove all duplicates efficiently?
extension Array where Element: Hashable {
    func removeDuplicates() -> [Element] {
        let uniqueSet = Set(self)
        return Array(uniqueSet)
    }
}


var listOfNumbers = [2, 22, 301, 45632]
let arrayWithStringDuplicates = ["A", "B", "C", "A", "D"]
var arrayWithNumberDuplicates = [1, 2, 3, 2, 4, 5, 1, 6, 7, 7]
var listOfStringToBeReversed = ["Alice", "Bob", "Charles"]
var listOfNumbersWithMissingValues = [0,10,20,30,50]
let sampleInt = arrayWithNumberDuplicates.removeDuplicates().sorted(by: <).reduce(String()) { $0 + String($1) }
let sampleString = arrayWithStringDuplicates.removeDuplicates().sorted(by: <).reduce(String()) { $0 + $1 }

debugPrint(sampleInt)
debugPrint(sampleString)
debugPrint(listOfNumbers.extractSecondLargestNumber() ?? 0)
listOfStringToBeReversed.reverseArrayInPlace().forEach { debugPrint($0) }
debugPrint(listOfNumbersWithMissingValues.findMissingNumber() ?? 0)
debugPrint(5.factorial())
debugPrint([1, 321, 5, 7, 9, 11, 13, 15].sorted(by: <).binarySearch(target: 13) ?? 0)
debugPrint(["ABCD", "ABC", "DEF"].sorted(by: <).binarySearch(target: "ABCD") ?? 0)

var numbers = [64, 34, 25, 12, 22, 11, 90]
numbers.quickSort()
debugPrint(numbers)

// MARK: Description

// MARK: Benefit of using Binary Search
//
// 1. Efficiency
// 2. Optimization
// 3. Fewer Comparisons
// 4. Simplicity
// 5. Memory Efficiency
// 6. Good Performace

// MARK: Benefit of using merge sort and quick sort over bubble sort

// 1. Efficiency:
// 2. Performance on Large Datasets:
// 3. Stability:
// 4. Space Complexity:
// 5. Algorithm Complexity Analysis:

// MARK: Difference between Mutating Functions and Normal Functions

//To summarize, the main difference between mutating func and func in Swift lies in their capability to modify the instance or input parameters. Regular func cannot modify instance properties for value types, while mutating func allows modification within the context of value types. For reference types (classes), the mutating keyword is not needed, as class instances are mutable by default.


