defaults
defaultColorPairs 
	"Default colors. 
	 This means: 
	 	up from 66: color green,
		up from 50: color yellow, 
		up from 25: color orange,
		up from  0: color red
	"
	^ { 
		65 -> Color green.
		45 -> Color yellow.
		30 -> Color orange.
		 0 -> Color red }