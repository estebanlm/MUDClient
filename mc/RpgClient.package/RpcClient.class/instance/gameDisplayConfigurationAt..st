private
gameDisplayConfigurationAt: aGame
	^ self gameDisplayConfigurations
		at: aGame
		ifAbsentPut: [ RpcGameDisplayConfiguration new ]