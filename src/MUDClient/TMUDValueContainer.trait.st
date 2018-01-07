Trait {
	#name : #TMUDValueContainer,
	#category : #'MUDClient-Model'
}

{ #category : #accessing }
TMUDValueContainer >> valueAt: aKey [
	^ self values at: aKey
]

{ #category : #accessing }
TMUDValueContainer >> valueAt: aKey ifAbsent: absentBlock [
	^ self values 
		at: aKey
		ifAbsent: absentBlock
]

{ #category : #accessing }
TMUDValueContainer >> valueAt: aKey ifPresent: presentBlock ifAbsent: absentBlock [
	^ self values 
		at: aKey
		ifPresent: presentBlock
		ifAbsent: absentBlock
]

{ #category : #accessing }
TMUDValueContainer >> valueAt: keyString put: anObject [
	^ self values 
		at: keyString asSymbol
		put: anObject
]

{ #category : #accessing }
TMUDValueContainer >> values [
	^ self required
]
