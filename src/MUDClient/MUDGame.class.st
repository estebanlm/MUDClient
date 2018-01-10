"
I represent a game the client can be connected.
"
Class {
	#name : #MUDGame,
	#superclass : #Object,
	#instVars : [
		'name',
		'host',
		'port',
		'plugins',
		'loginSequence'
	],
	#category : #'MUDClient-Model'
}

{ #category : #accessing }
MUDGame class >> findAll [ 
	^ self selectAll
]

{ #category : #accessing }
MUDGame class >> findByName: aString [
	^ self selectOne: [ :each | each name = aString ]
]

{ #category : #'instance creation' }
MUDGame class >> importFrom: stream [
	^ STON fromStream: stream
]

{ #category : #'instance creation' }
MUDGame class >> importFromFileNamed: aString [
	^ aString asFileReference 
		readStreamDo: [ :stream | self importFrom: stream ] 
]

{ #category : #testing }
MUDGame class >> isVoyageRoot [ 
	^ true
]

{ #category : #'instance creation' }
MUDGame class >> name: aString host: urlString port: portNumber [ 
	^ self basicNew 
		initializeName: aString 
			host: urlString 
			port: portNumber;
		yourself
]

{ #category : #persistence }
MUDGame class >> voyageCollectionName [
	^ 'games'
]

{ #category : #persistence }
MUDGame class >> voyagePlugins [
	<voyageDescription>
	
	^ VOToOneDescription new 
		attributeName: 'plugins';
		accessor: (MAPluggableAccessor 
			read: [ :game | game plugins ]
			write: [ :game :plugins | game setPlugins: plugins ]);
		yourself
]

{ #category : #accessing }
MUDGame >> addPlugin: aPlugin [
	aPlugin game: self.
	plugins := plugins copyWith: aPlugin.
	^ aPlugin
]

{ #category : #actions }
MUDGame >> cloneAs: aString [
	| exported clonedGame |
	
	"easiest way is to export/import game"
	exported := String streamContents: [ :stream | STON put: self onStream: stream ].
	clonedGame := STON fromStream: exported readStream.
	clonedGame name: aString.
	^ clonedGame
]

{ #category : #actions }
MUDGame >> connect [ 
	^ TelnetSession new
		handler: (TelnetStreamThreadedHandler new 
			addDecoration: TelnetEnsureANSIDecoration new;
			yourself);
	 	in: [ :session | self protocolHandlers do: [ :each | session addProtocolHandler: each ] ];
		connectTo: self host port: self port
]

{ #category : #descriptions }
MUDGame >> descriptionHost [
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 20;
		label: 'Host';
		accessor: #host;
		beRequired;
		yourself
]

{ #category : #descriptions }
MUDGame >> descriptionLoginSequence [ 
	<magritteDescription>
	
	^ MAMemoDescription new 
		priority: 40;
		label: 'Login sequence';
		accessor: #loginSequence;
		lineCount: 5;
		yourself
]

{ #category : #descriptions }
MUDGame >> descriptionName [ 
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 10;
		label: 'Name';
		accessor: #name;
		beRequired;
		yourself
]

{ #category : #descriptions }
MUDGame >> descriptionPlugins [
	<magritteDescription>
	| currentSpecs |

	currentSpecs := self plugins 
		select: [ :each | each spec needsExplicitActivation ]
		thenCollect: #spec.
	^ MAMultipleOptionDescription new 
		priority: 35;
		label: 'Activate plugins';
		options: MUDPluginSpec allExplicitActivationSpecs;
		reference: (MAStringDescription new accessor: #name; asContainer);
		morphClass: TkMultiSelectFastListMorph;
		accessor: (MAPluggableAccessor 
			read: [ :this | currentSpecs ]
			write: [ :this :value | 
				"remove"
				(currentSpecs \ value) do: [ :each | self removePlugin: (each pluginAt: this) ].
				"now add"
				(value \ currentSpecs) do: [ :each | each pluginAt: this] ]);
		tkRowsToShow: 4;
		"tkHideAdd;"
		tkRemoveIcon: #delete asMUDIcon;
		tkRemoveHelpText: 'Remove {1}' localised;
		tkPickIcon: #find asMUDIcon;
		tkPickAcceptIcon: #ok asMUDIcon;
		tkPickCancelIcon: #cancel asMUDIcon;
		tkListingDescription: #name;
		yourself
]

{ #category : #descriptions }
MUDGame >> descriptionPort [
	<magritteDescription>
	
	^ MANumberDescription new 
		priority: 30;
		label: 'Port';
		accessor: #port;
		beRequired;
		yourself
]

{ #category : #actions }
MUDGame >> export [
	((FileLocator imageDirectory / self name) withExtension: 'ston') 
		writeStreamDo: [ :stream | STON put: self onStreamPretty: stream ]
		
]

{ #category : #testing }
MUDGame >> hasLoginSequence [
	^ self loginSequence isEmptyOrNil not
]

{ #category : #accessing }
MUDGame >> host [
	^ host
]

{ #category : #private }
MUDGame >> host: aString [ 
	host := aString
]

{ #category : #initialization }
MUDGame >> initialize [
	super initialize.
	plugins := #()
]

{ #category : #initialization }
MUDGame >> initializeName: aString host: hostString port: portNumber [
	self initialize.
	self name: aString.
	self host: hostString.
	self port: portNumber
]

{ #category : #accessing }
MUDGame >> loginSequence [
	^ loginSequence
]

{ #category : #accessing }
MUDGame >> loginSequence: anObject [
	loginSequence := anObject
]

{ #category : #accessing }
MUDGame >> name [ 
	^ name
]

{ #category : #private }
MUDGame >> name: aString [ 
	name := aString
]

{ #category : #accessing }
MUDGame >> pluginByClass: aClass ifAbsent: aBlock [
	^ self plugins
		detect: [ :each | each isKindOf: aClass ]
		ifNone: aBlock
]

{ #category : #accessing }
MUDGame >> pluginByClass: aClass ifAbsentPut: aBlock [
	^ self plugins
		detect: [ :each | each isKindOf: aClass ]
		ifNone: [ self addPlugin: aBlock value ]
]

{ #category : #accessing }
MUDGame >> plugins [
	^ plugins
]

{ #category : #accessing }
MUDGame >> port [
	^ port
]

{ #category : #private }
MUDGame >> port: aNumber [ 
	port := aNumber
]

{ #category : #printing }
MUDGame >> printOn: stream [
	stream << self name
]

{ #category : #accessing }
MUDGame >> protocolHandlerClasses [
	self flag: #todo. "A better algorithm to detect protocols"
	^ { MUDTelnetMSDPHandler }
]

{ #category : #accessing }
MUDGame >> protocolHandlers [
	^ self protocolHandlerClasses collect: #new
]

{ #category : #accessing }
MUDGame >> removePlugin: aPlugin [
	plugins := plugins copyWithout: aPlugin
]

{ #category : #private }
MUDGame >> setPlugins: aCollection [ 
	aCollection do: [ :each | each game: self ].
	plugins := aCollection
]
