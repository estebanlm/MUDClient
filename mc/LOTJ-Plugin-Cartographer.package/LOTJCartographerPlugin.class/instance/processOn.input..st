command processing
processOn: aTerminal input: aString
	"Chekc if 'direction' command: 
	n, s, e, o, ne, nw, se, sw, u, d"
	LOTJCartographerDirection all
		detect: [ :each | each matches: aString ]
		ifFound: [ :each | self recordDirection: each ]