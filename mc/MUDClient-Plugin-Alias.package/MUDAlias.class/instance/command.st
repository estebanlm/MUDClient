private
command 
	^ command ifNil: [ self class parseCommand: self input ]