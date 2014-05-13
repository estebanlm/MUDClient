accessing
petitParser: spec

	spec repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main'.

	spec project: 'PetitParser-Base' with: [
		spec 
			repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main';
			className: 'ConfigurationOfPetitParser';
			version: 'minimal';
			loads: #('Core') ].
		
	spec 
		package: 'PetitXml';
		package: 'PetitJson';
		package: 'PetitXPath'.
		
	spec group: 'PetitParser' with: #('PetitParser-Base' 'PetitXml' 'PetitJson' 'PetitXPath')