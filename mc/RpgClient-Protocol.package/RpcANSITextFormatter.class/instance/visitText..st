visitor
visitText: aNode
	| textToAppend start |
			
	textToAppend := aNode text copyWithout: Character cr.
	start := self text size.
		
	self text append: textToAppend.
	
	self text 
		makeColor: self textColor 
		from: start + 1
		to: self text size.
		
	self isBold ifTrue: [ 
		self text 
			makeBoldFrom: start + 1
			to: self text size ]