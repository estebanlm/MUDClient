private
nodesSorted: aCollection
	^ aCollection sorted: [ :a :b | a title < b title ]		