
Namespace stdlib.algorithms.sorts

'---------------------------------------------------------- BogoSort

Function BogoSort<T>(data:T[])
	
	' BogoSort (Permutation Sort)
	' Implementation: iDkP for GaragePixel
	' 2025-03-14 (Aida 4)
	' Inventor: Unknown, popularized in 1993
	'
	' A highly inefficient sorting algorithm based on randomly permuting the array
	' until it happens to be sorted (O(n×n!) complexity in worst case)
	
	While Not IsSorted(data)
		Shuffle(data)
	Wend
End

Function IsSorted<T>:Bool(data:T[])
	' Check if array is sorted
	For Local i:Int = 0 Until data.Length-1
		If data[i] > data[i+1]
			Return False
		End
	End
	Return True
End

Function Shuffle<T>(this:T[])
	' Shuffle array randomly
	Local n:=this.Length
	
	For Local i:Int = n-1 Until 1 Step -1
		Local j:Int = Int(Rnd(0, i+1))
		Local temp:T = this[i]
		this[i] = this[j]
		this[j] = temp
	End
End