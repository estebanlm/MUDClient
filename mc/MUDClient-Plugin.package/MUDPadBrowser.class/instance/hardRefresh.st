showing
hardRefresh
	| newBounds |
	self calculatePreferredExtent.
	newBounds := window bounds withHeight: self preferredExtent y.
	self browserSettings bounds: newBounds.
	super hardRefresh.
	window bounds: newBounds.