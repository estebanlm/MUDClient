private
createPanel
	| newPanel |
	
	newPanel := LOTJCombatBarPanelMorph new.
	newPanel enemyLabel model: self; getTextSelector: #OPPONENTNAME.
	newPanel enemyBar model: self; getValueSelector: #OPPONENTHEALTH.
	newPanel characterLabel model: self; getTextSelector: #CHARACTERNAME.
	newPanel healthBar model: self; getValueSelector: #HEALTH; getMaxSelector: #HEALTHMAX.
	newPanel movementBar model: self; getValueSelector: #MOVEMENT; getMaxSelector: #MOVEMENTMAX.
	newPanel forceBar model: self; getValueSelector: #MANA; getMaxSelector: #MANAMAX.
	
	^ newPanel