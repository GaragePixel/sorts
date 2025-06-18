
Namespace sorts

'---------------------------------------------------------- BrickSort

#rem monkeydoc Odd-Even Sort (Brick Sort)
@implementation iDkP for GaragePixel
@since 2025-03-14 (Aida 4)
@inventor K. E. Batcher, 1968

A variation of bubble sort where we perform alternate passes on odd/even indices
Stable sorting algorithm with O(n²) worst-case complexity
#end
Function OddEvenSort<T>(data:T[])
	
	Local sorted:Bool = False
	Local n:=data.Length
	
	While Not sorted
		sorted = True
		
		' Perform bubble sort on even indexed elements
		For Local i:Int = 0 Until n-1 Step 2
			If data[i] > data[i+1]
				Local temp:T = data[i]
				data[i] = data[i+1]
				data[i+1] = temp
				sorted = False
			End
		End
		
		' Perform bubble sort on odd indexed elements
		For Local i:Int = 1 Until n-1 Step 2
			If data[i] > data[i+1]
				Local temp:T = data[i]
				data[i] = data[i+1]
				data[i+1] = temp
				sorted = False
			End
		Next
	Wend
End
