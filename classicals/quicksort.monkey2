
Namespace sorts

'---------------------------------------------------------- QuickSort

#rem monkeydoc QuickSort
@implementation iDkP for GaragePixel
@since 2011-xx-xx (Aida 2)
@inventor Tony Hoare, 1959

Efficient divide and conquer algorithm
Average case O(n log n), worst case O(n²)
#end
Function QuickSort<T>(data:T[], low:Int, high:Int)

	If low < high
		Local pi:Int = QuickPartition<T>(data, low, high)
		QuickSort<T>(data, low, pi - 1)
		QuickSort<T>(data, pi + 1, high)
	End
End

Function QuickPartition<T>:Int(data:T[], low:Int, high:Int)
	Local pivot:T = data[high]
	Local i:Int = low - 1
	For Local j:Int = low Until high
		If data[j] < pivot
			i = i + 1
			Local temp:T = data[i]
			data[i] = data[j]
			data[j] = temp
		End
	End
	Local temp:T = data[i + 1]
	data[i + 1] = data[high]
	data[high] = temp
	Return i + 1
End
