private
keyBindingFor: index
	^ self modifier 
		ifNotNil: [ self modifier + (self class characterBindingAt: index) ]