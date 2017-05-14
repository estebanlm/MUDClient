private
recalculatePlanets
	points removeAll: (points select: [ :each | 
		each origin: LOTJStarMapPoint internalOrigin ]).
	points addAll: self buildPlanets.
	^ points 