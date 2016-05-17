external projects
voyage: spec
	spec
		baseline: 'Voyage' with: [ 
			spec 
				className: 'BaselineOfVoyageMongo';
				repository: 'gitfiletree://github.com/estebanlm/voyage:master/mc' ];
		import: 'Voyage'