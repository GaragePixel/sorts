
Namespace sorts

Using stdlib.types

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

Function MergeSort<T>:T[]( data:T[], onPlace:Bool=True )

	Local datalens1:=data.Length - 1
	Local _int:Int=0
	Return MergeSortRecursive(data, Varptr(_int), Varptr(datalens1), onPlace)
End

Function MergeSortRecursive<T>:T[]( data:T[], start:Int Ptr, atEnd:Int Ptr, onPlace:Bool=True )
	
	Local result:=Cpynd(data, Not onPlace)
	
	If start[0] < atEnd[0]
		Local mid:Int = (start[0] + atEnd[0]) / 2
		
		' Sort first and second halves
		Local mida1:=mid+1
		MergeSortRecursive(result, start, Varptr(mid))
		MergeSortRecursive(result, Varptr(mida1), atEnd)
		
		' Merge the sorted halves
		MergeSort(result, start, Varptr(mid), atEnd)
	End

	Return result
End

Function MergeSort<T>:T[]( data:T[], start:Int Ptr, mid:Int Ptr, atEnd:Int Ptr, onPlace:Bool=True )
	
	Local result:=Cpynd(data, Not onPlace)
	
	' If arrays are already sorted
	If result[mid[0]] <= result[mid[0] + 1] Return Null
	
	Local i:Int = start[0]
	Local j:Int = mid[0] + 1
	
	' Until we reach end of either array
	While i <= mid[0] And j <= atEnd[0]
		' If element of first array is in right position
		If result[i] <= result[j]
			i += 1
		Else
			Local value:T = result[j]
			Local index:Int = j
			
			' Shift all elements between i and j right by 1
			While index <> i
				result[index] = result[index - 1]
				index -= 1
			Wend
			
			result[i] = value
			
			' Increment all indexes
			i += 1
			mid[0] += 1
			j += 1
		End
	Wend
	
	Return result
End