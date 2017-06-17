private
togglePanelVisibilityOn: aTerminal
	self OPPONENTNAME isEmptyOrNil 
		ifTrue: [ 
			CombatBarPanel ifNotNil: [ 
				aTerminal areaMorph removeMorph: CombatBarPanel.
				CombatBarPanel := nil ].
			^ self ].
	
	CombatBarPanel ifNotNil: [ ^ self ]. "Do not add it double"
	CombatBarPanel := self createPanel.
	aTerminal areaMorph addMorph: CombatBarPanel position: #bottomRight.
	