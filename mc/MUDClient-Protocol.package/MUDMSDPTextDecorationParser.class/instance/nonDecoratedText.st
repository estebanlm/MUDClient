grammar
nonDecoratedText
	^ (ampersand ==> [ :nodes | MUDMSDPTextDecorationNode text: '&' ])
		/ (text ==> [ :nodes | MUDMSDPTextDecorationNode text: nodes ])