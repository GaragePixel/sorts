
Namespace sorts

'---------------------------------------------------------- InsertionSort

#rem monkeydoc InsertionSort
@implementation iDkP for GaragePixel
@since 2011-xx-xx (Aida 2)
@inventor John Mauchly, 1946

Builds the sorted array one item at a time
O(n²) worst and average case time complexity, but efficient for small datasets
#end
Function InsertSort<T>:T[](data:T[])
	Return InsertSort(Varptr(data[0]))[0]
End

Function InsertSort<T>:T Ptr(data:T Ptr)
	
	Local n:=data.Length
	For Local i:Int = 1 Until n
		Local key:=data[i]
		Local j:Int = i - 1
		While j >= 0 And data[j] > key
			data[j + 1] = data[j]
			j = j - 1
		Wend
		data[j + 1] = key
	End
	Return data
End

#rem monkeydoc Performs in-place insertion sort on a subrange of an array.
@implementation iDkP for GaragePixel
@inventors John Mauchly, 1946
@inventors Tim Peters, 2002
@since 2025-06-19 (Aida 4)

Purpose:
	Sorts a specified range `[start..last]` within an array using insertion sort.
	Efficient for small or nearly sorted segments (as in TimSort_g and similar adaptive algorithms).

List of functionality:
	- Iterates from `start+1` to `last`.
	- For each element, shifts larger elements rightward to make space for the current value.
	- Places the current value (`key`) in its correct sorted position within the subrange.
	- Modifies the original array in place, leaving other segments untouched.

Notes:
	- Designed for partial array sorting—does not affect elements outside `[start..last]`.
	- Used for sorting short "runs" detected in TimSort_g, optimizing cache locality and speed on small ranges.
	- Stable: preserves relative order of equal elements.
	- Not suitable for large ranges due to O(n^2) cost, but ideal for small, nearly sorted segments.

Technical advantages & detailed explanations:
	- Insertion sort is adaptive: runs in O(n) if data is already nearly sorted.
	- Minimal overhead, no extra memory allocation.
	- Fully compatible with generic array segments in Monkey2/Wonkey.

@param data Array containing the range to sort.
@param start Index of the first element in the range.
@param atEnd Index of the last element in the range (inclusive).
#end
Function InsertSort<T>:T[](data:T[], start:Int, last:Int)
	Return InsertSort(data,start,last)[0]
End

Function InsertSort<T>:T Ptr(data:T Ptr, start:Int, last:Int)
	Return InsertSort(data,Varptr(start),Varptr(last))
End

Function InsertSort<T>:T Ptr(data:T Ptr, start:Int Ptr, last:Int Ptr)

	For Local i:Int = start[0] + 1 To last[0]
		Local key:T = data[i]
		Local j:Int = i - 1
		While j >= start[0] And data[j] > key
			data[j + 1] = data[j]
			j -= 1
		Wend
		data[j + 1] = key
	End
	Return data
End