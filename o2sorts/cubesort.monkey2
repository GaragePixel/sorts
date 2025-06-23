
Namespace sorts.o2

'---------------------------------------------------------- CubeSort

#rem monkeydoc CubeSort
@implementation: iDkP for GaragePixel
@since 2025-03-14 (Aida 4)
@inventor Steven Swerling, 2006

Parallel sorting algorithm with average case O(n log n)
This is a simplified sequential implementation
#end
Function CubeSort<T>:T[]( data:T[], inPlace:Bool=True )
	
	Local result:=Cpynd(data, Not inPlace)

	Local n:=result.Length
	Local blockSize:Int = 8  ' This should be tuned for performance
	Local done:Bool = False
	
	While Not done
		done = True
		
		' Process blocks
		For Local i:Int = 0 Until n Step blockSize
			Local atEnd:Int = Min(i + blockSize - 1, n - 1)
			
			' Sort each block
			InsertSort(result, Varptr(i), Varptr(atEnd))
		End
		
		' Merge adjacent blocks
		For Local i:Int = 0 Until n - 1
			If i Mod blockSize = blockSize - 1
				Continue
			End
			
			If i < n - 1 And result[i] > result[i + 1]
				Local temp:T = result[i]
				result[i] = result[i + 1]
				result[i + 1] = temp
				done = False
			End
		End
		
		blockSize *= 2
	Wend
	
	Return result
End