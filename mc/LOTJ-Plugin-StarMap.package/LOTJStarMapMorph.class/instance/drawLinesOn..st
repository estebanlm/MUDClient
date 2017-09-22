drawing
drawLinesOn: aCanvas
	lines ifNil: [ ^ self ].
	lines do: [ :each | 
		each  ]