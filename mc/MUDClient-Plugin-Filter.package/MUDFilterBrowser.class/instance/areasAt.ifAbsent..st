private
areasAt: aFilter ifAbsent: aBlock 
	^ areaMorphs 
		at: aFilter 
		ifAbsent: aBlock