grammar
decoratedText
	^ decoration, text ==> [ :nodes |
		LOTJTextDecorationNode 
			decoration: nodes first second
			text: nodes second ]