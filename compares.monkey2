
Namespace stdlib.algorithms.sorts

#rem monkeydoc
@author iDkP from GaragePixel
@since 2025-07-12
The quicksort algorithm used by Sibly uses only a single comparison function, 
while the algorithm allowed you to implement your own function in lambda form. 
But in practice, no one really bothered to use this feature, 
but anyway, the most basic comparison functions should have been implemented by 2015. 
That's why 10 years later, iDkP decided to create these functions as part of the sorting library.
Here 16 compare functions, who returns 0, -1 or 1, 0 casted for false, 1 casted for true
#end 

'TODO: String comparaison, similar than javascript's rules

Function Compare_Null<T>:Int( x:T )
	Return x=Null
End

Function Compare_NotNull<T>:Int( x:T )
	Return x<>Null
End

Function Compare_Zero<T>:Int( x:T )
	Return x=0
End

Function Compare_NotZero<T>:Int( x:T )
	Return x<>0
End

Function Compare_LessZero<T>:Int( x:T )
	Return x<0
End

Function Compare_GreaterZero<T>:Int( x:T )
	Return x>0
End

Function Compare_EqLessZero<T>:Int( x:T )
	Return x<=0
End

Function Compare_EqGreaterZero<T>:Int( x:T )
	Return x>=0
End

#rem monkeydoc compare numbers in ascending order
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_Ascending<T>:Int( x:T,y:T )
	Return x<=>y
End

#rem monkeydoc compare numbers in descending order
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_Descending<T>:Int( x:T,y:T )
	Return y<=>x
End

#rem monkeydoc compare if number x is more great than number y
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_Greater<T>:Int( x:T,y:T )
	Return x>y
End

#rem monkeydoc compare if number x is less great than number y
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_Less<T>:Int( x:T,y:T )
	Return y<x
End

#rem monkeydoc compare if number x is greater or equal great than number y
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_GreaterEq<T>:Int( x:T,y:T )
	Return x>=y
End

#rem monkeydoc compare if number x is less or equal great than number y
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_LessEq<T>:Int( x:T,y:T )
	Return y<=x
End

#rem monkeydoc compare if numbers are equals
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_Eq<T>:Int( x:T,y:T )
	Return y=x
End

#rem monkeydoc compare if numbers are not equals
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_NotEq<T>:Int( x:T,y:T )
	Return y<>x
End
