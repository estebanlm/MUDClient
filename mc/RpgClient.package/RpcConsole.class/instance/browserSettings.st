private
browserSettings
	^ RpcBrowserSettings 
		findBy: [ :each | each browserClass = self class ] 
		ifAbsent: [ (RpcConsoleBrowserSettings browserClass: self class) save ]