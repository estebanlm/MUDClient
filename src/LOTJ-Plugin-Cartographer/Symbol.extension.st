Extension { #name : #Symbol }

{ #category : #'*LOTJ-Plugin-Cartographer' }
Symbol >> asDirection [
	^ LOTJCartographerDirection findByName: self
]
