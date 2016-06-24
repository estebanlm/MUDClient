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
		66 -> Color green.
		40 -> Color yellow.
		20 -> Color orange.
		 0 -> Color red }