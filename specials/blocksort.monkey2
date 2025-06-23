
Namespace sorts.specials

'---------------------------------------------------------- BlockSort
#rem monkeydoc BlockSort
@implementation iDkP for GaragePixel
@since 2025-03-14 (Aida 4)
@inventor Based on Bubble Sort, modern variant

An improved variant of bubble sort that divides data into blocks
Better performance than bubble sort with similar simplicity
#end
Function BlockSort<T>:T[]( data:T[], inPlace:Bool=True )
	Local n:=data.Length
	If n<2 Return Null
	
	Local result:=Cpynd(data, Not inPlace)

	Local blocksize:=Int(Sqrt(n))
	If blocksize<1 blocksize=1
	Local blocks:=((n+blocksize-1)/blocksize)

	While True
		Local swapped:=False

		For Local i:=0 Until blocks
			Local start:=i*blocksize
			Local finish:=Min(start+blocksize-1, n-1)
			' Insertion sort within block
			For Local j:=start+1 To finish
				Local key:=result[j]
				Local k:=j-1
				While k>=start And result[k]>key
					result[k+1]=result[k]
					k-=1
				Wend
				result[k+1]=key
			End
			' Swap block boundaries if needed
			If i<blocks-1
				Local nextblock:=Min((i+1)*blocksize, n-1)
				If result[finish]>result[nextblock]
					Local tmp:=result[finish]
					result[finish]=result[nextblock]
					result[nextblock]=tmp
					swapped=True
				End
			End
		End

		If Not swapped Exit
	Wend
	
	Return result
End