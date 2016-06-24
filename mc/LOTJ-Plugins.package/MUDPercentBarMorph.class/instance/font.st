accessing
font
	^ font ifNil: [ UITheme current textFont ]