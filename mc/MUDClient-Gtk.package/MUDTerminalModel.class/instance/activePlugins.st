private
activePlugins
	^ self game plugins 
		select: [ :each | each isActiveOn: self ]