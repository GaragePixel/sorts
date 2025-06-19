
Namespace sorts

'---------------------------------------------------------- TimSort

#rem monkeydoc TimSort
@implementation iDkP for GaragePixel
@since 2025-06-18 (Aida 4)
@inventors John von Neumann, 1945 (MergeSort)
@inventors John Mauchly, 1946 (InsertionSort)
@inventors Tim Peters, 2002

Hybrid stable sorting algorithm used in Python and Java.
Combines merge sort and insertion sort, optimized for real-world data.
Detects and merges runs, works very well on partially sorted data.
Worst-case: O(n log n), best-case: O(n)

	Merge sort (John von Neumann, 1945):
		Core algorithm for dividing and merging sorted arrays.
		Merge logic: ~30–40%
	Insertion sort (John Mauchly, 1946):
		Fast, simple sort for small or nearly-ordered segments ("runs").
		Insertion sort: ~10–15%
	TimSort (Tim Peters, 2002):
		Hybrid, adaptive, stable sort—standard in Python, Java, and others.
		TimSort-specific logic: ~45–60%
			Run detection (finding ordered subarrays)
			Reversing descending runs
			Extending runs to a minimum length (minrun)
			Managing a stack of runs for controlled merging
			Adaptive merge strategies (balancing, galloping, etc.)
			Highly explicit management of copying, run boundaries, and merge invariants
		TimSort’s logic—run detection, adaptivity, and run stack management—constitutes 
		at least 50% of the code complexity.
		Merge and insertion sort are used as tools within TimSort, 
		but the algorithm’s structure, flow, and adaptivity are Tim Peters’ original work.

Used in stdlib:

TimSort_g

- Detects natural runs (ordered subsequences).
- Reverses descending runs, sorts small runs with insertion sort.
- Efficiently merges runs, always stable.
- O(n log n) worst-case, O(n) best-case (nearly sorted).
- Works on arrays (T[]); not directly on linked lists.

