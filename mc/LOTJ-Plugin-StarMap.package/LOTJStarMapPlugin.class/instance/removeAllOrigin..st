private
removeAllOrigin: aSymbol
	self points removeAll: (self points select: [ :each | each origin = aSymbol ])