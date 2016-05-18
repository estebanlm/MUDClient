private
areaAt: aFilter ifAbsentPut: aBlock 
	^ areaMorphs 
		at: aFilter 
		ifAbsentPut: aBlock