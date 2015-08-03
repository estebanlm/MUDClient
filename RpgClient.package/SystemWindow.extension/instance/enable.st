*RpgClient
enable 
	"Assumes that frst morph is a disabling morph and removes it"
	self isEnabled ifTrue: [ ^ self ].
	self submorphs first delete
	"self withAllSubmorphsDo: [ :each | each enabled: true ]"