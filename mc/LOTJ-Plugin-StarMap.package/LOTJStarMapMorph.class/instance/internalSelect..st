private
internalSelect: aPoint
	self selected: aPoint.
	self update.
	selectionBlock ifNotNil: [ selectionBlock value: aPoint ]