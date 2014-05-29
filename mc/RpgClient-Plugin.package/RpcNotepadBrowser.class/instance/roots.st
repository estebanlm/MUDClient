accessing
roots 
	^ self notepad root children
		sorted: [ :a :b | a name < b name ]