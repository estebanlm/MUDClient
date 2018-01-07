"
I show alerts (notifications) using the macOS notification center.
"
Class {
	#name : #MUDMacOSAlertDesktop,
	#superclass : #MUDAlertDesktop,
	#category : #'MUDClient-View-Alert'
}

{ #category : #testing }
MUDMacOSAlertDesktop class >> isActive [
	^ OSPlatform current isMacOS
]

{ #category : #actions }
MUDMacOSAlertDesktop >> alertTitle: titleString message: aString [
	| notification title message |
	
	title := titleString asNSString autorelease.
	message := aString asNSString autorelease.
	notification := #NSUserNotification inObjC alloc init autorelease.
	notification 
		setTitle: title;
		setInformativeText: message.
	#NSUserNotificationCenter inObjC defaultUserNotificationCenter
 		deliverNotification: notification.
]
