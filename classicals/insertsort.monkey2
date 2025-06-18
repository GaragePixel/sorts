
Namespace sorts

'---------------------------------------------------------- InsertionSort

Function InsertionSort<T>(data:T[])

	' InsertionSort
	' Implementation: iDkP for GaragePixel
	' 2011-xx-xx (Aida 2)
	' Inventor: John Mauchly, 1946
	'
	' Builds the sorted array one item at a time
	' O(n²) worst and average case time complexity, but efficient for small datasets
	
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
End
