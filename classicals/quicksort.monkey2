
Namespace sorts
'Using stdlib.io..
'---------------------------------------------------------- QuickSort

#rem monkeydoc Sorts an array with Quicksort.
@implementation iDkP for GaragePixel
@since 2011-xx-xx (Aida 2)
@inventor Tony Hoare, 1959

Efficient divide and conquer algorithm
Average case O(n log n), worst case O(n²)

@param ascending True to sort the stack in ascending order, false to sort in descending order.
@param compareFunc Function to be used to compare values when sorting.
@param lo Index of first value to sort.
@param hi Index of last value to sort.@lo Int start index
#end
Function QuickSort<T>:T[]( data:T[],ascending:Int=True,inPlace:Bool=True )
	
	Local result:=Cpynd(data, Not inPlace)
	
	If ascending
		QuickSort( result,Lambda:Int( x:T,y:T )
			Return x<=>y
		End,0,result.Length-1 )
	Else
		QuickSort( result,Lambda:Int( x:T,y:T )
			Return y<=>x
		End,0,result.Length-1 )
	End
	
	Return result
End

#rem monkeydoc QuickSort
@implementation iDkP for GaragePixel
@since 2011-xx-xx (Aida 2)
@inventor Tony Hoare, 1959

Efficient divide and conquer algorithm
Average case O(n log n), worst case O(n²)
#end
Function QuickSort<T>:T[]( data:T[], compareFunc:Int( x:T,y:T ),lo:Int, hi:Int, filter:SortFilter=Null,inPlace:Bool=True ) 'iDkP: lo, hi = 32 bits
	
	If hi<=lo Return Null
	
	Local result:T[] = inPlace ? data Else CopyTo(New T[data.Length],data)
		
	If lo+1=hi
		If compareFunc( result[hi],result[lo] )<0 Swap( result,hi,lo )
		Return result
	End
		
	Local i:=(lo+hi)/2
		
	If compareFunc( result[i],result[lo] )<0 Swap( result,i,lo )

	If compareFunc( result[hi],result[i] )<0
		Swap( result,hi,i )
		If compareFunc( result[i],result[lo] )<0 Swap( result,i,lo )
	End
		
	Local x:=lo+1
	Local y:=hi-1
	Repeat
		Local p:=result[i]
		While compareFunc( result[x],p )<0
			x+=1
		Wend
		While compareFunc( p,result[y] )<0
			y-=1
		Wend
		If x>y Exit
		If x<y
			Swap( result,x,y )
			If i=x i=y ElseIf i=y i=x
		End
		x+=1
		y-=1
	Until x>y

	QuickSort( result,compareFunc,lo,y,filter )
	QuickSort( result,compareFunc,x,hi,filter )
	
	Return result
End

'---

'Function QuickSort<T>:T[]( data:T[], low:Int, high:Int )
'	Return QuickSort( data, Varptr(low), Varptr(high))[0]
'End 
'
'Function QuickSort<T>( data:T[], low:Int Ptr, high:Int Ptr )
'
'	If low < high
'		Local pi:Int = _QuickPartition<T>(data, low, high)
'		QuickSort<T>(data, low, pi - 1)
'		QuickSort<T>(data, pi + 1, high)
'	End
'	Return 'data
'End
'
'Private
'
'Function _QuickPartition<T>( data:T[], low:Int Ptr, high:Int Ptr )
'	Local pivot:T = data[high]
'	Local i:Int = low[0] - 1
'	For Local j:Int = low[0] Until high[0]
'		If data[j] < pivot
'			i = i + 1
'			Local temp:T = data[i]
'			data[i] = data[j]
'			data[j] = temp
'		End
'	End
'	Local temp:T = data[i + 1]
'	data[i + 1] = data[high[0]]
'	data[high[0]] = temp
'	Return i + 1
'End

''--

