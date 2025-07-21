
Namespace stdlib.algorithms.sorts

#rem monkeydoc
@author iDkP from GaragePixel
@since 2025-07-12
@last 2025-07-21

34 compare functions who returns by ternary comparison: 
- 0 (equivalent in order)
- -1 or (less greater in order)
- 1 or (greater in order)

or binary comparisons:
- 1, 0 casted for false, 1 casted for true.

8 ternary compare functions.
26 binary compare functions.

In the numeric compare functions, we can compare two different datatype as long they are numerics.
We can also compare if values are identical, different or null/not null, in these cases,
the compare function can works with non-numerical values.

String comparison: alphabetical order, comparison by lengths (number of characters) or
by utf8 length (the buffer's size required to store a utf8 representation).

@note We can use these functions wherever we need to evaluate from a closure.

@note The functions BoolToTernary and Bool8ToTernary can be used to convert the result of 
a binary comparator to a ternary comparator.

@note the actual type comparator is more powerful than the original one wrote by M.Sibly,
as it can compare two different datatypes. But we need to implemente the ternary operator
for each type against each type intented to be used with the compare functions.

@note The quicksort algorithm used by Sibly uses only a single comparison function, 
while the algorithm allowed you to implement your own function in lambda form. 
But in practice, no one really bothered to use this feature, while in proffesional
application developpement, we need some prefabricated compare functions usable with
the quicksort (now, we can use many sorts).
The most basic comparison functions have been implemented by 2015 with my old sort library (Aida 3)
then expended since (Aida 4).
#end

'Ternary comparisons:

#rem monkeydoc compare numbers in ascending order.
@author iDkP from GaragePixel
@since 2025-07-12
@note you can compare numbers or any other datatypes as long T1 and T2 implements a compare operator between them.
#end
Function Compare<T1,T2>:Int( x:T1,y:T2 )
	Return x<=>y
End

#rem monkeydoc compare numbers in descending order.
@author iDkP from GaragePixel
@since 2025-07-12
@note you can compare numbers or any other datatypes as long T1 and T2 implements a compare operator between them.
#end
Function Compare_Descending<T1,T2>:Int( x:T1,y:T2 )
	Return y<=>x
End

#rem monkeydoc compare two strings.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Strings:Int( t1:String, t2:String )
	Return t1<=>t2
End

#rem monkeydoc compare two strings, inversed order.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Strings_Descending:Int( t1:String, t2:String )
	Return t2<=>t1
End

#rem monkeydoc compare the length of two strings.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Strings_Length:Int( t1:String, t2:String )
	Return t1.Length<=>t2.Length
End

#rem monkeydoc compare the length of two strings, inversed order.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Strings_Length_Descending:Int( t1:String, t2:String )
	Return t2.Length<=>t1.Length
End

#rem monkeydoc compare the Utf8 length of two strings.
@author iDkP from GaragePixel
@since 2025-07-21
@note It compares the size of the buffer required to store a utf8 representation of the string.
#end
Function Compare_Strings_Utf8Length:Int( t1:String, t2:String )
	Return t1.Utf8Length<=>t2.Utf8Length
End

#rem monkeydoc compare the Utf8 length of two strings, inversed order.
@author iDkP from GaragePixel
@since 2025-07-21
@note It compares the size of the buffer required to store a utf8 representation of the string.
#end
Function Compare_Strings_Utf8Length_Descending:Int( t1:String, t2:String )
	Return t2.Utf8Length<=>t1.Utf8Length
End

'Binary comparisons:

#rem monkeydoc compare if the value n is null (can compare non-number).
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Null<T>:Int( x:T )
	Return x=Null
End

#rem monkeydoc compare if the value n is not null (can compare non-number).
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_NotNull<T>:Int( x:T )
	Return x<>Null
End

#rem monkeydoc compare if the value x equal to the value y (can compare non-numbers).
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

#rem monkeydoc compare if the number x is equal 0.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Zero<T>:Int( x:T ) 					Where T Implements INumeric
	Return x=0
End

#rem monkeydoc compare if the number x is not equal 0.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_NotZero<T>:Int( x:T ) 					Where T Implements INumeric
	Return x<>0
End

#rem monkeydoc compare if the number x is less greater than 0.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_LessZero<T>:Int( x:T ) 				Where T Implements INumeric
	Return x<0
End

#rem monkeydoc compare if the number x is greater than 0.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_GreaterZero<T>:Int( x:T ) 				Where T Implements INumeric
	Return x>0
End

#rem monkeydoc compare if the number x is less greater or equal to 0.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_EqLessZero<T>:Int( x:T ) 				Where T Implements INumeric
	Return x<=0
End

#rem monkeydoc compare if the number x is greater or equal to 0.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_EqGreaterZero<T>:Int( x:T ) 			Where T Implements INumeric
	Return x>=0
End

#rem monkeydoc compare if number x is more great than number y.
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_Greater<T1,T2>:Int( x:T1,y:T2 ) 		Where T1 Implements INumeric And T2 Implements INumeric
	Return x>y
End

#rem monkeydoc compare if number x is less great than number y.
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_Less<T1,T2>:Int( x:T1,y:T2 ) 			Where T1 Implements INumeric And T2 Implements INumeric
	Return y<x
End

#rem monkeydoc compare if number x is greater or equal great than number y.
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_GreaterEq<T1,T2>:Int( x:T1,y:T2 ) 		Where T1 Implements INumeric And T2 Implements INumeric
	Return x>=y
End

#rem monkeydoc compare if number x is less or equal great than number y.
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_LessEq<T1,T2>:Int( x:T1,y:T2 ) 		Where T1 Implements INumeric And T2 Implements INumeric
	Return y<=x
End

#rem monkeydoc compare if numbers are equals.
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_Eq<T1,T2>:Int( x:T1,y:T2 ) 			Where T1 Implements INumeric And T2 Implements INumeric
	Return y=x
End

#rem monkeydoc compare if numbers are not equals.
@author iDkP from GaragePixel
@since 2025-07-12
#end
Function Compare_NotEq<T1,T2>:Int( x:T1,y:T2 ) 			Where T1 Implements INumeric And T2 Implements INumeric
	Return y<>x
End

#rem monkeydoc compare if two strings are identicals.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Strings_Eq:Int( t1:String, t2:String )
	Return t1=t2
End

#rem monkeydoc compare if two strings are differents.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Strings_Diff:Int( t1:String, t2:String )
	Return t1<>t2
End

#rem monkeydoc compare if the first string precedes the second one.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Strings_Less:Int( t1:String, t2:String )
	Return t1<t2
End

#rem monkeydoc compare if the first string follows the second one.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Strings_Greater:Int( t1:String, t2:String )
	Return t1>t2
End

#rem monkeydoc compare if the length of two strings are equals.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Strings_Length_Eq:Int( t1:String, t2:String )
	Return t1.Length=t2.Length
End

#rem monkeydoc compare if the length of two strings are differents.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Strings_Length_Diff:Int( t1:String, t2:String )
	Return t1.Length<>t2.Length
End

#rem monkeydoc compare if the length of the first string is less greater than the length of the second one.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Strings_Length_Less:Int( t1:String, t2:String )
	Return t1.Length<t2.Length
End

#rem monkeydoc compare if the length of the first string is less greater or equal to the length of the second one.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Strings_Length_EqLess:Int( t1:String, t2:String )
	Return t1.Length<=t2.Length
End

#rem monkeydoc compare if the length of the first string is greater than the length of the second one.
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Strings_Length_Greater:Int( t1:String, t2:String )
	Return t1.Length>t2.Length
End

#rem monkeydoc compare if the length of the first string is greater or equal to the length of the second one. 
@author iDkP from GaragePixel
@since 2025-07-21
#end
Function Compare_Strings_Length_EqGreater:Int( t1:String, t2:String )
	Return t1.Length>=t2.Length
End
