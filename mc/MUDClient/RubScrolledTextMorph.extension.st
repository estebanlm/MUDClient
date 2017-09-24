Extension { #name : #RubScrolledTextMorph }

{ #category : #'*MUDClient' }
RubScrolledTextMorph >> adjustScrollbars [
	self scrollPane
		vScrollbarValue: 1;
		updateScrollbars.
]

{ #category : #'*MUDClient' }
RubScrolledTextMorph >> beReadOnly [
	self scrollPane textArea readOnly: true
]

{ #category : #'*MUDClient' }
RubScrolledTextMorph >> manageLayoutInBounds: aRectangle [
	| myBounds |
	myBounds := aRectangle.
	self horizontalRulers do: [ :r | myBounds := r manageLayoutInBounds: myBounds ].
	self verticalRulers do: [ :r | myBounds := r manageLayoutInBounds: myBounds ].
	self overRulers do: [ :r | myBounds := r manageLayoutInBounds: myBounds ].
	self scrollPane ifNotNil: [ :scrollpane |
		[ 	scrollpane position: myBounds topLeft.
			scrollpane extent: (myBounds extent max: 0@0) ]
		on: Error do: [ :e | ('RubScrolledTextMorph>>manageLayoutInBounds: ERROR: ', e messageText) crLog ] ].
	^ myBounds
]
