
Namespace sorts.specials

#Rem monkeydoc Counting Sort for array pairs
@author iDkP from GaragePixel
@since 2025-06-19
Tech: Non-comparison sort, O(n+k), stable, for integer keys.  
Implements:
- Array-based CountingSort: sorts v:T[] by k:Int[]
- Map extension CountingSort: Map<Int,V>.CountingSort() returns V[] sorted by key
#End
Function CountingSort<T>:T[]( k:Int Ptr, v:T Ptr )
	
	' Array-based CountingSort
	
	Local klength:=k[0].Length
	Local vlength:=v[0].Length
	If klength<>vlength Return Null

	If klength=0 Return New T[0]

	'Find min and max key
	Local min:=k[0]
	Local max:=k[0]
	For Local i:=1 Until klength
		If k[i]<min Then min=k[i]
		If k[i]>max Then max=k[i]
	End

	Local range:=max-min+1
	Local count:=New Int[range]
	Local output:=New T[klength]

	'Count occurrences
	For Local i:=0 Until klength
		count[k[i]-min]+=1
	End

	'Prefix sum
	For Local i:=1 Until range
		count[i]+=count[i-1]
	End

	'Build output (stable)
	For Local i:=klength-1 Until 0 Step -1
		Local idx:=k[i]-min
		count[idx]-=1
		output[count[idx]]=v[i]
	End

	Return output
End