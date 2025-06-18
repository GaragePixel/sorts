
Namespace sorts

'---------------------------------------------------------- BrickSort

Function OddEvenSort<T>(data:T[])
	
	' Odd-Even Sort (Brick Sort)
	' Implementation: iDkP for GaragePixel
	' 2025-03-14 (Aida 4)
	' Inventor: K. E. Batcher, 1968
	'
	' A variation of bubble sort where we perform alternate passes on odd/even indices
	' Stable sorting algorithm with O(n²) worst-case complexity
	
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
