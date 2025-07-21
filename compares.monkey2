
Namespace stdlib.algorithms.sorts

#rem monkeydoc
@author iDkP from GaragePixel
@since 2025-07-12
The quicksort algorithm used by Sibly uses only a single comparison function, 
while the algorithm allowed you to implement your own function in lambda form. 
But in practice, no one really bothered to use this feature, 
but anyway, the most basic comparison functions should have been implemented by 2015. 
That's why 10 years later, iDkP decided to create these functions as part of the sorting library.
Here 18 compare functions, who returns 0, -1 or 1, 0 casted for false, 1 casted for true.
In the numeric compare functions, we can compare two different datatype as long they are numerics.
We can also compare if values are identical, different or null/not null, in these cases,
the compare function can works with non-numerical values.

@todo: String comparaison, similar than javascript's rules

#end

#rem monkeydoc compare if the value n is null (can compare non-number)
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Null<T>:Int( x:T )
	Return x=Null
End

#rem monkeydoc compare if the value n is not null (can compare non-number)
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_NotNull<T>:Int( x:T )
	Return x<>Null
End

#rem monkeydoc compare if the value x equal to the value y (can compare non-numbers)
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Eq<T1,T2>:Int( x:T1,y:T2 )
	Return x=y
End

#rem monkeydoc compare if the value x different from the value y (can compare non-numbers)
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Diff<T1,T2>:Int( x:T1,y:T2 )
	Return x<>y
End

#rem monkeydoc compare if the number x is equal 0
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Zero<T>:Int( x:T ) 					Where T Implements INumeric
	Return x=0
End

#rem monkeydoc compare if the number x is not equal 0
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_NotZero<T>:Int( x:T ) 					Where T Implements INumeric
	Return x<>0
End

#rem monkeydoc compare if the number x is less greater than 0
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_LessZero<T>:Int( x:T ) 				Where T Implements INumeric
	Return x<0
End

#rem monkeydoc compare if the number x is greater than 0
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_GreaterZero<T>:Int( x:T ) 				Where T Implements INumeric
	Return x>0
End

#rem monkeydoc compare if the number x is less greater or equal to 0
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_EqLessZero<T>:Int( x:T ) 				Where T Implements INumeric
	Return x<=0
End

#rem monkeydoc compare if the number x is greater or equal to 0
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_EqGreaterZero<T>:Int( x:T ) 			Where T Implements INumeric
	Return x>=0
End

#rem monkeydoc compare numbers in ascending order
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_Ascending<T1,T2>:Int( x:T1,y:T2 ) 		Where T1 Implements INumeric And T2 Implements INumeric
	Return x<=>y
End

#rem monkeydoc compare numbers in descending order
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_Descending<T1,T2>:Int( x:T1,y:T2 ) 	Where T1 Implements INumeric And T2 Implements INumeric
	Return y<=>x
End

#rem monkeydoc compare if number x is more great than number y
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_Greater<T1,T2>:Int( x:T1,y:T2 ) 		Where T1 Implements INumeric And T2 Implements INumeric
	Return x>y
End

#rem monkeydoc compare if number x is less great than number y
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_Less<T1,T2>:Int( x:T1,y:T2 ) 			Where T1 Implements INumeric And T2 Implements INumeric
	Return y<x
End

#rem monkeydoc compare if number x is greater or equal great than number y
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_GreaterEq<T1,T2>:Int( x:T1,y:T2 ) 		Where T1 Implements INumeric And T2 Implements INumeric
	Return x>=y
End

#rem monkeydoc compare if number x is less or equal great than number y
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_LessEq<T1,T2>:Int( x:T1,y:T2 ) 		Where T1 Implements INumeric And T2 Implements INumeric
	Return y<=x
End

#rem monkeydoc compare if numbers are equals
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_Eq<T1,T2>:Int( x:T1,y:T2 ) 			Where T1 Implements INumeric And T2 Implements INumeric
	Return y=x
End

#rem monkeydoc compare if numbers are not equals
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_NotEq<T1,T2>:Int( x:T1,y:T2 ) 			Where T1 Implements INumeric And T2 Implements INumeric
	Return y<>x
End
