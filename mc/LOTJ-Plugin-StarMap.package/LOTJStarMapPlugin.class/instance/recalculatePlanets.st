private
recalculatePlanets
	points removeAll: (points select: [ :each | 
		each origin: LOTJStarMapSystemPoint internalOrigin ]).
	points addAll: self buildPlanets.
	^ points 