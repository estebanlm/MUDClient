private
protocolAt: protocolCommand ifPresent: aBlock 
	^ self protocols 
		at: protocolCommand 
		ifPresent: aBlock