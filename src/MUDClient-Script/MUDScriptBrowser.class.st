"
I'm a script manager. 
An user can handle scripts, execute and control them from here.
"
Class {
	#name : #MUDScriptBrowser,
	#superclass : #MUDPluginBrowser,
	#category : #'MUDClient-Script-View'
}

{ #category : #accessing }
MUDScriptBrowser >> activeScripts [
	^ MUDScriptEvaluator activeScripts sorted: [ :a :b | a scriptName < b scriptName ]
]

{ #category : #building }
MUDScriptBrowser >> addMonitorMenuOn: aPresenter [
	aPresenter
		act: [ :p | 
			self killAllScripts.
			p update ] 
		icon: #delete asMUDIcon 
		entitled: 'Kill all'
]

{ #category : #building }
MUDScriptBrowser >> addScriptMenuOn: aPresenter [
	aPresenter 
		act: [ :presenter :script | self runScript: script ] 
			icon: #glamorousGo asIcon
			entitled: 'Run script'.

	aPresenter 
		selectionAct: [ :presenter :script | self runScript: script ] 
			icon: #glamorousGo asIcon
			entitled: 'Run script'.
	(self executionSelectionActions, 
	aPresenter browsingSelectionActions,
	aPresenter codeEditingSelectionActions)
	do: [ :each | aPresenter addSelectionAction: each ]
]

{ #category : #actions }
MUDScriptBrowser >> addScriptThen: aBlock [
	| name newScript |
	name := UIManager default request: 'New script name'.
	name ifNil: [ ^ nil ].
	newScript := MUDScript named: name.
	self plugin addScript: newScript.
	aBlock cull: newScript.
	^ newScript
]

{ #category : #building }
MUDScriptBrowser >> addScriptsMenuOn: aPresenter [
	aPresenter 
		act: [ :presenter | 
				self addScriptThen: [ :script | 
					presenter update.
					presenter selection: script ] ] 
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
					then: [ :script |
						presenter update.
						presenter selection: script ] ] 
			entitled: 'Remove'
]

{ #category : #accessing }
MUDScriptBrowser >> bindingsForExecutionOf: aScript [
	^ (aScript newEvaluatorOn: self terminal) bindingsForExecution
]

{ #category : #building }
MUDScriptBrowser >> buildOn: browser [
	
	browser
		row: [ :row |
			row 
				column: #scripts;
				column: #script span: 3 ]
			span: 3;
		row: #monitor.
		
	browser transmit 
		to: #scripts;
		andShow: [ :a | 
			a fastList
				title: 'Scripts';
				in: [ :this | self addScriptsMenuOn: this ];
				display: [ self scripts ];
				format: #name;
				strongSelectionAct: [ :presentation | self runScript: presentation selection ] ].

	browser transmit 
		from: #scripts;
		to: #script;
		andShow: [ :a | 
			a pharoScript
				title: #name;
				display: #contents;
				defaultSelectionActions;
				in: [ :this | self addScriptMenuOn: this ];
				variableBindings: [ :script | self bindingsForExecutionOf: script ];
				onChangeOfPort: #text act: [ :presentation :script | 
					 script contents: presentation text asString ] ].
			
		browser transmit 
			to: #monitor;
			andShow: [ :a |
				a fastTable
					title: 'Running scripts';
					display: [ self activeScripts ];
					in: [ :this | self addMonitorMenuOn: this ];
					column: 'Status' evaluated: [ :evaluator | self scriptStatus: evaluator ];
					column: 'Name' evaluated: #scriptName;
					updateOn: MUDScriptAnnouncement from: MUDScriptEvaluator announcer ]
]

{ #category : #building }
MUDScriptBrowser >> executionSelectionActions [
	^ { 
		(GLMGenericAction new) 
				title: 'Do it';
				action: [ :aPresentation :script |
					script
					 	execute: [ aPresentation highlightEvaluateAndDo: [ :result | ] ]
						on: self terminal ]; 
				keymap: PharoShortcuts current doItShortcut; 
				icon: #glamorousSpawn asIcon;
				yourself.
		(GLMGenericAction new) 
				title: 'Print it';
				action: [ :aPresentation :script |
					script 
						execute: [ aPresentation printSelection  ]
						on: self terminal ]; 
				keymap: PharoShortcuts current printItShortcut; 
				yourself.
		(GLMGenericAction new) 
				title: 'Inspect it'; 
				action: [ :aPresentation :script |
					script 
						execute: [ aPresentation highlightEvaluateAndDo: [ :result | result inspect ] ]
						on: self terminal ]; 
				keymap: PharoShortcuts current inspectItShortcut; 
				icon: GLMUIThemeExtraIcons glamorousInspect;
				yourself.
		(GLMGenericAction new) 
				title: 'Basic Inspect it'; 
				action: [ :aPresentation :script |
					script 
						execute: [ 
							aPresentation highlightEvaluateAndDo: [ :result | result basicInspect ] ]
						on: self terminal ]; 
				shortcut: $I; 
				icon: GLMUIThemeExtraIcons glamorousInspect;
				yourself.
		(GLMGenericAction new) 
				title: 'Debug it'; 
				action: [ :aPresentation :script |
					script 
						execute: [ aPresentation debugSelection ]
						on: self terminal ]; 
				shortcut: $D;
				yourself.
		(GLMGenericAction new) 
				title: 'Profile it'; 
				action: [ :aPresentation :script |
					script 
						execute: [ aPresentation profileSelection ]
						on: self terminal ]; 
				withSeparatorAfter;
				yourself.
		 }
]

{ #category : #actions }
MUDScriptBrowser >> killAllScripts [
	MUDScript reset.
]

{ #category : #actions }
MUDScriptBrowser >> removeScript: aScript then: aBlock [
	(UIManager default confirm: ('Are you sure you want to remove {1}' format: { aScript name }))
		ifFalse: [ ^ self ].
	self plugin removeScript: aScript.
	aBlock cull: aScript
]

{ #category : #actions }
MUDScriptBrowser >> renameScript: aScript then: aBlock [
	| newName | 
	
	newName := (UIManager default 
		request: 'New name'
		initialAnswer: aScript name).
	newName ifNil: [ ^ self ].
	newName := newName trimBoth.
	(newName isEmpty or: [ newName = aScript name ]) ifTrue: [ ^ self ].
	aScript name: newName.
	aBlock cull: aScript
]

{ #category : #actions }
MUDScriptBrowser >> runScript: aScript [
	^ aScript executeOn: self terminal
]

{ #category : #private }
MUDScriptBrowser >> scriptStatus: script [
	^ ''
]

{ #category : #accessing }
MUDScriptBrowser >> scripts [
	^ self plugin scripts sorted: [ :a :b | a name < b name ]
]

{ #category : #accessing }
MUDScriptBrowser >> terminal [
	"convenience method to understand what is an 'owner' here"
	^ self owner
]

{ #category : #accessing }
MUDScriptBrowser >> title [
	^ 'Scripts'
]
