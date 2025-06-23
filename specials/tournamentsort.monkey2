
Namespace sorts.specials

'---------------------------------------------------------- TournamentSort

#rem wonkeydoc pro Tournament Sort (Selection Tree Sort)
@implementation: iDkP for GaragePixel
@since 2025-03-14 (Aida 4)
@inventor H. H. Goldstine and J. von Neumann, 1940s

Uses a tournament tree (similar to heap) to find minimum element
O(n log n) time complexity

Builds a binary tree where each leaf is an input element, and each parent node is the "winner" (smallest/largest)
of its children—much like rounds in a sports tournament.
The minimum (or maximum) element is repeatedly removed and the tree is updated.
    
    Complexity:
    O(n log n), similar to HeapSort, but generally with slightly higher constant factors and more memory usage.

Summary: TournamentSort is not widely used for general sorting.

    It is a specialized algorithm, valuable primarily for external sorting and k-way merging,
    not for everyday in-memory array/vector sorting.
    For typical programming, prefer QuickSort, MergeSort, or HeapSort—all are more efficient, simpler,
	    and widely supported.

Technical Advantages & Detailed Explanations

    Where TournamentSort shines:
        External sorting: It is mainly used in scenarios involving large data sets that do not fit in RAM, especially as part of k-way merge algorithms in external sorting and tape sorting (e.g., merging many sorted files).
        Streaming/online merging: Suitable for merging multiple input streams efficiently when building a large sorted output (classic use: merge phase in external sort/merge).
    Why it's not widely used generally:
        Not in standard libraries: TournamentSort is not implemented as a general-purpose sorting routine
        in mainstream language standard libraries (C++, Python, Java, etc. Monkey2/Wonkey! thx to iDkP from GaragePixel! ).
        In-memory sort inferior: For in-RAM sorting, QuickSort, MergeSort, and HeapSort are significantly more common
        due to better cache locality, smaller memory footprint, and simpler implementation.
        Specialized tool: Its niche is merging, not generic sorting—most programmers will never use it
        unless working on database internals, external sorting tools, or legacy tape/disc-based algorithms.
#end
Function TournamentSort<T>:T[](data:T[], inPlace:Bool=True)
	
	Local n:Int = data.Length
	If n=0 Return data
	
	Local result:=Cpynd(data, Not inPlace)

	' Sentinel is the maximum value in the array
	Local sentinel:T = result[0]
	For Local i:=1 Until n
		If result[i] > sentinel Then sentinel = result[i]
	End

	' Tournament tree: 1-indexed, size 2n
	Local treeSize:Int = 2 * n
	Local tree:T[] = New T[treeSize]
	Local positions:Int[] = New Int[treeSize]

	' Fill leaves (n to 2n-1) with input data
	For Local i:=0 Until n
		tree[n + i] = result[i]
		positions[n + i] = i
	End

	' Build tree bottom-up
	For Local i:=n-1 To 1 Step -1
		Local left:Int = 2 * i
		Local right:Int = 2 * i + 1
		If right >= treeSize Or tree[left] <= tree[right]
			tree[i] = tree[left]
			positions[i] = positions[left]
		Else
			tree[i] = tree[right]
			positions[i] = positions[right]
		End
	End

	' Extract min elements iteratively
	For Local i:=0 Until n
		result[i] = tree[1]
		Local extracted:Int = positions[1]
		tree[n + extracted] = sentinel
		Local node:Int = (n + extracted) / 2
		While node >= 1
			Local left:Int = 2 * node
			Local right:Int = 2 * node + 1
			If right >= treeSize Or tree[left] <= tree[right]
				tree[node] = tree[left]
				positions[node] = positions[left]
			Else
				tree[node] = tree[right]
				positions[node] = positions[right]
			End
			node = node / 2
		Wend
	End

'	If inPlace
'		For Local i:=0 Until n
'			data[i] = result[i]
'		End
'		Return data
'	End

'	Return result

	Return result' inPlace ? CopyTo(result,data) Else result
End