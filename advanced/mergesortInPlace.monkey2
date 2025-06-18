
Namespace sorts

'---------------------------------------------------------- InPlaceMergeSort

#rem monkeydoc In-Place Merge Sort
@implementation: iDkP for GaragePixel
@since 2011-xx-xx (Aida 2)
@inventor Based on Merge Sort, in-place variant

Merge sort implementation that doesn't require extra array allocation
O(n log n) time complexity, but with O(1) extra space
#end
Function InPlaceMergeSort<T>(data:T[])

	InPlaceMergeSortRecursive(data, 0, data.Length - 1)
End

Function InPlaceMergeSortRecursive<T>(data:T[], start:Int, atEnd:Int)
	If start < atEnd
		Local mid:Int = (start + atEnd) / 2
		
		' Sort first and second halves
		InPlaceMergeSortRecursive(data, start, mid)
		InPlaceMergeSortRecursive(data, mid + 1, atEnd)
		
		' Merge the sorted halves
		InPlaceMerge(data, start, mid, atEnd)
	End
End

Function InPlaceMerge<T>(data:T[], start:Int, mid:Int, atEnd:Int)
	' If arrays are already sorted
	If data[mid] <= data[mid + 1] Return
	
	Local i:Int = start
	Local j:Int = mid + 1
	
	' Until we reach end of either array
	While i <= mid And j <= atEnd
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
			mid += 1
			j += 1
		End
	Wend
End
