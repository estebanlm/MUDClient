external projects
petitParser: spec
	spec project: 'PetitParser' with: [
		spec 
			repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main';
			className: 'ConfigurationOfPetitParser';
			loads: #('Core' 'Tests' 'PetitXml' 'PetitJson' 'PetitXPath') ].