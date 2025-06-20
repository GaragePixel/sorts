
Namespace sorts.edu

'---------------------------------------------------------- BogoSort

#rem monkeydoc BogoSort (Permutation Sort)
@implementation iDkP for GaragePixel
@since 2025-03-14 (Aida 4)
@inventor Unknown, popularized in 1993

A highly inefficient sorting algorithm based on randomly permuting the array
until it happens to be sorted (O(n×n!) complexity in worst case)
#end
Function BogoSort<T>:T[](data:T[])

	While Not _IsSorted(Varptr(data[0]))
		_Shuffle(Varptr(data[0]))
	Wend
	Return data
End

Private

Function _IsSorted<T>:Bool(data:T Ptr)
	' Check if array is sorted
	For Local i:Int = 0 Until data[0].Length-1
		If data[i] > data[i+1]
			Return False
		End
	End
	Return True
End

Function _Shuffle<T>(this:T Ptr)
	' Shuffle array randomly
	Local n:=this.Length
	
	For Local i:Int = n-1 Until 1 Step -1
		Local j:Int = Int(Rnd(0, i+1))
		Local temp:T = this[i]
		this[i] = this[j]
		this[j] = temp
	End
End