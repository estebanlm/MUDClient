factory
createObjects
	^ self buttonPad pads collect: [ :each | RpcPadView pad: each ]