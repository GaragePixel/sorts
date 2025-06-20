
Namespace sorts

'---------------------------------------------------------- InPlaceMergeSort

#rem monkeydoc In-Place or Recurcive Merge Sort
@implementation: iDkP for GaragePixel
@since 2011-xx-xx (Aida 2)
@inventor John von Neumann, 1945

Divide and conquer algorithm with O(n log n) time complexity
Stable sorting algorithm that works well for linked lists

Recurcive version:
@inventor Based on Merge Sort, in-place variant

Merge sort implementation that doesn't require extra array allocation
O(n log n) time complexity, but with O(1) extra space
#end
Function MergeSort<T>:T[]( data:T[] )	
	
	Local datalens1:=data[0].Length - 1
	Return MergeSortRecursive(Varptr(data[0]), MakeInt(), Varptr(dataLens1))[0]
End

Function MergeSort<T>:T Ptr( data:T Ptr )

	Local datalens1:=data[0].Length - 1
	Return MergeSortRecursive(data, MakeInt(), Varptr(dataLens1))
End

Function MergeSortRecursive<T>:T Ptr( data:T Ptr, start:Int Ptr, atEnd:Int Ptr )
	If start[0] < atEnd[0]
		Local mid:Int = (start[0] + atEnd[0]) / 2
		
		' Sort first and second halves
		Local mida1:=mid+1
		MergeSortRecursive(data, start, Varptr(mid))
		MergeSortRecursive(data, varptr(mida1), Varptr(atEnd))
		
		' Merge the sorted halves
		MergeSort(data, start, mid, atEnd)
	End
End

Function MergeSort<T>( data:T Ptr, start:Int Ptr, mid:Int Ptr, atEnd:Int Ptr )
	' If arrays are already sorted
	If data[mid] <= data[mid[0] + 1] Return
	
	Local i:Int = start[0]
	Local j:Int = mid[0] + 1
	
	' Until we reach end of either array
	While i <= mid[0] And j <= atEnd[0]
		' If element of first array is in right position
		If data[i] <= data[j]
			i += 1
		Else
			Local value:T = data[j]
			Local index:Int = j
			
			' Shift all elements between i and j right by 1
			While index <> i
				data[index] = data[index - 1]
				index -= 1
			Wend
			
			data[i] = value
			
			' Increment all indexes
			i += 1
			mid[0] += 1
			j += 1
		End
	Wend
End