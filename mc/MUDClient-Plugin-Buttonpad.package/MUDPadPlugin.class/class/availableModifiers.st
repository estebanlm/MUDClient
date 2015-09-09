accessing
availableModifiers
	"Modifiers available to pads. 
	 This actually restricts pads to 4, but for now it will work"
	^ { 
	KMModifier alt.
	KMModifier ctrl.
	KMModifier shift + KMModifier alt.
	KMModifier shift + KMModifier ctrl.
	KMModifier command.
	KMModifier shift + KMModifier command.
	}