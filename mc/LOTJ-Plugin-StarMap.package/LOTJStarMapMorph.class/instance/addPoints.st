accessing
addPoints
	self removeAllMorphs.
	self starMap points do: [ :each | 
		self addMorphBack: (each asMorph
			position: (self sectorToPosition: each sector);
			extent: self sectorSize asPoint;
			yourself) ]