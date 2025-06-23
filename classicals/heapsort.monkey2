
Namespace sorts

'---------------------------------------------------------- HeapSort

#rem monkeydoc HeapSort
@implementation: iDkP for GaragePixel
@since 2011-xx-xx (Aida 2)
@inventor J. W. J. Williams, 1964

In-place comparison-based sorting algorithm
O(n log n) time complexity with O(1) space
#end
Function HeapSort<T>:T[](data:T[], onPlace:Bool=True)
	
	Local result:=Cpynd(data, Not onPlace)

	Local n:=result.Length
	
	' Build heap (rearrange array)
	For Local i:Int = n/2 - 1 Until 0 Step -1
		_Heapify(result, Varptr(n), Varptr(i))
	End
	
	' Extract elements from heap one by one
	For Local i:Int = n-1 Until 0 Step -1
		' Move current root to end
		Local temp:T = result[0]
		result[0] = result[i]
		result[i] = temp
		
		' Call heapify on reduced heap
		Local _int:Int=0
		_Heapify(result, Varptr(i), Varptr(_int))
	End
	
	Return result
End

Private

Function _Heapify<T>(data:T[], n:Int Ptr, i:Int Ptr)
	' To heapify a subtree rooted at node i
	Local largest:Int = i[0]  		' Initialize largest as root
	Local left:Int = 2*i[0] + 1 	' Left child
	Local right:Int = 2*i[0] + 2 	' Right child
	
	' If left child is larger than root
	If left < n[0] And data[left] > data[largest]
		largest = left
	End
	
	' If right child is larger than largest so far
	If right < n[0] And data[right] > data[largest]
		largest = right
	End
	
	' If largest is not root
	If largest <> i[0]
		Local temp:T = data[i[0]]
		data[i[0]] = data[largest]
		data[largest] = temp
		
		' Recursively heapify the affected subtree
		_Heapify(data, n, Varptr(largest))
	End
End