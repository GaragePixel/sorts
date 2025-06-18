
Namespace stdlib.algorithms.sorts

'---------------------------------------------------------- MergeSort

Function MergeSort<T>(data:T[])
	
	' MergeSort
	' Implementation: iDkP for GaragePixel
	' 2025-03-14 (Aida 4)
	' Inventor: John von Neumann, 1945
	'
	' Divide and conquer algorithm with O(n log n) time complexity
	' Stable sorting algorithm that works well for linked lists
	
	If data.Length <= 1 Then Return
	
	Local temp:T[] = New T[data.Length]
	MergeSortRecursive(data, temp, 0, data.Length - 1)
End

Function MergeSortRecursive<T>(data:T[], temp:T[], left:Int, right:Int)
	If left < right
		Local mid:Int = (left + right) / 2
		
		' Sort first and second halves
		MergeSortRecursive(data, temp, left, mid)
		MergeSortRecursive(data, temp, mid + 1, right)
		
		' Merge the sorted halves
		Merge(data, temp, left, mid, right)
	End
End

Function Merge<T>(data:T[], temp:T[], left:Int, mid:Int, right:Int)
	' Copy data to temp arrays
	For Local i:Int = left To right
		temp[i] = data[i]
	End
	
	Local i:Int = left       ' Initial index of first subarray
	Local j:Int = mid + 1    ' Initial index of second subarray
	Local k:Int = left       ' Initial index of merged subarray
	
	' Merge the temp arrays back into data
	While i <= mid And j <= right
		If temp[i] <= temp[j]
			data[k] = temp[i]
			i += 1
		Else
			data[k] = temp[j]
			j += 1
		End
		k += 1
	Wend
	
	' Copy remaining elements of left temp array if any
	While i <= mid
		data[k] = temp[i]
		i += 1
		k += 1
	Wend
	
	' Copy remaining elements of right temp array if any
	While j <= right
		data[k] = temp[j]
		j += 1
		k += 1
	Wend
End

