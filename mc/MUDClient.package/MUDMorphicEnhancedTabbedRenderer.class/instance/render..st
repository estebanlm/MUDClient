rendering
render: aPresentation
	| presentations index |
	presentations := aPresentation matchingPresentations.
	presentations isEmpty
		ifTrue: [ ^ GLMMorphic emptyMorph ].
	(presentations size = 1 and: [ presentations first hasTitle not ])
		ifTrue: [ ^ self renderWithTitleOrNil: presentations first ].
	
	tabs := LazyTabGroupMorph new.
	tabs
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		cornerStyle: (self theme tabGroupCornerStyleIn: nil);
		font: self theme buttonFont.
	self subscribePresentation: aPresentation toNotificationsOf: tabs.

	presentations do: [ :each | 
		tabs
			addLazyPage: [ self renderObject: each ]
			label: (self titleOrIconOf: each in: tabs)
			toolbar: (self renderToolbarForPresentation: each inMorph: tabs)
			action: (self labelActionBrickFor: each) ].

	index := self lastActivePresentationIndexOf: presentations in: aPresentation. 		
	tabs announcer suspendAllWhile: [ tabs selectedPageIndex: index ].

	self subscribePresentationToContextNotifications: aPresentation.
	
	^ tabs