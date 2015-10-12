grammar
decoratedText
	^ decoration, text ==> [ :nodes |
		MUDMSDPTextDecorationNode 
			decoration: nodes first second
			text: nodes second ]