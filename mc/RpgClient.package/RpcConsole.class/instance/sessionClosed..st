private
sessionClosed: ann
	window ifNotNil: [ window disable ].
	session := nil.
	self logInfo: 'Connection closed.'