private
removePresentationMorphs
	window ifNil: [ ^ self ].
	window toolbarMorph ifNotNil: [ :morph | window removeMorph: morph ].
	window removeMorph: window contentMorph