Class {
	#name : #MUDTextModel,
	#superclass : #TxModel,
	#instVars : [
		'styler'
	],
	#category : 'MUDClient-View-Text'
}

{ #category : #accessing }
MUDTextModel >> defaultStyler [
	^ MUDTextNullStyler new
]

{ #category : #accessing }
MUDTextModel >> styler [
	styler ifNil: [ self styler: self defaultStyler ].
	^ styler
]

{ #category : #accessing }
MUDTextModel >> styler: aStyler [
	aStyler text: self.
	styler := aStyler
]
