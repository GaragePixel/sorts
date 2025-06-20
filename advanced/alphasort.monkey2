
Namespace sorts.adv

#Rem monkeydoc AlphaSort as BurstSort: Trie-based burst trie sort for String[]
@author iDkP from GaragePixel
@since 2025-06-19
@inspiredby Burstsort (Sinha/ Zobel), PATRICIA, GaragePixel
Tech: Trie (burst trie) for binning/partitioning, stable, O(n*avglen) time, O(n) space.
Best for: Massive string[] (e.g. dictionaries, wordlists).
#End
Function AlphaSort:String[]( arr:String Ptr )
	'Main BurstSort
	Local n:=arr[0].Length
	If n=0 Return Null
	Local root:=New _BurstTrieNode
	For Local s:=Eachin arr[0]
		_BurstInsert(root, Varptr(arr[s]), 0)
	End
	Local result:=New String[n]
	Local idx:=0
	_BurstCollect(root, Varptr(result[0]), Varptr(idx))
	Return result
End

Private

Class _BurstTrieNode
	'Trie node for burstsort
	Field children:Map<Int,_BurstTrieNode>
	Field values:String[]
	Method New()
		children=New Map<Int,_BurstTrieNode>
		values=New String[0]
	End
End

Function _BurstInsert( node:_BurstTrieNode, s:String Ptr, depth:Int )
	'Recursive insert
	If depth=s[0].Length
		' Append s to node.values (Monkey2-style array append)
		Local old:=node.values
		Local n:=old.Length
		Local newarr:=New String[n+1]
		For Local i:=0 Until n
			newarr[i]=old[i]
		End
		newarr[n]=s[0]
		node.values=newarr
		Return
	End
	Local c:=Int(s[depth])
	If Not node.children.Contains(c)
		node.children[c]=New _BurstTrieNode
	End
	_BurstInsert(node.children[c], s, depth+1)
End

Function _BurstCollect( node:_BurstTrieNode, arr:String Ptr, idx:Int Ptr )
	'Recursive collect
	For Local v:=Eachin node.values
		arr[idx[0]]=v
		idx+=1
	End
	For Local c:=Eachin node.children.Keys
		_BurstCollect(node.children[c], arr, idx)
	End
End