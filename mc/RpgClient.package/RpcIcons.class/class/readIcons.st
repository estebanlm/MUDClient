utils
readIcons 
	self uniqueInstance 
		readIconMethodsFromDirectory: 'repository/icons' asFileReference;
		initialize.