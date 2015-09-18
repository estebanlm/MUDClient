private
areasAt: aFilter ifAbsentPut: aBlock 
	^ areaMorphs 
		at: aFilter 
		ifAbsentPut: aBlock