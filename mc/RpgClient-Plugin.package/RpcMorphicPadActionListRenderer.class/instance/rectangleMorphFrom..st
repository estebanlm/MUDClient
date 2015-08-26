as yet unclassified
rectangleMorphFrom: anActionListPresentation
	^ (super rectangleMorphFrom: anActionListPresentation)
		cellInset: 2;
		layoutPolicy: RpcUniformTableLayout new;
		yourself