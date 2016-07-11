private
parse: aString
	^ self parser 
		parse: aString
		onError: [ self keywords: { MUDAliasCommandKeyword value: aString } ]