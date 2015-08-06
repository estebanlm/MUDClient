accessing
petitParser: spec

	spec repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main'.

	spec project: 'PetitParser-Base' with: [
		spec 
			repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main';
			className: 'ConfigurationOfPetitParser';
			loads: #('Core' 'Tests') ].
		
	spec 
		package: 'PetitXml' with: [ spec requires: 'PetitParser-Base' ];
		package: 'PetitJson' with: [ spec requires: 'PetitParser-Base' ];
		package: 'PetitXPath' with: [ spec requires: 'PetitParser-Base' ].
		
	spec group: 'PetitParser' with: #('PetitParser-Base' 'PetitXml' 'PetitJson' 'PetitXPath')