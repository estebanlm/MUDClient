external projects
voyage: spec
	spec
		baseline: 'Voyage' with: [ 
			spec 
				className: 'BaselineOfVoyageMongo';
				repository: 'github://estebanlm/voyage:master/mc' ];
		import: 'Voyage'