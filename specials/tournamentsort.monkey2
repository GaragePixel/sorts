
Namespace sorts

'---------------------------------------------------------- TournamentSort

#rem wonkeydoc pro TournamentSort (Selection Tree Sort) builds a binary tree where each leaf is an input element, 
and each parent node is the "winner" (smallest/largest) of its children—much like rounds in a sports tournament. 
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
Function TournamentSort<T>(data:T[])

	' Tournament Sort
	' Implementation: iDkP for GaragePixel
	' 2025-03-14 (Aida 4)
	' Inventor: H. H. Goldstine and J. von Neumann, 1940s
	'
	' Uses a tournament tree (similar to heap) to find minimum element
	' O(n log n) time complexity
	
	Local n:=data.Length
	Local result:T[] = New T[n]
	
	' Create the sentinel (OPTIMIZE!)
	Local sentinel:T
	For Local n:=0 Until data.Length-1
		If data[n]>sentinel sentinel=data[0]
	End 
	
	' Create a tournament tree (array-based)
	Local treeSize:Int = 2 * n
	Local tree:T[] = New T[treeSize]
	Local positions:Int[] = New Int[treeSize]
	
	' Fill leaves with data values
	For Local i:Int = 0 Until n
		tree[n + i] = data[i]
		positions[n + i] = i
	End
	
	' Build the initial tournament tree
	For Local i:Int = n-1 Until 1 Step - 1
		Local leftChild:Int = 2 * i
		Local rightChild:Int = 2 * i + 1
		
		If tree[leftChild] <= tree[rightChild] Or rightChild >= treeSize
			tree[i] = tree[leftChild]
			positions[i] = positions[leftChild]
		Else
			tree[i] = tree[rightChild]
			positions[i] = positions[rightChild]
		End
	Next
	
	' Extract elements one by one
	For Local i:Int = 0 Until n
		' Get winner and its position
		result[i] = tree[1]
		Local pos:Int = positions[1]
		
		' Replace with a sentinel value (very large)
		tree[n + pos] = sentinel
		
		' Rebuild tournament path
		Local node:Int = (n + pos) / 2
		While node >= 1
			Local leftChild:Int = 2 * node
			Local rightChild:Int = 2 * node + 1
			
			If tree[leftChild] <= tree[rightChild] Or rightChild >= treeSize
				tree[node] = tree[leftChild]
				positions[node] = positions[leftChild]
			Else
				tree[node] = tree[rightChild]
				positions[node] = positions[rightChild]
			End
			
			node = node / 2
		Wend
	Next
	
	' Copy sorted result back to original array
	For Local i:Int = 0 Until n
		data[i] = result[i]
	Next
End
