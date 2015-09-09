accessing
root
	^ root ifNil: [ root := MUDNoteGroup title: 'Root' ]