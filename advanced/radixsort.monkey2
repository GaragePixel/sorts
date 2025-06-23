
Namespace sorts.adv

'---------------------------------------------------------- Radixsort

#Rem monkeydoc In-place Radix Sort for fixed-width numeric strings
@author iDkP from GaragePixel
@since 2025-06-19

Tech: MSD radix, binary quicksort variant, in-place, zero heap allocation
For: Fixed-width numeric strings (e.g. "0034", "1201").  
Stable: False. Space: O(1).
#End
Function RadixSort( arr:String Ptr, pos:Int=0, left:Int=0, right:Int=-1, onPlace:Bool=True )

	' Note: Placed in advanced sorts because:
	'
	' Pure MSD radix/binary quicksort variant, zero heap, in-place, technical, non-stable
	' Not “classical” (not textbook counting sort or insertion/selection/merge/quick), 
	' not “educational” (not for teaching basics), not “o2sorts” (not your O2 family), 
	' not “specials” (not a curiosity or demo)
	' Fits “advanced”: high-performance, low-allocation, targeted for expert/technical use 
	' and for users who need specialized string sorting.

	If right=-1 Then right=arr[0].Length-1
	If left>=right Return

	'Find length of string (assume all same length)
	Local strlen:=arr[left].Length
	If pos>=strlen Return

	'Partition into 0s and 1s at this digit
	Local i:=left
	Local j:=right
	While i<=j
		While i<=j And arr[i][pos]="0" 
			i+=1
		Wend
		While i<=j And arr[j][pos]<>"0" 
			j-=1
		Wend
		If i<j
			Local tmp:=arr[i]
			arr[i]=arr[j]
			arr[j]=tmp
			i+=1
			j-=1
		End
	Wend

	'Recursively sort the bins
	RadixSort( arr, pos+1, left, j )
	RadixSort( arr, pos+1, i, right )
End

#Rem monkeydoc Hybrid Radix-Insertion Sort for fixed-width numeric strings
@author iDkP from GaragePixel
@since 2025-06-19

Tech: MSD radix sort (stable) + CountingSort for digit binning, switches to InsertionSort for small bins.
For: Fixed-width numeric strings, leading zeros.  
Stable: True. Space: O(n+d). Fast for large arrays, hybrid for small bins.
#End
Function HybridRadixSort( arr:String Ptr, pos:Int=0, left:Int=0, right:Int=-1, binLimit:Int=32, onPlace:Bool=True )

	' Note: HybridRadixSort belongs to the category of non-comparison-based sorts 
	' (also called distribution sorts), specifically in the radix sort family.
	'
	' It is:	
	'
    '	- A radix sort (it sorts data by processing digits/characters of the keys)
    '	- An MSD (Most Significant Digit) radix sort (sorting starts from the most significant digit)
    '	- A hybrid sort because it combines radix sorting (distribution by digit) 
    '	with insertion sort for small bins (for cache/locality/performance reasons)
	'
	' Placed in advanced sorts because:
	'
	' Hybrid stable radix sort, combines digit binning (distribution sort) 
	' with insertion sort for small bins, technical and optimized.
	' Not “classicals” (does not directly teach a classical algorithm), 
	' not “educationals” (not ideal for beginners), not “o2sorts”, not “specials”.
	' Fits “advanced”: algorithmic sophistication, hybrid engineering, and real-world optimizations.

	If right=-1 right=arr[0].Length-1
	If left>=right Return

	Local strlen:=arr[left].Length
	If pos>=strlen Return

	Local n:=right-left+1
	If n<=binLimit
		'InsertSort(arr, left, right, onPlace)
		Return
	End

	'Count bin sizes for all possible digits (0-9)
	Local bins:=New Int[10]
	For Local i:=left Until right+1
		Local d:=Int(arr[i][pos])-48
		bins[d]+=1
	End

	'Compute bin starts
	Local starts:=New Int[10]
	Local sum:=left
	For Local d:=0 Until 10
		starts[d]=sum
		sum+=bins[d]
	End

	'Distribute into bins in place
	Local i:=left
	For Local d:=0 Until 10
		Local endd:=starts[d]+bins[d]
		While i<endd
			Local c:=Int(arr[i][pos])-48 'FIXME
			If c=d
				i+=1
			Else
				Local swapd:=starts[c]
				Local tmp:=arr[i]
				arr[i]=arr[swapd]
				arr[swapd]=tmp
				starts[c]+=1
			End
		Wend
	End

	'Recursively sort each bin
	Local prev:=left
	For Local d:=0 Until 10
		Local binlen:=bins[d]
		If binlen>0
			HybridRadixSort(arr, pos+1, prev, prev+binlen-1, binLimit)
			prev+=binlen
		End
	End
End