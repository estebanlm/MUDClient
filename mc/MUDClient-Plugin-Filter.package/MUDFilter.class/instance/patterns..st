private
patterns: aCollection 
	patterns := aCollection.
	patterns do: [ :each | each filter: self ]