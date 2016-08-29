private
postConnect
	"Execute actions after connect, if any"
	self game hasLoginSequence ifFalse: [ ^ self ].
	self send: self game loginSequence.