"
I'm a termina, the most simple yet indispensable element for being able to MUD. 
I display received data in a terminal and I have a command line input who sends commands to the server. 
"
Class {
	#name : #MUDTerminal,
	#superclass : #MUDBrowser,
	#instVars : [
		'session',
		'areaMorph',
		'inputMorph',
		'dependentWindows',
		'register',
		'alert',
		'serverCommandReceivers',
		'outputScheduler'
	],
	#pools : [
		'MUDTelnetConstants'
	],
	#category : #'MUDClient-View'
}

{ #category : #showing }
MUDTerminal class >> open [
	^ self new open
]

{ #category : #accessing }
MUDTerminal class >> preferredExtent [
	^ 800@700
]

{ #category : #accessing }
MUDTerminal class >> title [ 
	^ 'MUD Terminal'
]

{ #category : #private }
MUDTerminal >> activePlugins [
	^ self game plugins 
		select: [ :each | each isActiveOn: self ]
]

{ #category : #private }
MUDTerminal >> activeScriptTriggers [
	^ MUDScriptTrigger activeTriggers
]

{ #category : #accessing }
MUDTerminal >> addDependentWindow: aWindow [
	self dependentWindows add: aWindow
]

{ #category : #private }
MUDTerminal >> addServerCommandReceiver: aServerCommand [
	self flag: #todo. "I'm trying how it feels just keeping last command that needs update 
	in the stack. If this works, I need to refactor this."
	^ self serverCommandReceivers 
		removeAll; 
		add: aServerCommand
]

{ #category : #accessing }
MUDTerminal >> alert [ 
	^ alert ifNil: [ alert := MUDAlertTerminal for: self areaMorph ]
]

{ #category : #'accessing morph' }
MUDTerminal >> areaMorph [ 
	^ areaMorph ifNil: [ areaMorph := self buildAreaMorph ]
]

{ #category : #'private settings' }
MUDTerminal >> browserSettings [
	^ MUDTerminalBrowserSettings
		findMatchFor: self   
		ifNone: [ (MUDTerminalBrowserSettings browserClass: self class) save ]
]

{ #category : #building }
MUDTerminal >> buildAreaMorph [
	^ (MUDTerminalTextModel new 
		"maxLines: self class maxLines;"
		newScrolledText)
		beWrapped;
		beReadOnly
]

{ #category : #building }
MUDTerminal >> buildInputMorph [ 
	^ MUDCommandFieldMorph new
		when: RubReturnEntered send: #dataSend: to: self;
		yourself
]

{ #category : #building }
MUDTerminal >> buildOn: browser [
	browser row: #area.

	browser transmit 
		to: #area; 
		andShow: [ :a | 
			a morph morph: [ self buildPanelMorph ]].

]

{ #category : #building }
MUDTerminal >> buildPanelMorph [
	| panelMorph |
	 
	panelMorph := PanelMorph new
		layoutPolicy: ProportionalLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		borderWidth: 0;
		yourself.
	
	panelMorph 
		addMorph: self areaMorph 
		fullFrame: (LayoutFrame identity  
			leftOffset: 0;
			topOffset: 0;
			rightOffset: 0;
			bottomOffset: -24;
			yourself).
			
	panelMorph 
		addMorph: self inputMorph
		fullFrame: ((0@1 corner: 1@1) asLayoutFrame 
			topOffset: self inputMorph height negated).
			
	^ panelMorph
]

{ #category : #building }
MUDTerminal >> buildToolbarOn: aPresentation [
	aPresentation 
		act: [ self doConnect ] 
			icon: #connect asMUDIcon
			entitled: 'Connect';
		act: [ self doReconnect ] 
			icon: #reconnect asMUDIcon
			entitled: 'Reconnect to last game'
			when: [ self hasPreviousGame and: [ self isConnectedAndRunning not ] ];
		act: [ :presenter | self doDisconnect ] 
			icon: #disconnect asMUDIcon
			entitled: 'Disconnect'
			when: [ self isConnectedAndRunning ];		
		act: [ self doConfigure ]
			icon: #configure asMUDIcon
			entitled: 'Configure'.

	MUDPluginSpec allSpecs do: [ :each | 
		| toolbarSpec |
		toolbarSpec := each toolbarSpec.
		toolbarSpec ifNotNil: [ 
			aPresentation 
				act: [ toolbarSpec action cull: self cull: self game ]
				icon: toolbarSpec icon
				entitled: toolbarSpec title
				when: [ each isVisibleFor: self ] ] ].
	
	aPresentation dynamicActions: [ self developmentActions ].	
]

{ #category : #'private ui' }
MUDTerminal >> clearContents [
	areaMorph model setText: ''.
	inputMorph setText: ''
	
]

{ #category : #'private session' }
MUDTerminal >> closeSession [
	(self session isNil or: [ self session isConnected not ]) ifTrue: [ ^ self ].
	self session close
]

{ #category : #'private session' }
MUDTerminal >> commandReceived: ann [
	self serverCommandReceivers copy
		select: [ :each | 
			(each isProcessingProtocol: ann protocol) 
				and: [ each acceptsProcotolCommand: ann  ] ] 
		thenDo: [ :each | 
			[ each processCommand: ann ] schedule.
			^ self  ].

	self activePlugins
		select: [ :each | 
			(each isProcessingProtocol: ann protocol) 
				and: [ each acceptsProcotolCommand: ann  ] ] 
		thenDo: [ :each | [ each processOn: self command: ann ] schedule ]
]

{ #category : #private }
MUDTerminal >> connectTo: aGame [
	self reset.
	self game: aGame.
	[ 
		session := aGame connect.
		session 
			when: MUDCommandReceived send: #commandReceived: to: self;
			when: TelnetDataReceived send: #dataReceived: to: self;
			when: TelnetSessionClosed send: #sessionClosed: to: self.
		self prepareDisplayAfterConnect.
		self log info: [ 'Connected to: {1}:{2}' format: { aGame host. aGame port } ].
		self postConnect ]
	on: ConnectionTimedOut, NameLookupFailure, MUDError 
	do: [ :e | 
		self inform: e messageText.
		self connectTo: aGame "recursive call, probably not the best" ]
]

{ #category : #'private session' }
MUDTerminal >> dataReceived: ann [ 
	| rawData data |
	
	rawData := ann data asString.
	[  
		self hasGame ifTrue: [ 
			data := self filterOutput: rawData.
			data ifNotEmpty: [ 
				areaMorph model appendParsedText: data.	
				self isPinned ifFalse: [ areaMorph adjustScrollbars ] ] ]
	] executeOnUIThread.
	self registerSessionData: rawData
]

{ #category : #'private session' }
MUDTerminal >> dataSend: ann [
	| data |
	self isRunning ifFalse: [ ^ self ].
	
	data := self filterInput: inputMorph text asString.
	data 
		ifNotEmpty: [ data linesDo: [ :each | self session nextPutAll: each, String crlf ] ]
		ifEmpty: [ self session nextPutAll: String crlf ].

	"Echo"
	self isEchoOn ifFalse: [ ^ self ].
	areaMorph model appendText: data, String crlf.
	areaMorph adjustScrollbars.
	self registerSessionData: data, String crlf
]

{ #category : #accessing }
MUDTerminal >> dependentWindows [
	^ dependentWindows
]

{ #category : #accessing }
MUDTerminal >> dependentWindowsOf: aPlugin [
	^ self dependentWindows 
		select: [ :each | each plugin = aPlugin ]
]

{ #category : #building }
MUDTerminal >> developmentActions [
	^ { 
	self inspectGameAction.
	self developmentSnoopAction.
	 }
]

{ #category : #building }
MUDTerminal >> developmentSnoopAction [
	^ MUDAction new 
		action: [ self doDevelopmentSnoop ];
		title: 'Snoop this session';
		category: 'Development';
		enabledCondition: [ session notNil and: [ session isConnected ] ];
		yourself
]

{ #category : #private }
MUDTerminal >> disconnect [
	self closeSession
]

{ #category : #actions }
MUDTerminal >> doConfigure [
	self inform: 'TODO'
]

{ #category : #actions }
MUDTerminal >> doConnect [
	| newGame |
	newGame := MUDGameEditor new go.
	newGame ifNil: [ ^ self ].
	self connectTo: newGame
]

{ #category : #actions }
MUDTerminal >> doDevelopmentSnoop [
	MUDTelnetSessionSniffer new 
		attachTo: session;
		inspect
]

{ #category : #actions }
MUDTerminal >> doDisconnect [
	self disconnect
]

{ #category : #actions }
MUDTerminal >> doReconnect [
	self game ifNotNil: [ self disconnect ].
	self connectTo: self previousGame
]

{ #category : #private }
MUDTerminal >> filterInput: aString [ 
	| filtered |
	filtered := aString.
	self activePlugins 
		do: [ : each | filtered := each filterOn: self input: filtered ].
	^ filtered
]

{ #category : #private }
MUDTerminal >> filterOutput: aString [ 
	| filtered |
	filtered := aString.
	self activePlugins
		do: [ : each | filtered := each filterOn: self output: filtered ].
	^ filtered
]

{ #category : #accessing }
MUDTerminal >> game: aGame [
	super game: aGame.
	aGame ifNotNil: [ 
		self browserSettings lastActiveGame: aGame ].
	register := nil
]

{ #category : #testing }
MUDTerminal >> hasDependentWindowOf: aPlugin [ 
	^ (self dependentWindowsOf: aPlugin) notEmpty
]

{ #category : #testing }
MUDTerminal >> hasGame [
	^ self game notNil
]

{ #category : #testing }
MUDTerminal >> hasPreviousGame [
	^ self previousGame notNil
]

{ #category : #initialization }
MUDTerminal >> initialize [
	super initialize.
	dependentWindows := Set new.
	outputScheduler := TKTNewProcessTaskRunner new.
	self subscribeToAnnouncements
]

{ #category : #'accessing morph' }
MUDTerminal >> inputMorph [ 
	^ inputMorph ifNil: [ inputMorph := self buildInputMorph ]
]

{ #category : #building }
MUDTerminal >> inspectGameAction [
	^ MUDAction new 
		action: [ self game inspect ];
		title: 'Inspect active game';
		category: 'Development';
		enabledCondition: [ self hasGame ];
		yourself
]

{ #category : #testing }
MUDTerminal >> isConnected [ 
	^ self session notNil
]

{ #category : #testing }
MUDTerminal >> isConnectedAndRunning [
	^ self isConnected and: [ self isRunning ]
]

{ #category : #testing }
MUDTerminal >> isEchoOn [
	self flag: #todo. "This will come from configuration"
	^ false
]

{ #category : #testing }
MUDTerminal >> isPinned [
	self flag: #todo. "This will come from configuration"
	^ false
]

{ #category : #testing }
MUDTerminal >> isRunning [
	^ self session notNil and: [ self session isConnected ]
]

{ #category : #'private settings' }
MUDTerminal >> isSettingsMatching: aSetting [
	^ aSetting browserClass = self class
]

{ #category : #private }
MUDTerminal >> postConnect [
	"Execute actions after connect, if any"
	self game hasLoginSequence ifFalse: [ ^ self ].
	self send: self game loginSequence.
]

{ #category : #showing }
MUDTerminal >> postOpen [
	self window disable.
	self window announcer
		when: WindowActivated send: #transmitFocus to: self

]

{ #category : #'private ui' }
MUDTerminal >> prepareDisplayAfterConnect [
	self hardRefresh.
	self clearContents.
  	self window enable.
	self transmitFocus.
	self restorePlugins
]

{ #category : #accessing }
MUDTerminal >> previousGame [
	"The game that was active before (now could be another... or none)"
	^ self browserSettings lastActiveGame
]

{ #category : #'private events' }
MUDTerminal >> refreshKeyBindings [
	| category |
	category := (MUDKeyCategory named: 'MUDTerminal-KEYS')
		owner: self;
		yourself.
	self installKeyBindingsOn: category.
	self dependentWindows do: [ :each | each installKeyBindingsOn: category ].
	self replaceKeyBindings: 'MUDTerminal-KEYS' with: category
]

{ #category : #'private register' }
MUDTerminal >> register [
	^ register ifNil: [ register := MUDSessionLog game: self game ]	
]

{ #category : #'private register' }
MUDTerminal >> registerSessionData: aString [
	self register record: aString.
	
]

{ #category : #accessing }
MUDTerminal >> removeDependentWindow: aWindow [
	self dependentWindows remove: aWindow ifAbsent: []
]

{ #category : #private }
MUDTerminal >> removeServerCommandReceiver: aReceiver [
	^ serverCommandReceivers 
		remove: aReceiver
		ifAbsent: [  ]
]

{ #category : #accessing }
MUDTerminal >> replaceKeyBindings: categoryName with: category [
	| inputTextArea |

	inputTextArea := inputMorph textArea.
	[ inputTextArea detachKeymapCategory: categoryName ]
	on: Error do: [ :e | "Do nothing: It means there is no previous category" ].
	inputTextArea attachKeymapCategory: category
]

{ #category : #private }
MUDTerminal >> reset [
	serverCommandReceivers := nil
]

{ #category : #private }
MUDTerminal >> restorePlugins [
	(MUDBrowserSettings findByGame: self game)
		select: [ :each | each isRemembered  ] 
		thenDo: [ :each | each restoreOn: self ]
]

{ #category : #'accessing send' }
MUDTerminal >> send: aString [
	self isRunning ifFalse: [ ^ self ].
	outputScheduler schedule: [ 
		self isRunning ifTrue: [ 
			self session nextPutAll: aString, String crlf ] ]
]

{ #category : #'accessing send' }
MUDTerminal >> sendCommand: bytes [ 
	self isRunning ifFalse: [ ^ self ].
	outputScheduler schedule: [ 
		self isRunning ifTrue: [ 
			"ensure ESC is included"
			self session nextPutAll: (bytes first = ESC 
				ifTrue: [ bytes ]	
				ifFalse: [ bytes copyWithFirst: ESC ]) ] ]
]

{ #category : #'accessing send' }
MUDTerminal >> sendFilteringInput: aString [
	^ self sendFilteringInput: aString excluding: nil
]

{ #category : #'accessing send' }
MUDTerminal >> sendFilteringInput: aString excluding: aPlugin [
	"Apply any filters transformations (excluding aPlugin), so we can use, for example, 
	 aliases and variables"
	| output |
	output := aString.
	self activePlugins 
		reject: [ :each | each = aPlugin ]
		thenDo: [ :each | output := each filterOn: self input: output ]. 
	self send: output
]

{ #category : #private }
MUDTerminal >> serverCommandReceivers [
	"Command receivers are commands sent to the server that will wait for 
	 an answer (like doing a query to the server). 
	 See MUDMSDPAskValue as an example"
	^ serverCommandReceivers ifNil: [ serverCommandReceivers := OrderedCollection new ]
]

{ #category : #'private session' }
MUDTerminal >> session [ 
	^ session
]

{ #category : #'private session' }
MUDTerminal >> sessionClosed: ann [
	self log info: 'Connection closed.'.
	session := nil.
	
	self dependentWindows copy do: [ :each | 
		[ each closeBySessionTerminate ]
		on: Error do: [ :e | self log error: e messageText ] ].
	self game ifNotNil: [ self storeGameBeforeClose ]. "Keep previous game"
	self game: nil. "Reset game"
	self refresh.
	self window disable.
]

{ #category : #private }
MUDTerminal >> storeGameBeforeClose [
]

{ #category : #initialization }
MUDTerminal >> subscribeToAnnouncements [
	self when: MUDRefreshKeyBindingsAnnouncement send: #refreshKeyBindings to: self
]

{ #category : #accessing }
MUDTerminal >> title [ 
	^ self hasGame 
		ifTrue: [ 'Playing: ', self game name ]
		ifFalse: [ ^ super title ]
]

{ #category : #'private ui' }
MUDTerminal >> transmitFocus [
	self isConnected 
		ifTrue: [ inputMorph takeKeyboardFocus ]
]

{ #category : #'private ui' }
MUDTerminal >> windowClosed: ann [
	"A WindowClosed event has been received"
	super windowClosed: ann.
	self disconnect
]
