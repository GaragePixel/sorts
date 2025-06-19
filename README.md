# Sorting Algorithms Library

**Implementation:** iDkP from GaragePixel  
**Date:** 2011 – 2025-03-15  
**Aida Version:** 4

A comprehensive collection of sorting algorithms implemented with generic support for any comparable data type.

---

## Purpose

This library provides a comprehensive collection of sorting algorithms for educational and practical use. Each implementation includes historical context and technical characteristics to help understand algorithm choices. All algorithms are implemented as generic functions to work with any comparable data type.

---

## Notes: Category Definitions and Implementation Choices

- **advanced**:  
	Modern/adaptive/optimized sorts, often hybrid or state-of-the-art, not classic textbook sorts.
- **classicals**:  
	Historically important, fundamental algorithms (e.g., bubble, selection, insertion, merge, quick).
- **educationals**:  
	Algorithms mainly used to demonstrate sorting concepts, recursion, or to show inefficiency/complexity. Not practical for real use.
- **o2sorts**:  
	Quadratic (O(n²)) sorts not in the classic category, or with a unique twist/optimization.
- **specials**:  
	Unusual, rare, or novelty sorts; may include non-comparison sorts or those with odd properties.

---

## List of Functionality

- **Classical algorithms:** QuickSort, MergeSort, HeapSort, InsertionSort
- **Advanced algorithms:** IntroSort, ShellSort, MergeSortInPlace (InPlaceMergeSort)
- **Unusual algorithms:** BogoSort, GnomeSort, OddEvenSort, CubeSort, TournamentSort, BubbleSort (classical never used one)
- Full generic support through `<T>` type parameter
- In-place and auxiliary memory implementations
- Various time complexity profiles from O(n log n) to O(n²) to O(n×n!)
- Performance characteristics comments for algorithm selection

---

## Notes

The implementations prioritize clarity and correctness over micro-optimization to facilitate learning and understanding. While the code is suitable for production use, time-critical applications should consider the complexity annotations to choose appropriate algorithms for their specific needs.

For very large datasets, algorithms like QuickSort, MergeSort, HeapSort, and especially IntroSort offer the best general-case performance. For small datasets or nearly-sorted data, InsertionSort often performs better despite its O(n²) theoretical complexity.

---

## Technical Advantages

- Generic implementation working with any comparable type
- Clear annotations of time/space complexity
- Historical context for each algorithm
- Consistent interface across all implementations
- Modular design allowing easy integration into larger systems
- Mix of recursive and iterative approaches
- Educational value with implementation details exposed

For practical applications, **IntroSort** is recommended as it combines the best features of QuickSort, HeapSort, and InsertionSort to deliver reliable O(n log n) performance in all cases. The parallel version further leverages multi-core systems for large datasets.

---

## When to Use Which Algorithm

- **IntroSort:** Best general-purpose algorithm
- **QuickSort:** Good average case but worst-case concerns
- **MergeSort:** Stable sorting with guaranteed performance
- **HeapSort:** Memory-constrained environments
- **InsertionSort:** Very small arrays or nearly sorted data
- **ShellSort:** Good compromise between simplicity and performance
- **Others:** Primarily educational or specialized use cases

---

## Example Usage

```wonkey
Local data:=New Int[](5, 2, 9, 1, 5, 6)
IntroSort<Int>(data)
' data is now [1, 2, 5, 5, 6, 9]
