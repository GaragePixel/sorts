
Namespace sorts.adv

'---------------------------------------------------------- ShellSort

#rem monkeydoc ShellSort
@implementation iDkP for GaragePixel
@since 2025-03-14 (Aida 4)
@inventor Donald Shell, 1959

Efficient extension of insertion sort that allows exchange of distant elements
Worst-case complexity depends on gap sequence, ranges from O(n²) to O(n log² n)
#end
Function ShellSort<T>:T[]( data:T[],onPlace:Bool=True )
	
	Local result:=Cpynd(data, Not onPlace)
	
	Local n:=result.Length
	
	' Start with a big gap, then reduce the gap
	Local gap:Int = n/2
	
	While gap > 0
		' Do a gapped insertion sort
		For Local i:Int = gap Until n
			Local temp:T = result[i]
			Local j:Int = i
			
			' Shift elements until the correct location for data[i] is found
			While j >= gap And result[j-gap] > temp
				result[j] = result[j-gap]
				j -= gap
			Wend
			
			' Put temp in its correct location
			result[j] = temp
		Next
		
		' Reduce the gap for the next pass
		gap = gap/2
	Wend
	
	Return result
End