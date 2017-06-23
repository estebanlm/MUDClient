private
internalSelect: aRoom
	"self selected: aRoom."
	self update.
	selectionBlock ifNotNil: [ selectionBlock value: aRoom ]