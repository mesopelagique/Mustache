/**
 A simple string scanner that is used by the template parser to find
 tokens in template strings.
**/
Class constructor
	C_TEXT:C284($1)
	This:C1470.string:=$1
	This:C1470.tail:=$1
	This:C1470.pos:=0
	
/**
Returns `true` if the tail is empty (end of string).
**/
Function eos
	C_BOOLEAN:C305($0)
	$0:=This:C1470.tail=""
	
/**
Tries to match the given regular expression at the current position.
Returns the matched text if it can match, the empty string otherwise.
**/
Function scan
	C_TEXT:C284($0;$string)
	C_TEXT:C284($1;$re)
	$re:=$1
	$string:=""
	
	ARRAY LONGINT:C221($pos_found_array;0)
	ARRAY LONGINT:C221($length_found_array;0)
	If (Match regex:C1019($re;This:C1470.tail;1;$pos_found_array;$length_found_array))
		
		If ($pos_found_array{0}=1)
			$string:=Substring:C12(This:C1470.tail;$pos_found_array{0};$length_found_array{0})
			This:C1470.tail:=Substring:C12(This:C1470.tail;Length:C16($string)+1)
			This:C1470.pos:=This:C1470.pos+Length:C16($string)
		End if 
		
	End if 
	$0:=$string
	
/**
Skips all text until the given regular expression can be matched. Returns
the skipped string, which is the entire tail if no match can be made.
**/
Function scanUntil
	C_TEXT:C284($0;$string)
	C_TEXT:C284($1;$re)
	$re:=$1
	$match:=""
	
	ARRAY LONGINT:C221($pos_found_array;0)
	ARRAY LONGINT:C221($length_found_array;0)
	If (Match regex:C1019($re;This:C1470.tail;1;$pos_found_array;$length_found_array))
		If ($pos_found_array{0}=1)
			$match:=""
		Else 
			$match:=Substring:C12(This:C1470.tail;1;$pos_found_array{0}-1)  // TODO check the bord +1 or -1
			This:C1470.tail:=Substring:C12(This:C1470.tail;$pos_found_array{0})
			
		End if 
	Else 
		$match:=This:C1470.tail
		This:C1470.tail:=""
		
	End if 
	
	This:C1470.pos:=This:C1470.pos+Length:C16($match)
	
	$0:=$match