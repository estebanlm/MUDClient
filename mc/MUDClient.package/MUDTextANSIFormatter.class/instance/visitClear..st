visitor
visitClear: aNode
	aNode value = 2 ifFalse: [ ^ self ]. 
	"self text initializeContents"