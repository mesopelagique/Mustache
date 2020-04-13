//%attributes = {}

_:=spec 

While (_.describe("A new Scanner"))
	While (_.describe("for an empty string"))
		While (_.it("is at the end"))
			_.scanner:=cs:C1710.Scanner.new("")
			ASSERT:C1129(_.scanner.eos();_.message())
		End while 
	End while 
	
	While (_.describe("for a non-empty string"))
		
		_.beforeEach(Formula:C1597(This:C1470.scanner:=cs:C1710.Scanner.new("a b c")))
		
		While (_.describe("scan"))
			
			While (_.describe("when the RegExp matches the entire string"))
				While (_.it("returns the entire string"))
					$match:=_.scanner.scan("a b c")
					ASSERT:C1129($match=_.scanner.string;_.message())
					ASSERT:C1129(_.scanner.eos();_.message())
				End while 
			End while 
			
			While (_.describe("when the RegExp matches at index 0"))
				While (_.it("returns the portion of the string that matched"))
					$match:=_.scanner.scan("a")
					ASSERT:C1129($match="a";_.message())
					ASSERT:C1129(_.scanner.pos=1;_.message())
				End while 
			End while 
			
			While (_.describe("when the RegExp matches at some index other than 0"))
				While (_.it("returns the empty string"))
					$match:=_.scanner.scan("b")
					ASSERT:C1129($match="";_.message())
					ASSERT:C1129(_.scanner.pos=0;_.message())
				End while 
			End while 
			
			While (_.describe("when the RegExp does not match"))
				While (_.it("returns the empty string"))
					$match:=_.scanner.scan("z")
					ASSERT:C1129($match="";_.message())
					ASSERT:C1129(_.scanner.pos=0;_.message())
				End while 
			End while 
			
		End while   // scan
		
		While (_.describe("scanUntil"))
			
			While (_.describe("when the RegExp matches at index 0"))
				While (_.it("returns the empty string"))
					$match:=_.scanner.scanUntil("a")
					ASSERT:C1129($match="";_.message())
					ASSERT:C1129(_.scanner.pos=0;_.message())
				End while 
			End while 
			
			While (_.describe("when the RegExp matches at some index other than 0"))
				While (_.it("returns the string up to that index"))
					$match:=_.scanner.scanUntil("b")
					ASSERT:C1129($match="a ";_.message())
					ASSERT:C1129(_.scanner.pos=2;_.message())
				End while 
			End while 
			
			While (_.describe("when the RegExp does not match"))
				While (_.it("returns the empty string"))
					$match:=_.scanner.scanUntil("z")
					ASSERT:C1129($match=_.scanner.string;_.message())
					ASSERT:C1129(_.scanner.eos();_.message())
				End while 
			End while 
			
		End while   // scanUntil
		
	End while 
End while 

_.check()

