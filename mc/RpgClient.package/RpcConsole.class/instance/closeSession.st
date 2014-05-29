private
closeSession
	session ifNotNil: [ session close ].
	