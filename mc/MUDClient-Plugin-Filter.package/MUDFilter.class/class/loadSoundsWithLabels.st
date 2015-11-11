private
loadSoundsWithLabels
	^ OrderedDictionary newFromPairs: { 
		'Bass'. self bass1.
		'Flute 1'. self flute1.
		'Flute 2'. self flute2.
		'Flute 3'. self flute3 }