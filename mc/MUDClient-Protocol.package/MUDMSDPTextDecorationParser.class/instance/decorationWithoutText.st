grammar
decorationWithoutText
	^ decoration  
		==> [ :nodes | MUDMSDPTextDecorationNode decoration: nodes second text: '' ]