
Namespace stdlib.algorithms.sorts

'---------------------------------------------------------- BubbleSort

Function BubbleSort<T>(data:T[])
	
	' BubbleSort
	' Implementation: iDkP for GaragePixel
	' 2011-xx-xx (Aida 2)
	' Inventor: Unknown, documented as early as 1956
	'
	' Simple comparison-based sorting algorithm
	' O(n²) worst and average case time complexity
	
    Local n:=data.Length
    For Local i:Int = 0 Until n
        For Local j:Int = 0 Until n - i - 1
            If data[j] > data[j + 1]
                Local temp:= data[j]
                data[j] = data[j + 1]
                data[j + 1] = temp
            End
        End
    End
End