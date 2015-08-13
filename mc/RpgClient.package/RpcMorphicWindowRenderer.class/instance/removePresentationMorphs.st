private
removePresentationMorphs
	window toolbarMorph ifNotNil: [ :morph | window removeMorph: morph ].
	window removeMorph: window contentMorph