"
I'm a notepad.
"
Class {
	#name : #MUDNotepadBrowser,
	#superclass : #MUDPluginBrowser,
	#instVars : [
		'notepad'
	],
	#category : 'MUDClient-Plugin-Notepad-View'
}

{ #category : #accessing }
MUDNotepadBrowser class >> title [ 
	^ 'Notepad'
]

{ #category : #actions }
MUDNotepadBrowser >> addFolderTo: aNode [
	| title newFolder |
	title := UIManager default request: 'New folder title'.
	title ifNil: [ ^ false ].
	newFolder := MUDNoteGroup title: title.
	self addNode: newFolder to: aNode.
	^ newFolder
]

{ #category : #private }
MUDNotepadBrowser >> addNode: aNode to: parentNode [		
	(parentNode ifNil: [ self notepad root ]) add: aNode	
]

{ #category : #actions }
MUDNotepadBrowser >> addNoteTo: aNode [
	| title newNote |
	title := UIManager default request: 'New note title'.
	title ifNil: [ ^ nil ].
	newNote := MUDNote title: title.
	self addNode: newNote to: aNode.
	^ newNote
]

{ #category : #building }
MUDNotepadBrowser >> addNotesMenuOn: aPresenter [
	aPresenter 
		act: [ :presenter | 
			(self addNoteTo: nil) ifNotNil: [ :newNote | 
				presenter update.
				presenter selection: newNote ] ] 
			icon: #new asMUDIcon 
			entitled: 'Add note...';
		act: [ :presenter | 
			(self addFolderTo: nil) ifNotNil: [ :newFolder | 
				presenter update.
				presenter selection: newFolder ] ] 
			icon: #newFolder asMUDIcon 
			entitled: 'Add folder...';
		selectionAct: [ :presenter | 
			(self addNoteTo: presenter selection closestGroup) ifNotNil: [ :newNote |
				presenter update.
				presenter selection: newNote ] ] 
			entitled: 'Add note...';
		selectionAct: [ :presenter | 
			(self addFolderTo: presenter selection closestGroup) ifNotNil: [ :newFolder | 
				presenter update.
				presenter selection: newFolder ] ] 
			entitled: 'Add folder...';
		selectionAct: [ :presenter |
			(self renameNode: presenter selection) ifTrue: [ presenter update ] ] 
			entitled: 'Rename..';
		selectionAct: [ :presenter |
			(self removeNode: presenter selection) ifTrue: [ presenter update ] ] 
			entitled: 'Remove'
]

{ #category : #building }
MUDNotepadBrowser >> buildAreaMorphFor: aNote [
	| morph |
	
	morph := RubScrolledTextModel new 
		text: (aNote contents ifNil: [ '' ]);
		newScrolledText.
	morph
		textFont: MUDFonts terminalFont;
		textColor: Smalltalk ui theme textColor;
		backgroundColor: Smalltalk ui theme backgroundColor;
		autoAccept: true";
		beWrapped	".

	morph announcer 
		when: RubTextAccepted do: [ :ann | aNote contents: ann text asString ].
			
	^ morph
]

{ #category : #building }
MUDNotepadBrowser >> buildOn: browser [ 
	
	browser
		column: #notes;
		column: #note span: 3.
		
	browser transmit 
		to: #notes;
		andShow: [ :a | 
			a tree
				title: 'Notes';
				in: [ :presenter |  self addNotesMenuOn: presenter ];
				display: [ self roots ];
				format: #title;
				children: [ :node |
					node isGroup 
						ifTrue: [ self childrenOf: node ]
						ifFalse: [ #() ] ] ].

	browser transmit 
		to: #note;
		from: #notes;
		when: [ :node | node notNil and: [ node isGroup ] ];
		andShow: [ :a | 
			a list
				display: [ :node | node children ];
				format: #title ].

	browser transmit 
		to: #note;
		from: #notes;
		when: [ :node | node notNil and: [ node isGroup not ] ];
		andShow: [ :a | a 
			morph 
				title: [ :node | node title ];
				morph: [ :presenter :note | self buildAreaMorphFor: note ] ]
]

{ #category : #accessing }
MUDNotepadBrowser >> childrenOf: aNode [ 
	^ self nodesSorted: aNode children
]

{ #category : #private }
MUDNotepadBrowser >> nodesSorted: aCollection [
	^ aCollection sorted: [ :a :b | a title < b title ]		
]

{ #category : #accessing }
MUDNotepadBrowser >> notepad [
	^ self plugin
]

{ #category : #actions }
MUDNotepadBrowser >> removeNode: aNode [
	(UIManager default confirm: ('Are you sure you want to remove {1}' format: { aNode title }))
		ifFalse: [ ^ false ].
	aNode remove.	
	^ true
]

{ #category : #actions }
MUDNotepadBrowser >> renameNode: aNode [
	| title | 
	
	title := (UIManager default 
		request: 'New title'
		initialAnswer: aNode title)
		trimBoth.
	(title isEmpty or: [ title = aNode title ]) ifTrue: [ ^ false ].
	aNode 
		title: title;
		save.
	^ true
]

{ #category : #accessing }
MUDNotepadBrowser >> roots [ 
	^ self nodesSorted: self notepad root children
]
