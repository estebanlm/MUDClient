"
I'm the center of client. 
I keep all related/necesary data.
"
Class {
	#name : #MUDApplication,
	#superclass : #VOMemoryRepository,
	#category : 'MUDClient-Model'
}

{ #category : #'class initialization' }
MUDApplication class >> initialize [ 
	Smalltalk addToStartUpList: self.
	Smalltalk addToShutDownList: self	
]

{ #category : #actions }
MUDApplication class >> install [ 
	self setRepository: self new
]

{ #category : #private }
MUDApplication class >> repositoryFileName [
	^ 'games.dat' asFileReference
]

{ #category : #accessing }
MUDApplication class >> reset [
	self setRepository: nil
]

{ #category : #private }
MUDApplication class >> restoreFromDisk [
	| fileReference |
	
	fileReference := self repositoryFileName.
	fileReference exists 
		ifTrue: [ self setRepository: (FLMaterializer materializeFromFileNamed: fileReference fullName) ]
		ifFalse: [ self install ].

]

{ #category : #private }
MUDApplication class >> saveToDisk [
	| fileReference |
	
	fileReference := self repositoryFileName.
	fileReference ensureDelete.
	FLSerializer 
		serialize: self current
		toFileNamed: fileReference fullName
]

{ #category : #'system startup' }
MUDApplication class >> shutDown: quitting [
	quitting ifFalse: [ ^ self ].
	self saveToDisk.
	self reset.
]

{ #category : #'system startup' }
MUDApplication class >> startUp: resuming [
	resuming ifFalse: [ ^ self ].
	self restoreFromDisk.
]