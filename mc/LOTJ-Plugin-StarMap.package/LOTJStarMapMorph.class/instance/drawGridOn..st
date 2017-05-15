drawing
drawGridOn: aCanvas
	| separation gridExtent expandedGridExtent current |
	
	separation := self sectorSize. 	
	gridExtent := self regionRectangle extent.
	expandedGridExtent := gridExtent * separation.
	
	"horizontal"
	current := self left.
	0 to: gridExtent x do: [ :index |
		aCanvas 
			line:  current @ self top
			to: current @ (self top + expandedGridExtent y)
			width: 1 
			color: self gridColor.
		current := current + separation ].
	
	"vertical"
	current := self top.
	0 to: gridExtent y do: [ :index |
		aCanvas 
			line:  self left @ current
			to: (self left + expandedGridExtent x) @ current
			width: 1 
			color: self gridColor.
		current := current + separation ]