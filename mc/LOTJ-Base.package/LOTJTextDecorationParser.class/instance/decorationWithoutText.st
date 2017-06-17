grammar
decorationWithoutText
	^ decoration  
		==> [ :nodes | LOTJTextDecorationNode decoration: nodes second text: '' ]