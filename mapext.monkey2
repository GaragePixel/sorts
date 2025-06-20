Class Map<K,V> Extension
	#Rem monkeydoc AlphaSort as BurstSort for Map
	@author iDkP from GaragePixel
	@since 2025-06-19
	@inspiredby Burstsort, PATRICIA, GaragePixel
	Trie-based sort for string[] via map extension
	#End
	Method AlphaSort:String[]( this:String[] ) Where K=Int And V=String
		Return AlphaSort(Varptr(this[0]))[0]
	End

	Method AlphaSort:String Ptr( this:String Ptr ) Where K=Int And V=String
		Return AlphaSort(Varptr(this[0]))
	End

	#Rem monkeydoc Counting Sort for array pairs - Map extension
	@author iDkP from GaragePixel
	@since 2025-06-19
	Tech: Non-comparison sort, O(n+k), stable, for integer keys.  
	Implements:
	- Array-based CountingSort: sorts v:T[] by k:Int[]
	- Map extension CountingSort: Map<Int,V>.CountingSort() returns V[] sorted by key
	#End
	Method CountingSort<T>:V[]() Where K=Int And V=T
		
		' Map<Int,V> extension CountingSort
		
		Local klength:=Count()
		If klength=0 Return Null

		Local keys:=New Int[klength]
		Local vals:=New V[klength]
		Local i:=0
		For Local k:=Eachin Keys
			keys[i]=k
			vals[i]=Self[k]
			i+=1
		End
		Return CountingSort(Varptr(keys[0]),vals[0])
	End
End
