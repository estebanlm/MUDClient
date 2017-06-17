grammar
nonDecoratedText
	^ (ampersand ==> [ :nodes | LOTJTextDecorationNode text: '&' ])
		/ (text ==> [ :nodes | LOTJTextDecorationNode text: nodes ])