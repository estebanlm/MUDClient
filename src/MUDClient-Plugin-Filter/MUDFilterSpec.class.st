Class {
	#name : #MUDFilterSpec,
	#superclass : #MUDPluginSpec,
	#category : 'MUDClient-Plugin-Filter-Model'
}

{ #category : #'as yet unclassified' }
MUDFilterSpec class >> isAbstract [ 
	^ super isAbstract or: [ self = MUDFilterSpec ]
]

{ #category : #private }
MUDFilterSpec >> configureFiltersFor: aGame in: aTerminal [
	| plugin |
	plugin := self pluginAt: aGame.
	(MUDFilterConfigureDialog plugin: plugin)
		filterClass: self filterClass;
		onLaunch: [ :filter | self openBrowserFor: aGame plugin: plugin filter: filter in: aTerminal ];
		go
]

{ #category : #accessing }
MUDFilterSpec >> filterClass [
	^ nil
]

{ #category : #accessing }
MUDFilterSpec >> icon [ 
	^ nil
]

{ #category : #accessing }
MUDFilterSpec >> name [ 
	^ self filterClass ifNotNil: [ :c | c label ]
]

{ #category : #private }
MUDFilterSpec >> openBrowserFor: aGame plugin: aPlugin filter: aFilter in: aTerminal [
	self flag: #todo. "HACK because doubleClick action is being executed several times"
	(MUDFilterBrowser allSubInstances anySatisfy: [ :each | each filter == aFilter ])
		ifTrue: [ ^ self ].
		
	(MUDFilterBrowser game: aGame plugin: aPlugin filter: aFilter)
		openOn: aTerminal
]

{ #category : #accessing }
MUDFilterSpec >> pluginClass [
	^ MUDFilterPlugin
]

{ #category : #accessing }
MUDFilterSpec >> toolbarSpec [ 
	^ MUDPluginToolbarSpec 
		act: [ :aTerminal :aGame | self configureFiltersFor: aGame in: aTerminal ]
		icon: self icon
		entitled: self name
]
