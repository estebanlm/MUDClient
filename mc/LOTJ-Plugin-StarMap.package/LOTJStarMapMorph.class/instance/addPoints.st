accessing
addPoints
	self removeAllMorphs.
	self starMap points do: [ :each | 
		self addMorphBack: ((LOTJStarMapPointMorph point: each)
			position: (self locationToPosition: each sector);
			extent: self sectorSize asPoint;
			yourself) ]