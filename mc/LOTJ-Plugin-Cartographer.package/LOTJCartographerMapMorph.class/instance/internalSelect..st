private
internalSelect: aRoom
	"self selected: aRoom."
	"self update."
	selectedRoom := aRoom.
	selectionBlock ifNotNil: [ selectionBlock value: aRoom ]