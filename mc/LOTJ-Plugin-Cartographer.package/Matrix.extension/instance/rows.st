*LOTJ-Plugin-Cartographer
rows 
	| rows |
	rows := (Array new: self numberOfRows) writeStream.
	self rowsDo: [ :eachRow | rows nextPut: eachRow ].
	^ rows contents