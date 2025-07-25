Namespace sorts

'==============================================================
' Sorting Algorithms Library
' Implementation: iDkP from GaragePixel
' 2011 - 2025-07-23 (Aida 4)
' Wrote for Mx2 compatible W.
'
' A comprehensive collection of sorting algorithms implemented
' with generic support for any comparable data type
'==============================================================

'Actually implemented 14 sorts
'Soon 4 new sorts
'TODO: Not only for array and with a custom compare function, with a filter above

'--------------------------------------------------------------
' Library Overview
'--------------------------------------------------------------

' Purpose:
' This library provides a comprehensive collection of sorting algorithms
' for educational and practical use. Each implementation includes historical
' context and technical characteristics to help understand algorithm choices.
' All algorithms are implemented as generic functions to work with any
' comparable data type.
'
' Functionality:
' - Classical algorithms: QuickSort, MergeSort, HeapSort, InsertionSort
' - Advanced algorithms: IntroSort, ShellSort, MergeSortInPlace (InPlaceMergeSort)
' - Unusual algorithms: BogoSort, GnomeSort, OddEvenSort, CubeSort, TournamentSort,
'	BubbleSort(classical never used one)
' - Full generic support through <T> type parameter
' - In-place and auxiliary memory implementations
' - Various time complexity profiles from O(n log n) to O(n²) to O(n×n!)
' - Performance characteristics comments for algorithm selection
'
' Notes:
' The implementations prioritize clarity and correctness over
' micro-optimization to facilitate learning and understanding. While
' the code is suitable for production use, time-critical applications
' should consider the complexity annotations to choose appropriate 
' algorithms for their specific needs.
'
' For very large datasets, algorithms like QuickSort, MergeSort, HeapSort,
' and especially IntroSort offer the best general-case performance.
' For small datasets or nearly-sorted data, InsertionSort often performs
' better despite its O(n²) theoretical complexity.
'
' Technical advantages:
' - Generic implementation working with any comparable type
' - Clear annotations of time/space complexity
' - Historical context for each algorithm
' - Consistent interface across all implementations
' - Modular design allowing easy integration into larger systems
' - Mix of recursive and iterative approaches
' - Educational value with implementation details exposed
'
' For practical applications, IntroSort is recommended as it combines
' the best features of QuickSort, HeapSort, and InsertionSort to deliver
' reliable O(n log n) performance in all cases. The parallel version
' further leverages multi-core systems for large datasets.
'
' When to use which algorithm:
' - IntroSort: Best general-purpose algorithm
' - QuickSort: Good average case but worst-case concerns
' - MergeSort: Stable sorting with guaranteed performance
' - HeapSort: Memory-constrained environments
' - InsertionSort: Very small arrays or nearly sorted data
' - ShellSort: Good compromise between simplicity and performance
' - Others: Primarily educational or specialized use cases
'
' Example usage:
'   Local data:=New Int[](5, 2, 9, 1, 5, 6)
'   IntroSort<Int>(data)
'   ' data is now [1, 2, 5, 5, 6, 9]

#Import "<stdlib>"
Using stdlib.collections
Using stdlib.syntax
Using stdlib.syntax.makevars

'---------- ADVANCED SORTS ----------
#Import "advanced/introsort"			'Best general-purpose algorithm
#Import "advanced/shellsort"			'Good compromise between simplicity and performance
#Import "advanced/timsort"				'Modern adaptive sort, stable and fast for real-world data
#Import "advanced/alphasort"			'Based on BurstSort, String-oriented, locale-aware, optimized for textual data
#Import "advanced/radixsort"			'In-place, non-stable, fixed-width numeric strings, zero heap

'---------- CLASSICAL SORTS ----------
#Import "classicals/heapsort"			'Memory-constrained environments
#Import "classicals/mergesort"			'Stable sorting with guaranteed performance, In-place stable sort, minimal memory overhead, advanced use
#Import "classicals/insertsort"			'Very small arrays or nearly sorted data
#Import "classicals/quicksort" 			'Good average case but worst-case concerns, Stack and List both use a in-place quicksort algorithm for sorting

'---------- EDUCATIONAL SORTS ----------
#Import "educationals/bogosort"			'Pedagogical, illustrates brute-force/randomness, never practical
#Import "educationals/bubblesort"		'Here for historical reason, easy to understand
#Import "educationals/stoogesort"		'Pedagogical, intentionally inefficient, recursion showcase

'---------- SPECIAL SORTS ----------
#Import "specials/tournamentsort"		'For sorting queries in, for example, multiplayer server's stacks
#Import "specials/blocksort"'			'Hybrid/novel sort, block-based strategies for cache efficiency
#Import "specials/countingsort"			'Non-comparison, linear time for integers, stable

'---------- O2SORTS (GaragePixel Originals) ----------
#Import "o2sorts/bricksort"				'Odd-even sort, parallel-friendly O(n²) algorithm
#Import "o2sorts/cubesort"				'Demonstration of higher-dimensional sorting, rarely practical
#Import "o2sorts/combsort"				'Improved bubble, gap-based, O(n²) but practical
#Import "o2sorts/cocktailshakersort"	'Bidirectional bubble sort, improved on basic bubble
#Import "o2sorts/gnomesort"				'A joke, simple concept, rarely practical

#Import "mapext"

#Import "compares"						'Collection of comparisons functions

Function Main()
End 
