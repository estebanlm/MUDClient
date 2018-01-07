"
I'm a NULL alert desktop. 
I'm the default behaviour when no alert for platform is found. 
I just send a message to the world inform mechanism.
"
Class {
	#name : #MUDNullAlertDesktop,
	#superclass : #MUDAlertDesktop,
	#category : #'MUDClient-View-Alert'
}

{ #category : #actions }
MUDNullAlertDesktop >> alertTitle: titleString message: aString [
	GrowlMorph 
		openWithLabel: titleString 
		contents: aString
]
