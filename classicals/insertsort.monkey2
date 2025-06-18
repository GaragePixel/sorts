
Namespace sorts

'---------------------------------------------------------- HeapSort
#rem monkeydoc HeapSort
@Implementation: iDkP for GaragePixel
@since 2011-xx-xx (Aida 2)
@Inventor J. W. J. Williams, 1964

In-place comparison-based sorting algorithm
O(n log n) time complexity with O(1) space
#end
Function HeapSort<T>(data:T[])

	Local n:=data.Length
	
	' Build heap (rearrange array)
	For Local i:Int = n/2 - 1 Until 0 Step -1
		Heapify(data, n, i)
	End
	
	' Extract elements from heap one by one
	For Local i:Int = n-1 Until 0 Step -1
		' Move current root to end
		Local temp:T = data[0]
		data[0] = data[i]
		data[i] = temp
		
		' Call heapify on reduced heap
		Heapify(data, i, 0)
	End
End

Private

Function Heapify<T>(data:T[], n:Int, i:Int)
	' To heapify a subtree rooted at node i
	Local largest:Int = i     ' Initialize largest as root
	Local left:Int = 2*i + 1  ' Left child
	Local right:Int = 2*i + 2 ' Right child
	
	' If left child is larger than root
	If left < n And data[left] > data[largest]
		largest = left
	End
	
	' If right child is larger than largest so far
	If right < n And data[right] > data[largest]
		largest = right
	End
	
	' If largest is not root
	If largest <> i
		Local temp:T = data[i]
		data[i] = data[largest]
		data[largest] = temp
		
		' Recursively heapify the affected subtree
		Heapify(data, n, largest)
	End
End
