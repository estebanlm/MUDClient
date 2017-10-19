Class {
	#name : #MUDRedirectFilter,
	#superclass : #MUDFilter,
	#instVars : [
		'echo',
		'echoDesktop',
		'decoration'
	],
	#category : 'MUDClient-Plugin-Filter-Model'
}

{ #category : #accessing }
MUDRedirectFilter class >> availableDecorations [
	^ MUDFilterDecoration allSubclasses collect: #uniqueInstance
]

{ #category : #accessing }
MUDRedirectFilter class >> label [
	^ 'Filters'
]

{ #category : #private }
MUDRedirectFilter >> applyFilterOn: aPlugin pattern: aPattern to: aStream line: aLine in: aTerminal [  
	^ aPlugin applyRedirectFilter: self pattern: aPattern to: aStream line: aLine in: aTerminal
	
]

{ #category : #accessing }
MUDRedirectFilter >> decoration [
	^ decoration ifNil: [ decoration := MUDFilterNullDecoration uniqueInstance ]
]

{ #category : #accessing }
MUDRedirectFilter >> decoration: anObject [
	decoration := anObject
]

{ #category : #descriptions }
MUDRedirectFilter >> descriptionDecoration [
	<magritteDescription>
	
	^ MASingleOptionDescription new
		priority: 120;
		label: 'Decoration';
		accessor: #decoration;
		options: self class availableDecorations;
		reference: (MAStringDescription new accessor: #name; asContainer); 
		morphClass: MADropListMorph;
		yourself
]

{ #category : #descriptions }
MUDRedirectFilter >> descriptionEcho [
	<magritteDescription>
	
	^ MABooleanDescription new 
		priority: 100;
		label: 'Echo';
		accessor: (MAPluggableAccessor 
			read: [ :filter | filter isEcho ]
			write: [ :filter :value | filter echo: value ]);
		yourself
]

{ #category : #descriptions }
MUDRedirectFilter >> descriptionEchoDesktop [
	<magritteDescription>
	
	^ MABooleanDescription new 
		priority: 110;
		label: 'Echo Desktop';
		accessor: (MAPluggableAccessor 
			read: [ :filter | filter isEchoDesktop ]
			write: [ :filter :value | filter echoDesktop: value ]);
		yourself
]

{ #category : #accessing }
MUDRedirectFilter >> echo: anObject [
	echo := anObject
]

{ #category : #accessing }
MUDRedirectFilter >> echoDesktop: anObject [
	echoDesktop := anObject
]

{ #category : #initialization }
MUDRedirectFilter >> initialize [
	super initialize. 
	self echo: false.
	
]

{ #category : #testing }
MUDRedirectFilter >> isEcho [
	^ echo ifNil: [ echo := false ]
]

{ #category : #testing }
MUDRedirectFilter >> isEchoDesktop [
	^ echoDesktop ifNil: [ echoDesktop := false ]
]

{ #category : #testing }
MUDRedirectFilter >> isRedirect [
	^ true
]

{ #category : #testing }
MUDRedirectFilter >> isTimestamp [
	^ timestamp ifNil: [ timestamp := false ]
]

{ #category : #accessing }
MUDRedirectFilter >> send: aString toWindows: aCollection [ 
	^ super 
		send: (self decoration decorate: aString)
		toWindows: aCollection
]
