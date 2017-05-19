private
newInternalSystems: aCollection
	self removeAllOrigin: LOTJStarMapPoint internalOrigin.
	aCollection do: [ :each | 
		each origin: LOTJStarMapPoint internalOrigin.
		self addPoint: each ].
	^ points 