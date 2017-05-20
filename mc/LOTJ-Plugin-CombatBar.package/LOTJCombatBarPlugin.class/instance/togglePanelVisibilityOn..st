private
togglePanelVisibilityOn: aTerminal
	self OPPONENTNAME isEmptyOrNil 
		ifTrue: [ 
			CombatBarPanel ifNotNil: [ 
				aTerminal textArea removeMorph: CombatBarPanel.
				CombatBarPanel := nil ].
			^ self ].
	
	CombatBarPanel ifNotNil: [ ^ self ]. "Do not add it double"
	CombatBarPanel := self createPanel.
	aTerminal textArea addMorph: CombatBarPanel position: #bottomRight.
	