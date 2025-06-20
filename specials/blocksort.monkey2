
Namespace sorts.specials

'---------------------------------------------------------- BlockSort
#rem monkeydoc BlockSort
@implementation iDkP for GaragePixel
@since 2025-03-14 (Aida 4)
@inventor Based on Bubble Sort, modern variant

An improved variant of bubble sort that divides data into blocks
Better performance than bubble sort with similar simplicity
#end
Function BlockSort<T>:T[]( data:T[] )
	Local n:=data.Length
	If n<2 Return Null

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
				Local key:=data[j]
				Local k:=j-1
				While k>=start And data[k]>key
					data[k+1]=data[k]
					k-=1
				Wend
				data[k+1]=key
			End
			' Swap block boundaries if needed
			If i<blocks-1
				Local nextblock:=Min((i+1)*blocksize, n-1)
				If data[finish]>data[nextblock]
					Local tmp:=data[finish]
					data[finish]=data[nextblock]
					data[nextblock]=tmp
					swapped=True
				End
			End
		End

		If Not swapped Exit
	Wend
	
	Return data
End
