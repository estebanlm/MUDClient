tests
testFromSymbol 
	self assert: #top asPluginPosition == RpcPluginPosition top.
	self assert: #bottom asPluginPosition == RpcPluginPosition bottom.
	self assert: #left asPluginPosition == RpcPluginPosition left.
	self assert: #right asPluginPosition == RpcPluginPosition right.
	self assert: #none asPluginPosition == RpcPluginPosition none