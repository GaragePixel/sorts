
Namespace stdlib.algorithms.sorts

'---------------------------------------------------------- Introsort

Function IntroSort<T>(data:T[])
	
	' Introsort
	' Implementation: iDkP for GaragePixel
	' 2011-xx-xx (Aida 2)
	' Inventor: David Musser, 1997
	'
	' Hybrid sorting algorithm that uses QuickSort, HeapSort and InsertionSort
	' Combines best features of these algorithms - O(n log n) in all cases
	
	Local n:=data.Length
	
	' Calculate max depth for switching to heapsort
	Local maxDepth:Int = (Int(Log(n) * 2))
	
	IntroSortUtil(data, 0, n - 1, maxDepth)
End

Function IntroSortUtil<T>(data:T[], begin:Int, atEnd:Int, depthLimit:Int)
	Local size:Int = atEnd - begin + 1
	
	' Use insertion sort for small arrays
	If size < 16
		InsertionSortRange(data, begin, atEnd)
		Return
	End
	
	' If depth limit is zero, use heapsort
	If depthLimit = 0
		BuildHeap(data, begin, atEnd)
		For Local i:Int = atEnd Until begin + 1 Step -1
			' Swap first and current
			Local temp:T = data[begin]
			data[begin] = data[i]
			data[i] = temp
			
			' Heapify reduced heap
			Heapify(data, begin, i-1, begin)
		End
		Return
	End
	
	' Otherwise, use quicksort
	Local pivot:Int = Partition(data, begin, atEnd)
	IntroSortUtil(data, begin, pivot - 1, depthLimit - 1)
	IntroSortUtil(data, pivot + 1, atEnd, depthLimit - 1)
End

Function BuildHeap<T>(data:T[], begin:Int, atEnd:Int)
	Local size:Int = atEnd - begin + 1
	For Local i:Int = begin + size/2 - 1 until begin Step - 1
		Heapify(data, begin, atEnd, i)
	End
End

Function Heapify<T>(data:T[], begin:Int, atEnd:Int, i:Int)
	Local largest:Int = i
	Local left:Int = 2*(i-begin) + 1 + begin
	Local right:Int = 2*(i-begin) + 2 + begin
	
	If left <= atEnd And data[left] > data[largest]
		largest = left
	End
	
	If right <= atEnd And data[right] > data[largest]
		largest = right
	End
	
	If largest <> i
		Local temp:T = data[i]
		data[i] = data[largest]
		data[largest] = temp
		
		Heapify(data, begin, atEnd, largest)
	End
End

Function Partition<T>:Int(data:T[], begin:Int, atEnd:Int)
	' Use median-of-three as pivot
	Local mid:Int = begin + (atEnd - begin) / 2
	
	' Sort begin, mid, end
	If data[begin] > data[mid]
		Local temp:T = data[begin]
		data[begin] = data[mid]
		data[mid] = temp
	End
	
	If data[mid] > data[atEnd]
		Local temp:T = data[mid]
		data[mid] = data[atEnd]
		data[atEnd] = temp
		
		If data[begin] > data[mid]
			temp = data[begin]
			data[begin] = data[mid]
			data[mid] = temp
		End
	End
	
	' Use mid as pivot and place at end-1
	Local pivot:T = data[mid]
	
	' Move pivot to end-1
	Local temp:T = data[mid]
	data[mid] = data[atEnd-1]
	data[atEnd-1] = temp
	
	Local i:Int = begin
	Local j:Int = atEnd - 1
	
	' Standard partition algorithm
	While True
		' Find element > pivot
		i += 1
		While data[i] < pivot
			i += 1
		Wend
		
		' Find element < pivot
		j -= 1
		While data[j] > pivot
			j -= 1
		Wend
		
		If i >= j Exit
		
		temp = data[i]
		data[i] = data[j]
		data[j] = temp
	Wend
	
	' Put pivot back in right place
	temp = data[i]
	data[i] = data[atEnd-1]
	data[atEnd-1] = temp
	
	Return i
End

