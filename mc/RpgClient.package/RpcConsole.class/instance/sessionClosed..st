private
sessionClosed: ann
	window disable.
	session := nil.
	self logInfo: 'Connection closed.'