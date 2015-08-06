accessing
root
	^ root ifNil: [ root := RpcNoteGroup title: 'Root' ]