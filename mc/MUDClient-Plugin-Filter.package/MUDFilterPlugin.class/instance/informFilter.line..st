private
informFilter: aFilter line: aLine
	"show to desktop"
	| notification title message |
	
	self flag: #todo. "Make it work on linux/windows"
	Smalltalk os isMacOS ifFalse: [ ^ self ].

	title := aFilter name asNSString autorelease.
	message := aLine cleanLine asNSString autorelease.
	notification := #NSUserNotification inObjectiveC alloc init autorelease.
	notification 
		setTitle: title;
		setInformativeText: message.
	#NSUserNotificationCenter inObjectiveC defaultUserNotificationCenter
 		deliverNotification: notification.