
Namespace sorts

'---------------------------------------------------------- BlockSort
#rem monkeydoc BlockSort
@implementation iDkP for GaragePixel
@since 2025-03-14 (Aida 4)
@inventor Based on Bubble Sort, modern variant

An improved variant of bubble sort that divides data into blocks
Better performance than bubble sort with similar simplicity
#end
Function BlockSort<T>(data:T[])

	Local n:=data.Length
	Local blockSize:Int = Int(Sqrt(n))  ' Block size around sqrt(n) works well
	Local blockCount:Int = (n + blockSize - 1) / blockSize  ' Ceiling division
	
	While True
		Local swapped:Bool = False
		
		For Local i:Int = 0 Until blockCount
			' Sort each block using insertion sort
			Local start:Int = i * blockSize
			Local atEnd:Int = Min(start + blockSize - 1, n - 1)
			InsertionSortRange(data, start, atEnd)
			
			' Check if we need another pass
			If i < blockCount - 1
				Local nextBlockStart:Int = (i + 1) * blockSize
				Local nextBlockEnd:Int = Min(nextBlockStart + blockSize - 1, n - 1)
				
				' Check if blocks are in order relative to each other
				If data[atEnd] > data[nextBlockStart]
					swapped = True
				End
			End
		End
		
		If Not swapped Exit
	Wend
End

Function InsertionSortRange<T>(data:T[], begin:Int, atEnd:Int)
	For Local i:Int = begin+1 To atEnd
		Local key:T = data[i]
		Local j:Int = i - 1
		
		While j >= begin And data[j] > key
			data[j + 1] = data[j]
			j -= 1
		Wend
		data[j + 1] = key
	End
End
