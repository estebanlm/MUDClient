inspecting
gtInspectorMapIn: composite
	<gtInspectorPresentationOrder: 50> 

	^ composite morph
		title: 'Map';
		display: [ 
			LOTJCartographerMapMorph new
				layoutPolicy: ProportionalLayout new;
				hResizing: #spaceFill;
				vResizing: #spaceFill;
				room: self;
				yourself ]