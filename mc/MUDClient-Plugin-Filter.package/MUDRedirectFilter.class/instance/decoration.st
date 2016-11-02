accessing
decoration
	^ decoration ifNil: [ decoration := MUDFilterNullDecoration uniqueInstance ]