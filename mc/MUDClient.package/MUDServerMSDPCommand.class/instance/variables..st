accessing
variables: anArrayOrString
	variables := anArrayOrString isString
		ifTrue: [ { anArrayOrString } ]
		ifFalse: [ anArrayOrString ]