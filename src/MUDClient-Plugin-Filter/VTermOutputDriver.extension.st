Extension { #name : #VTermOutputDriver }

{ #category : #'*MUDClient-Plugin-Filter' }
VTermOutputDriver class >> rawOn: anOutputStream [
	^ self new
		outStream: anOutputStream;
		yourself
]
