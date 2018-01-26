"
I'm a façade to provide access to UI elements.
"
Class {
	#name : #MUDScriptUIFacade,
	#superclass : #MUDScriptFacade,
	#category : #'MUDClient-Script-Model'
}

{ #category : #'api displaying' }
MUDScriptUIFacade >> alert: aString [
	self alertTitle: 'Script' message: aString
]

{ #category : #'api displaying' }
MUDScriptUIFacade >> alertDesktop: aString [
	self alertDesktopTitle: 'Script' message: aString		
]

{ #category : #'api displaying' }
MUDScriptUIFacade >> alertDesktopTitle: titleString message: aString [	
	MUDAlertDesktop current
		alertTitle: titleString 
		message: aString
]

{ #category : #'api displaying' }
MUDScriptUIFacade >> alertTitle: titleString message: aString [
	^ self alertTitle: titleString message: aString color: Color gray 
]

{ #category : #'api displaying' }
MUDScriptUIFacade >> alertTitle: titleString message: aString color: aColor [
	self terminal alert alertTitle: titleString contents: aString color: aColor
]

{ #category : #'api requesting' }
MUDScriptUIFacade >> choose: titleString from: anArray [
	^ UIManager default 
		chooseFrom: anArray 
		values: anArray
		title: titleString

]

{ #category : #'api displaying' }
MUDScriptUIFacade >> echo: aString [
	"Shows a message in the terminal"
	self terminal appendData: (aString withLineEndings: String lf), String lf
]

{ #category : #'api requesting' }
MUDScriptUIFacade >> request: title [
	^ UIManager default request: title
]

{ #category : #'api requesting' }
MUDScriptUIFacade >> requestText: aString [
	^ UIManager default
		multiLineRequest: aString
		initialAnswer: ''
		answerHeight: 350
]
