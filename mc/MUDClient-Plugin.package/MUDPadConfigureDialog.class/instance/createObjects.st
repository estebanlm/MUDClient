factory
createObjects
	^ self buttonPad pads collect: [ :each | MUDPadView pad: each ]