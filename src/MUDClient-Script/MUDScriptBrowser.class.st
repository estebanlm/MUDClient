Class {
	#name : #MUDScriptBrowser,
	#superclass : #MUDPluginBrowser,
	#category : #'MUDClient-Script-View'
}

{ #category : #actions }
MUDScriptBrowser >> addScriptThen: aBlock [
]

{ #category : #building }
MUDScriptBrowser >> addScriptsMenuOn: aPresenter [
	aPresenter 
		act: [ :presenter | 
				self addScriptThen: [ 
					presenter update ] ] 
			icon: #new asMUDIcon
			entitled: 'Add script...';
		selectionAct: [ :presenter | 
			self addScriptThen: [ :newNote |
				presenter update.
				presenter selection: newNote ] ] 
			entitled: 'Add script...';
		selectionAct: [ :presenter |
				self 
					renameScript: presenter selection 
					then: [ presenter update ] ] 
			entitled: 'Rename..';
		selectionAct: [ :presenter |
				self 
					removeScript: presenter selection 
					then: [ presenter update ] ] 
			entitled: 'Remove'
]

{ #category : #building }
MUDScriptBrowser >> buildOn: browser [
	
	browser
		column: #scripts;
		column: #script span: 3.
		
	browser transmit 
		to: #scripts;
		andShow: [ :a | 
			a fastList
				title: 'Scripts';
				in: [ :presenter | self addScriptsMenuOn: presenter ];
				display: [ self scripts ];
				format: #name ].

	browser transmit 
		from: #scripts;
		to: #script;
		andShow: [ :a | 
			a pharoMethod 
				title: #name;
				display: [ :script | script method ] ]
]

{ #category : #actions }
MUDScriptBrowser >> removeScript: aScript then: aBlock [
]

{ #category : #actions }
MUDScriptBrowser >> renameScript: aScript then: aBlock [
]

{ #category : #accessing }
MUDScriptBrowser >> scripts [
	^ self plugin scripts
]

{ #category : #accessing }
MUDScriptBrowser >> title [
	^ 'Scripts'
]
