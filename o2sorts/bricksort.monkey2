
Namespace sorts.o2

'---------------------------------------------------------- BrickSort

#rem monkeydoc Odd-Even Sort (Brick Sort)
@implementation iDkP for GaragePixel
@since 2025-03-14 (Aida 4)
@inventor K. E. Batcher, 1968

A variation of bubble sort where we perform alternate passes on odd/even indices
Stable sorting algorithm with O(n²) worst-case complexity
#end
Function BrickSort<T>:T[](data:T[],onPlace:Bool=True)
	Return OddEvenSort(data,onPlace)
End

Function OddEvenSort<T>:T[](data:T[],onPlace:Bool=True)
	
	Local result:=Cpynd(data, Not onPlace)
	
	Local sorted:Bool = False
	Local n:=result.Length
	
	While Not sorted
		sorted = True
		
		' Perform bubble sort on even indexed elements
		For Local i:Int = 0 Until n-1 Step 2
			If result[i] > result[i+1]
				Local temp:T = result[i]
				result[i] = result[i+1]
				result[i+1] = temp
				sorted = False
			End
		End
		
		' Perform bubble sort on odd indexed elements
		For Local i:Int = 1 Until n-1 Step 2
			If result[i] > result[i+1]
				Local temp:T = result[i]
				result[i] = result[i+1]
				result[i+1] = temp
				sorted = False
			End
		Next
	Wend

	Return result
End