updating
createGamePresenter
	^ MUDGame new asPresenter 
		addButtons: {
			MarsButtonPresenter label: 'Accept' icon: #accept asMUDIcon action: [ :this | this save ]. 
			MarsButtonPresenter label: 'Cancel' icon: #cancel asMUDIcon action: [ :this | this cancel ].
		};
		onAnswer: [ :v | v ifNotNil: [ self updateListBox ] ];
		yourself