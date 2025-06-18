
Namespace sorts

'---------------------------------------------------------- BubbleSort
#rem monkeydoc BubbleSort
@implementation iDkP for GaragePixel
@since 2011-xx-xx (Aida 2)
@inventor Unknown, documented as early as 1956

Simple comparison-based sorting algorithm
O(n²) worst and average case time complexity
#end
Function BubbleSort<T>(data:T[])

	Local n:=data.Length
	For Local i:Int = 0 Until n
		For Local j:Int = 0 Until n - i - 1
			If data[j] > data[j + 1]
				Local temp:= data[j]
				data[j] = data[j + 1]
				data[j + 1] = temp
			End
		End
	End
End
