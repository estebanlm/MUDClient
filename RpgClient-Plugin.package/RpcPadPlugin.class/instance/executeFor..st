execute
executeFor: aClient 
	| buttonpad |

	buttonpad := aClient activeGame buttonpad.
	self openPadBrowserFor: buttonpad addNew.