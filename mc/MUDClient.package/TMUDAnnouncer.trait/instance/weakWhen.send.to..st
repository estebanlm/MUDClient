announcing
weakWhen: anAnnoucement send: aSelector to: anObject
	self announcer weak 	
		when: anAnnoucement 
		send: aSelector 
		to: anObject 	