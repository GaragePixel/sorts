
Namespace sorts.o2

'---------------------------------------------------------- CocktailShakerSort

#rem monkeydoc Cocktail Shaker Sort (Bidirectional Bubble Sort)
@implementation iDkP for GaragePixel
@since 2025-06-18 (Aida 4)
@inventor unknow

A variation of bubble sort that sorts in both directions on each pass.
Performs forward and backward sweeps to bubble the largest and smallest elements.
Complexity: O(n²) worst case, stable, simple but rarely used in practice.
#end
Function CocktailSort<T>:T[]( data:T[], onPlace:Bool=True )
	
	Local result:=Cpynd(data, Not onPlace)
	
	Local n:=result.Length
	Local start:Int = 0
	Local atEnd:Int = n - 1
	Local swapped:Bool = True
	
	While swapped And start < atEnd
		swapped = False
		
		' Forward pass - bubble largest element to the right
		For Local i:Int = start Until atEnd
			If result[i] > result[i + 1]
				Local temp:T = result[i]
				result[i] = result[i + 1]
				result[i + 1] = temp
				swapped = True
			End
		Next
		
		' Decrease end boundary as largest element is now in place
		atEnd -= 1
		
		' If no swapping occurred, array is sorted
		If Not swapped Exit
		
		' Backward pass - bubble smallest element to the left
		For Local i:Int = atEnd Until start Step -1
			If result[i] < result[i - 1]
				Local temp:T = result[i]
				result[i] = result[i - 1]
				result[i - 1] = temp
				swapped = True
			End
		Next
		
		' Increase start boundary as smallest element is now in place
		start += 1
	Wend

	Return result
End