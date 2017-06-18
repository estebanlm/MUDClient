accessing
cleanName
	^ LOTJTextDecorationParser cleanText: (self ROOMNAME ifNil: [ '' ])