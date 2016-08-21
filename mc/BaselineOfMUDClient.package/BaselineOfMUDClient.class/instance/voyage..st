external projects
voyage: spec
	spec
		baseline: 'Voyage' with: [ 
			spec 
				loads: 'memory';
				repository: 'github://estebanlm/voyage/mc' ];
		import: 'Voyage'