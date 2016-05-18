private
areaAt: aFilter ifAbsent: aBlock 
	^ areaMorphs 
		at: aFilter 
		ifAbsent: aBlock