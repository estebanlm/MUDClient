building
buildCurrentObjectOn: a
	a tkMagritte 
		title: [ :object | object name ];
		onAnswer: [ :v :presenter | 
			self accepted: v.
			presenter pane browser update ]