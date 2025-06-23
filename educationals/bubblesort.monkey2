
Namespace sorts.edu

'---------------------------------------------------------- BubbleSort

#rem monkeydoc BubbleSort
@implementation iDkP for GaragePixel
@since 2011-xx-xx (Aida 2)
@inventor Unknown (probaly a MIT's unnamed "computer woman"), documented as early as 1956

Simple comparison-based sorting algorithm
O(n²) worst and average case time complexity
#end
Function BubbleSort<T>:T[]( data:T[], onPlace:Bool=True )

	Local result:=Cpynd(data, Not onPlace)

	Local n:=result.Length
	For Local i:Int = 0 Until n
		For Local j:Int = 0 Until n - i - 1
			If result[j] > result[j + 1]
				Local temp:= result[j]
				result[j] = result[j + 1]
				result[j + 1] = temp
			End
		End
	End
	
	Return result
End