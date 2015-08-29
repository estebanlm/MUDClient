tests
testFromSymbol 
	self assert: #top asPluginPosition == MUDPluginPosition top.
	self assert: #bottom asPluginPosition == MUDPluginPosition bottom.
	self assert: #left asPluginPosition == MUDPluginPosition left.
	self assert: #right asPluginPosition == MUDPluginPosition right.
	self assert: #none asPluginPosition == MUDPluginPosition none