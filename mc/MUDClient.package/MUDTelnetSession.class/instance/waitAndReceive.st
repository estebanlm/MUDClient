waiting
waitAndReceive
	| received |

	received := self readWaitingWithANSIComplete.	
	received ifEmpty: [ ^ self ].
	self announce: (MUDDataReceived data: received)