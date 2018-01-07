Class {
	#name : #MUDScriptUIFacade,
	#superclass : #Object,
	#instVars : [
		'terminal'
	],
	#category : #MUDClient-Script
}

{ #category : #'instance creation' }
MUDScriptUIFacade class >> for: aTerminal [
	^ self new terminal: aTerminal
]

{ #category : #actions }
MUDScriptUIFacade >> echo: aString [
	self echoTitle: 'Script' message: aString.
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

{ #category : #accessing }
MUDScriptUIFacade >> terminal [
	^ terminal
]

{ #category : #accessing }
MUDScriptUIFacade >> terminal: anObject [
	terminal := anObject
]
