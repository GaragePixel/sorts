
Namespace sorts.adv

'---------------------------------------------------------- ShellSort

#rem monkeydoc ShellSort
@implementation iDkP for GaragePixel
@since 2025-03-14 (Aida 4)
@inventor Donald Shell, 1959

Efficient extension of insertion sort that allows exchange of distant elements
Worst-case complexity depends on gap sequence, ranges from O(n²) to O(n log² n)
#end
Function ShellSort<T>:T[](data:T[])
	Return ShellSort(Varptr(data[0]))[0]
End

Function ShellSort<T>:T Ptr(data:T Ptr)
	
	Local n:=data[0].Length
	
	' Start with a big gap, then reduce the gap
	Local gap:Int = n/2
	
	While gap > 0
		' Do a gapped insertion sort
		For Local i:Int = gap Until n
			Local temp:T = data[i]
			Local j:Int
			
			' Shift elements until the correct location for data[i] is found
			For j = i Until gap Step -gap
				If data[j-gap] <= temp Exit
				data[j] = data[j-gap]
			Next
			
			' Put temp in its correct location
			data[j] = temp
		Next
		
		' Reduce the gap for the next pass
		gap = gap/2
	Wend
	Return data
End