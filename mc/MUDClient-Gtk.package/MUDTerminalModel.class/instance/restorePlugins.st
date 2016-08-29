private
restorePlugins
	(MUDBrowserSettings findByGame: self game)
		select: [ :each | each isRemembered  ] 
		thenDo: [ :each | each restoreOn: self ]