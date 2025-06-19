
Namespace tests

#Import "<stdlib>"
#Import "<sorts>"

'Using stdlib..

Using stdlib.collections..
Using stdlib.system.time..
Using stdlib.math.random..

Using sorts..

'---------------------------------------------------------- Unit Tests for New Sorting Algorithms

Global LoopNumber:=100000
Global ShortArray:=200
Global LongArray:=1000

Function Main()
	Print("-----------------")
	TestCocktailShakerSort()
	Print("-----------------")
	TestCombSort()
	Print("-----------------")
	TestStoogeSort()
	Print("-----------------")
	TestTimSort()
	Print("-----------------")
	Print "All sort tests passed."
End

Function TestCocktailShakerSort()
	
	Print "Testing: CocktailShakerSort"
	Local t0:Long, t1:Long

	t0 = Millisecs()
	For Local loop:=0 Until LoopNumber
		Local arr:=MakeShortArray()
		CocktailShakerSort(arr)
		AssertSorted(arr)
	End
	t1 = Millisecs()
	Print "Short arrays: " + (t1-t0) + " ms"

	t0 = Millisecs()
	For Local loop:=0 Until LoopNumber
		Local arr:=MakeLongArray()
		CocktailShakerSort(arr)
		AssertSorted(arr)
	End
	t1 = Millisecs()
	Print "Long arrays: " + (t1-t0) + " ms"

	t0 = Millisecs()
	For Local loop:=0 Until LoopNumber
		Local arr:=MakeNearlyOrderedArray()
		CocktailShakerSort(arr)
		AssertSorted(arr)
	End
	t1 = Millisecs()
	Print "Nearly ordered: " + (t1-t0) + " ms"

	t0 = Millisecs()
	For Local loop:=0 Until LoopNumber
		Local arr:=MakeRandomArray()
		CocktailShakerSort(arr)
		AssertSorted(arr)
	End
	t1 = Millisecs()
	Print "Random arrays: " + (t1-t0) + " ms"

	Print "CocktailShakerSort passed all tests."
End

Function TestCombSort()
	
	Print "Testing: CombSort"
	Local t0:Long, t1:Long

	t0 = Millisecs()
	For Local loop:=0 Until LoopNumber
		Local arr:=MakeShortArray()
		CombSort(arr)
		AssertSorted(arr)
	End
	t1 = Millisecs()
	Print "Short arrays: " + (t1-t0) + " ms"

	t0 = Millisecs()
	For Local loop:=0 Until LoopNumber
		Local arr:=MakeLongArray()
		CombSort(arr)
		AssertSorted(arr)
	End
	t1 = Millisecs()
	Print "Long arrays: " + (t1-t0) + " ms"

	t0 = Millisecs()
	For Local loop:=0 Until LoopNumber
		Local arr:=MakeNearlyOrderedArray()
		CombSort(arr)
		AssertSorted(arr)
	End
	t1 = Millisecs()
	Print "Nearly ordered: " + (t1-t0) + " ms"

	t0 = Millisecs()
	For Local loop:=0 Until LoopNumber
		Local arr:=MakeRandomArray()
		CombSort(arr)
		AssertSorted(arr)
	End
	t1 = Millisecs()
	Print "Random arrays: " + (t1-t0) + " ms"

	Print "CombSort passed all tests."
End

Function TestStoogeSort()
	
	Print "Testing: StoogeSort"
	Local t0:Long, t1:Long

	t0 = Millisecs()
	For Local loop:=0 Until 200
		Local arr:=MakeShortArray()
		StoogeSort(arr)
		AssertSorted(arr)
	End
	t1 = Millisecs()
	Print "Short arrays: " + (t1-t0) + " ms"

	t0 = Millisecs()
	For Local loop:=0 Until 200
		Local arr:=MakeLongArray()
		StoogeSort(arr)
		AssertSorted(arr)
	End
	t1 = Millisecs()
	Print "Long arrays: " + (t1-t0) + " ms"

	t0 = Millisecs()
	For Local loop:=0 Until 200
		Local arr:=MakeNearlyOrderedArray()
		StoogeSort(arr)
		AssertSorted(arr)
	End
	t1 = Millisecs()
	Print "Nearly ordered: " + (t1-t0) + " ms"

	t0 = Millisecs()
	For Local loop:=0 Until 200
		Local arr:=MakeRandomArray()
		StoogeSort(arr)
		AssertSorted(arr)
	End
	t1 = Millisecs()
	Print "Random arrays: " + (t1-t0) + " ms"

	Print "StoogeSort passed all tests."
End

Function TestTimSort()
	
	Print "Testing: TimSort"
	Local t0:Long, t1:Long

	t0 = Millisecs()
	For Local loop:=0 Until LoopNumber
		Local arr:=MakeShortArray()
		TimSort(arr)
		AssertSorted(arr)
	End
	t1 = Millisecs()
	Print "Short arrays: " + (t1-t0) + " ms"

	t0 = Millisecs()
	For Local loop:=0 Until LoopNumber
		Local arr:=MakeLongArray()
		TimSort(arr)
		AssertSorted(arr)
	End
	t1 = Millisecs()
	Print "Long arrays: " + (t1-t0) + " ms"

	t0 = Millisecs()
	For Local loop:=0 Until LoopNumber
		Local arr:=MakeNearlyOrderedArray()
		TimSort(arr)
		AssertSorted(arr)
	End
	t1 = Millisecs()
	Print "Nearly ordered: " + (t1-t0) + " ms"

	t0 = Millisecs()
	For Local loop:=0 Until LoopNumber
		Local arr:=MakeRandomArray()
		TimSort(arr)
		AssertSorted(arr)
	End
	t1 = Millisecs()
	Print "Random arrays: " + (t1-t0) + " ms"

	Print "TimSort passed all tests."
End

Function MakeShortArray:Int[]()
	Local n:=2+Rnd(4)
	Local arr:=New Int[n]
	For Local i:=0 Until n-1
		arr[i] = Rnd(100)
	End
	Return arr
End

Function MakeLongArray:Int[]()
	Local n:=LongArray
	Local arr:=New Int[n]
	For Local i:=0 Until n-1
		arr[i] = Rnd(100000)
	End
	Return arr
End

Function MakeNearlyOrderedArray:Int[]()
	Local n:=ShortArray
	Local arr:=New Int[n]
	For Local i:=0 Until n-1
		arr[i]=i
	End
	' swap two random elements
	Local a:=Rnd(n)
	Local b:=Rnd(n)
	Local temp:=arr[a]
	arr[a]=arr[b]
	arr[b]=temp
	Return arr
End

Function MakeRandomArray:Int[]()
	Local n:=ShortArray
	Local arr:=New Int[n]
	For Local i:=0 Until n-1
		arr[i]=Rnd(10000)
	End
	Return arr
End

Function AssertSorted<T>(arr:T[])
	For Local i:=1 Until arr.Length
		If arr[i]<arr[i-1]
			RuntimeError("Sort failed: not in order")
		End
	End
End
