
Namespace stdlib.algorithms.sorts

'---------------------------------------------------------- CubeSort

Function CubeSort<T>(data:T[])
	
	' CubeSort
	' Implementation: iDkP for GaragePixel
	' 2025-03-14 (Aida 4)
	' Inventor: Steven Swerling, 2006
	'
	' Parallel sorting algorithm with average case O(n log n)
	' This is a simplified sequential implementation
	
	Local n:=data.Length
	Local blockSize:Int = 8  ' This should be tuned for performance
	Local done:Bool = False
	
	While Not done
		done = True
		
		' Process blocks
		For Local i:Int = 0 Until n Step blockSize
			Local atEnd:Int = Min(i + blockSize - 1, n - 1)
			
			' Sort each block
			InsertionSortRange(data, i, atEnd)
		End
		
		' Merge adjacent blocks
		For Local i:Int = 0 Until n - 1
			If i Mod blockSize = blockSize - 1
				Continue
			End
			
			If i < n - 1 And data[i] > data[i + 1]
				Local temp:T = data[i]
				data[i] = data[i + 1]
				data[i + 1] = temp
				done = False
			End
		End
		
		blockSize *= 2
	Wend
End