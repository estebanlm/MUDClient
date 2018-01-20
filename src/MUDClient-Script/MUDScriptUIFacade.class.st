"
I'm a façade to provide access to UI elements.
"
Class {
	#name : #MUDScriptUIFacade,
	#superclass : #MUDScriptFacade,
	#category : #'MUDClient-Script-Model'
}

{ #category : #api }
MUDScriptUIFacade >> choose: titleString from: anArray [
	^ UIManager default 
		chooseFrom: anArray 
		values: anArray
		title: titleString

]

{ #category : #actions }
MUDScriptUIFacade >> echo: aString [
	self echoTitle: 'Script' message: aString
]

{ #category : #actions }
MUDScriptUIFacade >> echoDesktop: aString [
	self echoDesktopTitle: 'Script' message: aString		
]

{ #category : #actions }
MUDScriptUIFacade >> echoDesktopTitle: titleString message: aString [	
	MUDAlertDesktop current
		alertTitle: titleString 
		message: aString
]

{ #category : #actions }
MUDScriptUIFacade >> echoTitle: titleString message: aString [
	^ self echoTitle: titleString message: aString color: Color gray 
]

{ #category : #actions }
MUDScriptUIFacade >> echoTitle: titleString message: aString color: aColor [
	self terminal alert alertTitle: titleString contents: aString color: aColor
]

{ #category : #api }
MUDScriptUIFacade >> request: title [
	^ UIManager default request: title
]

{ #category : #api }
MUDScriptUIFacade >> requestText: aString [
	^ UIManager default
		multiLineRequest: aString
		initialAnswer: ''
		answerHeight: 350
]
