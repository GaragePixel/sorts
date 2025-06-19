
Namespace sorts

'---------------------------------------------------------- CombSort

#rem monkeydoc CombSort
@implementation iDkP for GaragePixel
@since 2025-06-18 (Aida 4)
@inventor Wlodzimierz Dobosiewicz, 1980

Improvement over bubble sort - eliminates turtles by comparing elements at a specific gap.
Gap shrinks by shrink factor (standard is 1.247). Finishes with bubble sort pass.
Complexity: O(n²) worst case, but generally faster than bubble sort for random data.
#end
Function CombSort<T>(data:T[])
	
	Local n:=data.Length
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
			If data[i] > data[i + gap]
				Local temp:T = data[i]
				data[i] = data[i + gap]
				data[i + gap] = temp
				sorted = False
			End
			i += 1
		Wend
	Wend
End