rendering
lastActivePresentationIndexOf: presentations in: aPresentation  
	| index |
	
	index := 1.
	presentations withIndexDo: [ :each :i | 
		(aPresentation pane isLastActivePresentation: each)
			ifTrue: [ index := i ] ].
	^ index