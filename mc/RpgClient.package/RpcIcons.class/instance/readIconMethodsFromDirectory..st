utils
readIconMethodsFromDirectory: dir
	(dir entries 
		select: [ :each | 
			each isFile 
				and: [ 
					(each extension = 'gif') 
					or: [ each extension = 'png' ] ] ] )
		do: [ :each | 
			self storeIconContentsMethodFor: each.
			self storeIconMethodFor: each ]