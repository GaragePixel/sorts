
Namespace sorts.edu

'---------------------------------------------------------- StoogeSort

#rem monkeydoc StoogeSort
@implementation iDkP for GaragePixel
@since 2025-06-18 (Aida 4)
@inventor Howard B. Demuth, 1977

A highly inefficient, recursive sorting algorithm. For demonstration only.
Recursively sorts initial 2/3, final 2/3, then initial 2/3 again.
Complexity: O(n^(log 3 / log 1.5)) ≈ O(n^2.709), much worse than bubble sort!

Stooge sort is a recursive sorting algorithm that divides the array into overlapping
thirds and recursively sorts them. Despite its poor time complexity, it serves as
an interesting example of unconventional divide-and-conquer algorithms.
The algorithm is primarily of academic interest due to its unique approach.
#end
Function StoogeSort<T>:T[](data:T[])
	
	Return StoogeSort(Varptr(data[0]), 0, data.Length - 1)
End

Function StoogeSort<T>:T[](data:T Ptr, start:Int, atEnd:Int)
	
	' Swap first and last elements if they are out of order
	If data[start] > data[atEnd]
		Local temp:T = data[start]
		data[start] = data[atEnd]
		data[atEnd] = temp
	End
	
	' If there are more than 2 elements, sort recursively
	If atEnd - start > 1
		Local third:Int = (atEnd - start + 1) / 3
		
		' Sort first 2/3 of the array
		StoogeSort(data, start, atEnd - third)
		
		' Sort last 2/3 of the array
		StoogeSort(data, start + third, atEnd)
		
		' Sort first 2/3 again to ensure correctness
		StoogeSort(data, start, atEnd - third)
	End

	Return data[0]
End
