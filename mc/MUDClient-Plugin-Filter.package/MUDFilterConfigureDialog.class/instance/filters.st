accessing
filters
	^ self plugin filters 
		select: [ :each | each class = self filterClass ]