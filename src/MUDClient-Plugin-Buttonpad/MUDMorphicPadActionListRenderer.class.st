"
I'm a glamour renderee specific for render pads.
"
Class {
	#name : #MUDMorphicPadActionListRenderer,
	#superclass : #GLMMorphicActionListRenderer,
	#category : 'MUDClient-Plugin-Buttonpad-View'
}

{ #category : #defaults }
MUDMorphicPadActionListRenderer class >> defaultWidth [
	^ 60
]

{ #category : #private }
MUDMorphicPadActionListRenderer >> buttonMorph: aModel [
	| button |
	
	button := PluggableButtonMorph 
		on: aModel 
		getState: nil 
		action: #execute.
		
	button 
		arguments: { button };
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		label: aModel buttonLabel;
		getEnabledSelector: nil;
		setBalloonText: aModel glamourAction help;
		extent: button minExtent;
		hResizing: #spaceFill;
		vResizing: #rigid;
		getMenuSelector: #buttonMenu:.

	^ button
]

{ #category : #rendering }
MUDMorphicPadActionListRenderer >> morphFrom: anActionListPresentation [ 
	| buttonsContainer buttonModel button |
	
	buttonsContainer := self rectangleMorphFrom: anActionListPresentation.
	anActionListPresentation allActions do: [ :each | 
		buttonModel := MUDPadButtonModel new.
		buttonModel glamourPresentation: anActionListPresentation.
		buttonModel glamourAction: each.

		button := self buttonMorph: buttonModel.
		buttonsContainer addMorphBack: button ].
	
	^ buttonsContainer
]

{ #category : #private }
MUDMorphicPadActionListRenderer >> rectangleMorphFrom: anActionListPresentation [
	^ (super rectangleMorphFrom: anActionListPresentation)
		cellInset: 2;
		layoutPolicy: MUDUniformTableLayout new;
		yourself
]

{ #category : #rendering }
MUDMorphicPadActionListRenderer >> render: aPresentation [
	container := GLMMorphic containerMorph. 
	container 
		changeTableLayout;
		listDirection: (aPresentation isHorizontal 
			ifTrue: [ #leftToRight ]
			ifFalse: [ #topToBottom ]);
		cellSpacing: #none;
		cellInset: 0;
		vResizing: #spaceFill;
		hResizing: #spaceFill.
	container addMorphBack: (self morphFrom: aPresentation).
	aPresentation when: GLMPresentationUpdated send: #actOnPresentationUpdated: to: self.
	^container 
]
