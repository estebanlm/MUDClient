"
I represent a point on space. 
An empty sector (or non-charted)
"
Class {
	#name : #LOTJStarMapSpacePoint,
	#superclass : #LOTJStarMapPoint,
	#instVars : [
		'color'
	],
	#category : 'LOTJ-Plugin-StarMap-Model'
}

{ #category : #initialization }
LOTJStarMapSpacePoint class >> defaultColor [
	^ Color darkGray muchDarker
]

{ #category : #converting }
LOTJStarMapSpacePoint >> asMorph [ 
	^ LOTJStarMapSpaceMorph point: self
]

{ #category : #accessing }
LOTJStarMapSpacePoint >> color [
	^ color ifNil: [  self class defaultColor ]
]

{ #category : #accessing }
LOTJStarMapSpacePoint >> color: anObject [
	color := anObject
]

{ #category : #descriptions }
LOTJStarMapSpacePoint >> descriptionColor [
	<magritteDescription>
	
	^ MAColorDescription new 
		priority: 30;
		label: 'Color';
		accessor: #color;
		morphClass: MUDColorMorph; 
		yourself
]

{ #category : #descriptions }
LOTJStarMapSpacePoint >> descriptionSectorForCalc [
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 20;
		label: 'Calc';
		accessor: #sectorForCalc;
		beReadonly;
		yourself

]

{ #category : #accessing }
LOTJStarMapSpacePoint >> sectorForCalc [
	^ String streamContents: [ :stream | 
		stream 
			<< 'calc '''
			<< self sector x asString 
			<< ' ' 
			<< self sector y asString
			<< ''' 0 0 0' ]
]

{ #category : #accessing }
LOTJStarMapSpacePoint >> type [
	^ 'Empty space'
]
