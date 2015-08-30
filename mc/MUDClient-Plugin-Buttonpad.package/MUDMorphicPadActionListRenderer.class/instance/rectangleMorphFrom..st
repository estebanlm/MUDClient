as yet unclassified
rectangleMorphFrom: anActionListPresentation
	^ (super rectangleMorphFrom: anActionListPresentation)
		cellInset: 2;
		layoutPolicy: MUDUniformTableLayout new;
		yourself