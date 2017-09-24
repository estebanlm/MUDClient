Class {
	#name : #MUDMorphicEnhancedTabbedRenderer,
	#superclass : #GLMMorphicTabbedRenderer,
	#category : 'MUDClient-View-Glamour'
}

{ #category : #rendering }
MUDMorphicEnhancedTabbedRenderer >> lastActivePresentationIndexOf: presentations in: aPresentation [  
	| index |
	
	index := 1.
	presentations withIndexDo: [ :each :i | 
		(aPresentation pane isLastActivePresentation: each)
			ifTrue: [ index := i ] ].
	^ index
]

{ #category : #rendering }
MUDMorphicEnhancedTabbedRenderer >> render: aPresentation [
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
]

{ #category : #rendering }
MUDMorphicEnhancedTabbedRenderer >> subscribePresentation: aPresentation toNotificationsOf: tab [ 
	| activePresentation |
	
	tabs announcer when: LazyTabPageChanged do: [ :ann | 
		activePresentation := aPresentation matchingPresentations at: ann pageIndex.
		aPresentation parentPrototype announcer 
			announce: (MUDPresentationActivated new 
				presentation: activePresentation;
				yourself).				
		aPresentation announcer suspendAllWhile: [ 
			aPresentation pane lastActivePresentation: activePresentation ]].

]

{ #category : #rendering }
MUDMorphicEnhancedTabbedRenderer >> subscribePresentationToContextNotifications: aPresentation [
	aPresentation when: GLMContextChanged send: #actOnContextChanged: to: self.
	aPresentation when: GLMPresentationUpdated send: #actOnPresentationUpdated: to: self.
	aPresentation when: GLMPresentationToolbarUpdated send: #actOnPresentationToolbarUpdated: to: self
]
