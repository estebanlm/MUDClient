private
availableSoundsWithLabels
	^ Sounds ifNil: [ Sounds := self loadSoundsWithLabels ]