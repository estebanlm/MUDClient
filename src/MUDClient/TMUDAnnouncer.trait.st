"
I define announcement common traits for objects who need it.
"
Trait {
	#name : #TMUDAnnouncer,
	#category : 'MUDClient-Model'
}

{ #category : #announcing }
TMUDAnnouncer >> announce: anAnnouncement [
	self announcer announce: anAnnouncement.
]

{ #category : #announcing }
TMUDAnnouncer >> announcer [ 
	^ self explicitRequirement
]

{ #category : #announcing }
TMUDAnnouncer >> weakWhen: anAnnoucement send: aSelector to: anObject [
	self announcer weak 	
		when: anAnnoucement 
		send: aSelector 
		to: anObject 	
]

{ #category : #announcing }
TMUDAnnouncer >> when: anAnnoucement do: anObject [ 
	self announcer 	
		when: anAnnoucement  
		do: anObject 
]

{ #category : #announcing }
TMUDAnnouncer >> when: anAnnoucement send: aSelector to: anObject [ 
	self announcer 	
		when: anAnnoucement 
		send: aSelector 
		to: anObject 
]
