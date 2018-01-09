Class {
	#name : #MUDTileFilterBrowser,
	#superclass : #MUDPluginBrowser,
	#instVars : [
		'areaMorphs',
		'dirties',
		'activeFilter',
		'alert'
	],
	#category : #'MUDClient-Plugin-Filter-View'
}

{ #category : #accessing }
MUDTileFilterBrowser class >> preferredExtent [ 
	^ 600@250
]

{ #category : #accessing }
MUDTileFilterBrowser class >> title [
	^ 'Filter'
]

{ #category : #private }
MUDTileFilterBrowser >> activeFilter [
 	^ activeFilter
]

{ #category : #actions }
MUDTileFilterBrowser >> addFilter [ 
	| filter |
	
	filter := (TkMagritteEditor object: MUDFilter new) go.
	filter ifNil: [ ^ self ].
	self plugin addFilter: filter. 
	self hardRefresh
]

{ #category : #private }
MUDTileFilterBrowser >> alert [
	^ alert ifNil: [ alert := MUDAlertTerminal new ] 
]

{ #category : #private }
MUDTileFilterBrowser >> areaAt: aFilter [
	^ areaMorphs at: aFilter 
]

{ #category : #private }
MUDTileFilterBrowser >> areaAt: aFilter ifAbsent: aBlock [ 
	^ areaMorphs 
		at: aFilter 
		ifAbsent: aBlock
]

{ #category : #private }
MUDTileFilterBrowser >> areaAt: aFilter ifAbsentPut: aBlock [ 
	^ areaMorphs 
		at: aFilter 
		ifAbsentPut: aBlock
]

{ #category : #building }
MUDTileFilterBrowser >> buildAreaMorph [
	^ (MUDTerminalTextModel new 
		"maxLines: self class maxLines;"
		newScrolledText)
		beWrapped;
		beReadOnly
]

{ #category : #building }
MUDTileFilterBrowser >> buildOn: browser [ 
	browser column: #filters.
	browser transmit 
		to: #filters;
		andShow: [ :a |
			"a enhancedTabbedArrangement."
			a stackedVerticallyArrangement.
			self filters do: [ :each |
				self areaAt: each ifAbsentPut: [ self buildAreaMorph ].
				a morph 
					title: [ self titleFor: each ];
					act: [ self editFilter: each ] 
						icon: #edit asMUDIcon 
						entitled: 'Edit filter'; 
					act: [ self clearArea: (self areaAt: each) ] 
						icon: #clear asMUDIcon 
						entitled: 'Clear'; 
					display: [ self areaAt: each ];
					initialize: [ :presenter | self dirtyAt: each put: false ]].
			"a updateOn: MUDFilterUpdated from: self announcer.
			a announcer when: MUDPresentationActivated send: #presentationActivated: to: self "]
]

{ #category : #building }
MUDTileFilterBrowser >> buildToolbarOn: aPresentation [
	aPresentation 
		act: [ self addFilter ] 
			icon: #add asMUDIcon 
			entitled: 'Add';
		act: [ self configure ]
			icon: #configure asMUDIcon
			entitled: 'Configure'.
]

{ #category : #actions }
MUDTileFilterBrowser >> clearArea: aRubricMorph [
	aRubricMorph model clear
	
]

{ #category : #actions }
MUDTileFilterBrowser >> configure [
	(MUDFilterConfigureDialog plugin: self plugin) generate.
	self hardRefresh
]

{ #category : #private }
MUDTileFilterBrowser >> dirtyAt: aFilter [ 
	^ dirties 
		at: aFilter 
		ifAbsentPut: [ false ]
]

{ #category : #private }
MUDTileFilterBrowser >> dirtyAt: aFilter put: anObject [
	^ dirties at: aFilter put: anObject
]

{ #category : #actions }
MUDTileFilterBrowser >> editFilter: aFilter [
	(TkMagritteEditor object: aFilter) go
]

{ #category : #accessing }
MUDTileFilterBrowser >> filters [
	^ self plugin activeFilters select: [ :each | each isAlert not ]
]

{ #category : #initialization }
MUDTileFilterBrowser >> initialize [
	super initialize.
	areaMorphs := Dictionary new.
	dirties := Dictionary new
]

{ #category : #private }
MUDTileFilterBrowser >> presentationActivated: ann [ 
 	activeFilter := (areaMorphs keyAtValue: ann presentation displayValue).
	(self dirtyAt: activeFilter) ifTrue: [
		self dirtyAt: activeFilter put: false.
		self announcer announce: MUDFilterUpdated new ]
]

{ #category : #accessing }
MUDTileFilterBrowser >> send: aString toFilter: aFilter [
	| filterMorph |
	
	aFilter playSound.
	
	aFilter isAlert ifTrue: [ 
		self alert 
			alertTitle: aFilter name 
			contents: aString 
			color: aFilter alertColor.
		^ self ].
	
	filterMorph := self areaAt: aFilter ifAbsent: [ nil ].
	filterMorph ifNil: [ ^ self ].
	filterMorph model appendParsedText: (aString, String lf).
	filterMorph adjustScrollbars.
	(self activeFilter ~= aFilter) ifTrue: [ 
		self dirtyAt: aFilter put: true.
		self announcer announce: MUDFilterUpdated new ]
]

{ #category : #private }
MUDTileFilterBrowser >> titleFor: aFilter [
	^ (self dirtyAt: aFilter)
		ifTrue: [ '*', aFilter name ]
		ifFalse: [ aFilter name ]
]

{ #category : #accessing }
MUDTileFilterBrowser >> toolbarPosition [
	^ super toolbarPosition "#left asToolbarPosition"
]
