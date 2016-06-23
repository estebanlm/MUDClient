visitor
visitText: aNode
	| textToAppend startPosition endPosition |
			
	textToAppend := aNode text.
	startPosition := text endPosition.
	endPosition := text endPosition insert: textToAppend.
	(text startPosition selectTo: (text startPosition moveRight: 100))
		applyAttribute: (TxForeColorAttribute with: self textColor).
		
	"self isBold ifTrue: [ 
		self text 
			makeBoldFrom: start + 1
			to: self text size ]"