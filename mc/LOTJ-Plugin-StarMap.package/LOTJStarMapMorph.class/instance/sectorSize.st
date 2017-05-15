accessing
sectorSize
	^ sectorSize ifNil: [ sectorSize := self class sectorSize ]