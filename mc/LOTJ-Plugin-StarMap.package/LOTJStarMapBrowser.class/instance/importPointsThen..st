actions
importPointsThen: aBlock
	| builder |

	builder := (TkMagritteEditor object: LOTJStarMapPlanetBuilder new) go.
	builder ifNil: [ ^ self ].

	self plugin newInternalSystems: builder build.
	aBlock value