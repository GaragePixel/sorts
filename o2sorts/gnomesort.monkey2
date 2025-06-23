
Namespace sorts.o2

'---------------------------------------------------------- GnomeSort

#rem monkeydoc StupidSort
@implementation iDkP for GaragePixel
@since 2025-03-14 (Aida 4)
@inventor Hamid Sarbazi-Azad, 2000
#see GnomeSort
#end 
Function StupidSort<T>:T[](data:T[], onPlace:Bool=true)
	Return GnomeSort(data,onPlace)
End 

#rem monkeydoc GnomeSort
@implementation iDkP for GaragePixel
@since 2025-03-14 (Aida 4)
@inventor Hamid Sarbazi-Azad, 2000

Also known as "Stupid Sort" - simple but inefficient sorting algorithm
Similar to insertion sort but moves elements with swaps like bubble sort

Gnome sort (nicknamed stupid sort) is a variation of the insertion sort sorting algorithm 
that does not use nested loops. Gnome sort was originally proposed by Iranian computer scientist 
Hamid Sarbazi-Azad (professor of Computer Science and Engineering at Sharif University of Technology) in 2000. 
The sort was first called stupid sort (not to be confused with bogosort), 
and then later described by Dick Grune and named gnome sort.
#end
Function GnomeSort<T>:T[]( data:T[], onPlace:Bool=True )
	
	Local result:=Cpynd(data, Not onPlace)
	
	Local pos:Int = 0
	Local n:=result.Length
	
	While pos < n
		If pos = 0 Or result[pos] >= result[pos-1]
			' Move forward if we're at start or current element is in correct position
			pos += 1
		Else
			' Swap and move backwards if current element is out of place
			Local temp:T = result[pos]
			result[pos] = result[pos-1]
			result[pos-1] = temp
			pos -= 1
		End
	Wend
	
	Return result
End