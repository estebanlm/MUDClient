"
I'm a generic alert manager to show alerts on desktop. 
My children should implement concrete ways for each platform.

see #alertTitle:message:
"
Class {
	#name : #MUDAlertDesktop,
	#superclass : #Object,
	#category : #'MUDClient-View-Alert'
}

{ #category : #accessing }
MUDAlertDesktop class >> current [
	^ (self allSubclasses 
		detect: #isActive
		ifNone: [ MUDNullAlertDesktop ])
		new
]

{ #category : #testing }
MUDAlertDesktop class >> isActive [
	^ false
]

{ #category : #actions }
MUDAlertDesktop >> alertTitle: titleString message: aString [
	self subclassResponsibility
]
