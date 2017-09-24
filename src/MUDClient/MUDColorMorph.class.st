"
I'm a pick color morph (to be used with MAColorDescription)
"
Class {
	#name : #MUDColorMorph,
	#superclass : #MAElementMorph,
	#category : 'MUDClient-View-Magritte'
}

{ #category : #private-building }
MUDColorMorph >> buildMorphView [
	| panel colorMorph |

	panel := PanelMorph new
		layoutPolicy: TableLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		listDirection: #leftToRight;
		cellPositioning: #topLeft;
		listCentering: #topLeft;
		wrapCentering: #topLeft;
		cellInset: 5;
		borderWidth: 0;
		addMorphBack: (colorMorph := Morph new 
			vResizing: #spaceFill;
			hResizing: #spaceFill;
			borderWidth: 1;
			borderColor: Color black;
			color: self valueOrDefault
			yourself);
		addMorphBack: (PluggableButtonMorph new 
			label: 'Choose';
			actionBlock: [ 
				self value: (UIManager default
					chooseColor: (self value ifNil: [ Color black ])
					title: self magritteDescription label).
				colorMorph color: self valueOrDefault ];
			yourself);
		addMorphBack: (PluggableButtonMorph new 
			label: 'Reset';
			actionBlock: [ 
				self value: nil.
				colorMorph color: self defaultColor ];
			yourself);
		yourself.
		
	^ panel
]

{ #category : #private-building }
MUDColorMorph >> defaultColor [
	^ Color transparent
]

{ #category : #private-building }
MUDColorMorph >> valueOrDefault [
	^ self value ifNil: [ self defaultColor ]
]
