
Namespace sorts.o2

'---------------------------------------------------------- CombSort

#rem monkeydoc CombSort
@implementation iDkP for GaragePixel
@since 2025-06-18 (Aida 4)
@inventor Wlodzimierz Dobosiewicz, 1980

Improvement over bubble sort - eliminates turtles by comparing elements at a specific gap.
Gap shrinks by shrink factor (standard is 1.247). Finishes with bubble sort pass.
Complexity: O(n²) worst case, but generally faster than bubble sort for random data.
#end
Function CombSort<T>:T[]( data:T[], inPlace:Bool=True )
	
	Local result:=Cpynd(data, Not inPlace)
	
	Local n:=result.Length
	Local gap:Int = n
	Local shrinkFactor:Float = 1.3
	Local sorted:Bool = False
	
	While Not sorted
		' Update gap for next comb
		gap = Int(gap / shrinkFactor)
		If gap <= 1
			gap = 1
			sorted = True
		End
		
		' Compare elements with current gap
		Local i:Int = 0
		While i + gap < n
			If result[i] > result[i + gap]
				Local temp:T = result[i]
				result[i] = result[i + gap]
				result[i + gap] = temp
				sorted = False
			End
			i += 1
		Wend
	Wend

	Return result
End