'---------------------------------------------------------- Parallel Introsort
#rem 
Class ParallelIntroSort<T>
	
	' Provides a multi-threaded IntroSort implementation
	' that leverages multiple CPU cores for sorting large arrays with
	' optimal O(n log n) worst-case performance guarantee.
	'
	' Usage example:
	'
	' 	ParallelIntroSort<Int>.Sort(myArray)
	' 
	' 	Or with custom key selector:
	' 	ParallelIntroSort<Vec2f>.SortBy(pointArray, Lambda:Float(v:Vec2f)
	'		Return v.x
	'	End)

	' Depth limit before switching to heapsort (2*log2(n))
	Const MaxDepth:Int = 64
	
	' Threshold for using insertion sort on small arrays
	Const InsertionThreshold:Int = 16
	
	' Threshold for parallel execution
	Const ParallelThreshold:Int = 8192
	
	' Thread pool for parallel tasks
	Field _threadPool:ThreadPool
	Field _maxThreads:Int
	
	Method New(maxThreads:Int = 0)
		' Initialize with system thread count if not specified
		_maxThreads = maxThreads > 0 ? maxThreads Else System.NumCPUs() - 1
		_maxThreads = Max(1, _maxThreads)  ' At least one thread
		_threadPool = New ThreadPool(_maxThreads)
	End
	
	' Main entry point for sorting
	Function Sort<U>(this:U[], comparer:IComparer<U> = Null)
		' Create instance and call instance method
		Local sorter:= New ParallelIntroSort<U>
		sorter.SortArray(this, 0, this.Length - 1, comparer, MaxDepth)
	End
	
	' Convenience method for sorting with key selector
	Function SortBy<U>(this:U[], keySelector:U)
		' Create comparer from key selector
		Local comparer:= Lambda:Int(a:U, b:U)
			Local keyA:= keySelector(a)
			Local keyB:= keySelector(b)
			If keyA < keyB Return -1
			If keyA > keyB Return 1
			Return 0
		End
		Sort<U>(this, comparer)
	End
	
	' Main recursive sorting method
	Method SortArray<U>(this:U[], left:Int, right:Int, comparer:IComparer<U>, maxDepth:Int)
		' Sort the array partition using IntroSort algorithm
		
		' Use insertion sort for small arrays
		If right - left <= InsertionThreshold
			InsertionSort(this, left, right, comparer)
			Return
		End
		
		' Switch to heap sort if recursion too deep
		If maxDepth = 0
			HeapSort(this, left, right, comparer)
			Return
		End
		
		' Standard quicksort with median-of-three pivot
		Local pivot:= MedianOfThree(this, left, left + (right - left) / 2, right, comparer)
		Local i:= left
		Local j:= right
		
		While True
			While comparer.Compare(this[i], pivot) < 0
				i += 1
			Wend
			
			While comparer.Compare(this[j], pivot) > 0
				j -= 1
			Wend
			
			If i >= j Exit
			
			Swap(this, i, j)
			i += 1
			j -= 1
		Wend
		
		' Parallel recursion for large partitions
		If right - left > ParallelThreshold And _maxThreads > 1
			' Process left partition in parallel thread
			If left < j
				Local task:= Lambda()
					SortArray(this, left, j, comparer, maxDepth - 1)
				End
				_threadPool.AddTask(task)
			End
			
			' Process right partition in current thread
			If i < right
				SortArray(this, i, right, comparer, maxDepth - 1)
			End
			
			' Wait for all tasks to complete
			_threadPool.WaitForAll()
		Else
			' Sequential recursion for smaller partitions
			If left < j SortArray(this, left, j, comparer, maxDepth - 1)
			If i < right SortArray(this, i, right, comparer, maxDepth - 1)
		End
	End
	
	' Helper method for insertion sort
	Method InsertionSort<U>(this:U[], left:Int, right:Int, comparer:IComparer<U>)
		' Insertion sort for small arrays or final pass
		For Local i:= left + 1 To right
			Local item:= this[i]
			Local j:= i - 1
			
			While j >= left And comparer.Compare(this[j], item) > 0
				this[j + 1] = this[j]
				j -= 1
			Wend
			
			this[j + 1] = item
		Next
	End
	
	' Helper method for heap sort
	Method HeapSort<U>(this:U[], left:Int, right:Int, comparer:IComparer<U>)
		' Heap sort for guaranteed O(n log n) worst case
		Local n:= right - left + 1
		
		' Build heap
		For Local i:=(n/2 - 1) Until 0 Step -1
			Heapify(this, i, n, left, comparer)
		Next
		
		' Extract from heap
		For Local i:= n - 1 To 0 Step -1
			Swap(this, left, left + i)
			Heapify(this, 0, i, left, comparer)
		Next
	End
	
	' Helper method for heap maintenance
	Method Heapify<U>(this:U[], i:Int, n:Int, offset:Int, comparer:IComparer<U>)
		Local largest:= i
		Local left:= 2 * i + 1
		Local right:= 2 * i + 2
		
		If left < n And comparer.Compare(this[offset + left], this[offset + largest]) > 0
			largest = left
		End
		
		If right < n And comparer.Compare(this[offset + right], this[offset + largest]) > 0
			largest = right
		End
		
		If largest <> i
			Swap(this, offset + i, offset + largest)
			Heapify(this, largest, n, offset, comparer)
		End
	End
	
	' Helper method for median-of-three pivot selection
	Method MedianOfThree<U>:U(this:U[], a:Int, b:Int, c:Int, comparer:IComparer<U>)
		' Select median of three values to improve pivot selection
		Local ab:= comparer.Compare(this[a], this[b])
		Local ac:= comparer.Compare(this[a], this[c])
		Local bc:= comparer.Compare(this[b], this[c])
		
		If ab < 0
			If bc < 0 Return this[b]  ' a < b < c
			If ac < 0 Return this[c]  ' a < c < b
			Return this[a]            ' c < a < b
		Else
			If ac > 0 Return this[b]  ' b < c < a
			If bc > 0 Return this[c]  ' b < a < c
			Return this[a]            ' c < b < a
		End
	End
	
	' Helper method for swapping elements TODO: integrate with swappings
	Method Swap<U>(this:U[], i:Int, j:Int)
		Local temp:= this[i]
		this[i] = this[j]
		this[j] = temp
	End
End
#end