accessing
alert 
	self error: 'TODO'
	"^ alert ifNil: [ alert := MUDAlertManager for: self textArea ]"