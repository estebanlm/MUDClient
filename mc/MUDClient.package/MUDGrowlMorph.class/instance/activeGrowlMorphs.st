private
activeGrowlMorphs
	^ self owner submorphs select: [ :morph | morph isKindOf: GrowlMorph ].