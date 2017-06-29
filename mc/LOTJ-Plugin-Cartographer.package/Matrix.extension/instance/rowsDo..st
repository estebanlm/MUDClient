*LOTJ-Plugin-Cartographer
rowsDo: aBlock
	1 to: self numberOfRows do: [ :index | 
		aBlock value: (self atRow: index) ]