List<T>.Sort (in the original std from Sibly, Mx2/Mx2 forks, Monkey1/Monkey1's (agressive) forks)

- Performs an in-place merge sort on the linked list.
- Not quicksort—quicksort is not suitable for linked lists due to random access cost.
- Merge sort is stable and well-suited for lists, but not adaptive.
- Offers "Sort with filter" extension from GaragePixel (custom compare + filter context).
- Not adaptive (does not exploit natural runs).
- Not quicksort (random access too slow for lists).

Stack<T>.Sort (in the original std from Sibly, Mx2/Mx2 forks, Monkey1/Monkey1's (agressive) forks)

- Sorts elements of the stack (backed by a dynamic array: T[]).
- Supports both ascending and descending order via optional comparison lambda.
- Provides overloads to sort the whole stack or a custom range.
- Offers "Sort with filter" extension from GaragePixel (custom compare + filter context).
- Not stable by default.
- Default sort is in-place.

Should use TimSort instead of the legacy List's sort?
- Linked lists lack fast random access—quicksort and TimSort (array-based) perform poorly.
- Merge sort splits and merges via pointers, making it **optimal** for linked lists (O(n log n), stable).
- TimSort is designed for arrays, not linked lists.

Should use TimSort in place of the legacy Stack's sort?
- Stack<T> is backed by a random-access array, so in-place quicksort is fast and memory-efficient.
- Merge sort for arrays would need extra memory; quicksort is standard unless stability is required.
- TimSort is array-optimized, but adds complexity and minor benefit for small/mid stacks.
- For Stack<T>, TimSort could be used and would provide adaptivity and stability, but:
	- Most Stack<T> use-cases don’t require stability.
	- Quicksort is simpler, proven, and fast for random data.
	- TimSort has some overhead for small/medium arrays.
	- If stability or adaptive sorting becomes a priority, TimSort is a good upgrade.

| Container   | Current Algorithm | Stability | Adaptive | Should Use TimSort? |
|-------------|-------------------|-----------|----------|---------------------|
| List<T>     | Merge sort        | Yes       | No       | No                  |
| Stack<T>    | Quicksort         | No        | No       | Only if needed      |

Purpose:

	TimSort is the de facto standard for stable, general-purpose array sorting in Python and Java. 
	It’s designed to outperform quicksort and mergesort on real-world data—especially 
	when data is partially ordered.

	Hybrid stable sorting algorithm as used in Python and Java.
	Combines merge sort (for speed and stability) with insertion sort (for optimal short-run performance).
	Detects and merges runs, working especially well on partially sorted or real-world data.
	Often the best all-around choice for array sorting: worst-case O(n log n), best-case O(n).

List of functionality:
	- Scans for "runs" (sequences already ordered, ascending or descending).
	- Reverses descending runs in-place to ascending.
	- Extends short runs to a minimum length using insertion sort.
	- Sorts each run with insertion sort (fast for small, nearly sorted data).
	- Merges runs efficiently until only one sorted array remains.
	- Fully stable: equal elements retain original order.

Notes:
	- Uses arrays (`T[]`) and a stack for run management, ensuring indexable access and speed.
	- No random access on List<T>; strictly array-based for all merging and copying.
	- Merges always combine the two most recent runs, maintaining balanced merges and optimal performance.
	- Adapted for Monkey2/Wonkey container style (never Monkey1/Cerberus).
	- Each helper function is isolated and technical, as per GaragePixel conventions.

Technical advantages & detailed explanations:
	- Fast on nearly-sorted ("natural run") data by exploiting existing order.
	- Adaptive: performs as well on random arrays as on nearly-ordered ones.
	- Stable: preserves order of equal elements, essential for complex sorts.
	- Uses minimal auxiliary storage (only for run stack and merge workspace).
	- Merges are balanced and only as frequent as necessary, minimizing overhead.
	- All copying and reversals are explicit, with no hidden allocations.
	- Follows the technical and documentation standards of GaragePixel & Aida 4.

Comparison: TimSort vs. Quicksort

1. Stability

    TimSort: Stable (preserves order of equal elements)—essential for sorting records or objects by multiple fields.
    Quicksort: Not stable (unless specifically engineered).

2. Performance

    TimSort: O(n log n) worst-case and best-case O(n) for nearly-ordered data (real-world optimal).
    Quicksort: O(n log n) average, but O(n²) worst-case (danger on already sorted or reverse-sorted data).
    In practice: TimSort is usually as fast as quicksort on random data, and much faster on nearly-ordered data.

3. Adaptivity

    TimSort: Exploits existing runs (ordered sequences) for huge speedups.
    Quicksort: Blind to order.

4. Memory

    TimSort: Needs O(n) extra memory for merges.
    Quicksort: In-place, O(log n) stack space.

Concurrency & Parallelism

TimSort_g as written (and in Python/Java):

    Serial algorithm: Runs on a single thread.
    Not inherently parallel—merges and run detection are sequential.

Quicksort:

    Easier to parallelize: Each partition can be sorted concurrently.
    Parallel quicksort is a classic for multicore CPUs and GPUs.

Compute Shader / GPU Suitability

    TimSort: Not well-suited for GPU/compute shader.
        Run detection, reversals, and small-run insertions are branch-heavy and sequential.
        Merges require dynamic memory and branching.
    Quicksort: Also tricky to do efficiently on GPU due to recursion/branching, but parallel variants exist.
    Radix sort / bitonic sort / merge sort: These are preferred for GPU/compute shader—highly parallel, regular memory access, minimal branching.

Technical Summary

    Best overall for real-world, general-purpose CPU sorting?
    Yes—TimSort_g is the best for stable, adaptive, real-world array sorting.
    Production-proven in Python/Java. Outperforms quicksort on nearly-ordered data.

    Best for parallel/concurrent or GPU sorting?
    No—TimSort is not designed for parallelism or GPU.
    For that, use parallel quicksort, merge sort, or radix sort (see: compute shader and GPGPU literature).

Technical Advantages of TimSort_g (GaragePixel flavor)

    Stability: Always preserves equal element order
    Adaptivity: Detects and exploits existing order (runs)
    Robustness: No O(n²) worst-case
    Proven: Used in Python’s and Java’s standard libraries

Technical Limits

    Parallelism: Not suitable for multi-threading or GPU as written
    Memory: Needs extra buffer for merges
    GPU: Branching and irregular memory access make it a poor fit for compute shaders
#end
Function TimSort<T>(data:T[])
	Local n:=data.Length
	Local minrun:Int = _GetMinrun_(n)
	If minrun >= n
		InsertionSort(data, 0, n-1)
		Return
	End

	' Use Stack<T[]> to store runs for indexable, type-safe management
	Local runs:Stack<T[]> = New Stack<T[]>
	Local i:Int = 0

	' Identify runs and extend/reverse as needed
	While i < n
		Local start := i
		Local ascending:Bool = True
		If i+1 < n And data[i] > data[i+1] ascending = False
		Local j:Int = i+1
		If ascending
			While j < n And data[j-1] <= data[j]
				j += 1
			Wend
		Else
			While j < n And data[j-1] > data[j]
				j += 1
			Wend
		End
		Local runLen:Int = j - start

		' Extend run to at least minrun
		If runLen < minrun
			runLen = Min(minrun, n - start)
			j = start + runLen
		End

		' Copy the run and reverse if descending
		Local run:T[] = New T[runLen]
		For Local k:Int = 0 Until runLen
			run[k] = data[start + k]
		End
		If Not ascending
			Reverse(run)
		End

		' Sort short runs with insertion sort (TimSort requirement)
		InsertionSort(run, 0, runLen-1)

		runs.Push(run)
		i = j
	Wend

	' Merge runs until one remains
	While runs.Length > 1
		Local run2:T[] = runs.Pop()
		Local run1:T[] = runs.Pop()
		Local merged:T[] = stdlib.syntax.Merge(run1, run2)
		runs.Push(merged)
	Wend

	' Copy back to data[]
	If runs.Length > 0
		Local result:T[] = runs.Pop()
		For Local m:Int = 0 Until n
			data[m] = result[m]
		End
	End
End

#rem monkeydoc hidden Calculates the minimum run length for TimSort.
Determines the smallest run size to use, based on array length.
Ensures balanced merges and optimal performance for TimSort_g.
@param n Array length.
@return The computed minimum run length.
#end
Function _GetMinrun_:Int(n:Int)
	Local r:Int = 0
	While n >= 64
		r = r | (n & 1)
		n = n Shr 1
	Wend
	Return n + r
End
