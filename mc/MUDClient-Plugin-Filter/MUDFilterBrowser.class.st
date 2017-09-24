Class {
	#name : #MUDFilterBrowser,
	#superclass : #MUDPluginBrowser,
	#instVars : [
		'filter',
		'areaMorph'
	],
	#category : 'MUDClient-Plugin-Filter-View'
}

{ #category : #'instance creation' }
MUDFilterBrowser class >> game: aGame plugin: aPlugin [
	self error: 'Use #game:plugin:filter:'
]

{ #category : #'instance creation' }
MUDFilterBrowser class >> game: aGame plugin: aPlugin filter: aFilter [
	^ self basicNew 
		initializeGame: aGame plugin: aPlugin filter: aFilter;
		yourself
]

{ #category : #private }
MUDFilterBrowser >> areaMorph [
	^ areaMorph ifNil: [ areaMorph := self createAreaMorph ]
]

{ #category : #building }
MUDFilterBrowser >> buildOn: browser [
	"browser title: [ self title ]. "
	browser column: #filters.
	browser transmit 
		to: #filters;
		andShow: [ :a |
			a morph display: [ self areaMorph ] ].
]

{ #category : #building }
MUDFilterBrowser >> buildToolbarOn: aPresentation [
	aPresentation 
		act: [ self edit ] 
			icon: #edit asMUDIcon 
			entitled: 'Edit filter'; 
		act: [ self clearAreaMorph ] 
			icon: #clear asMUDIcon 
			entitled: 'Clear'

]

{ #category : #actions }
MUDFilterBrowser >> clearAreaMorph [
	self areaMorph model clear
]

{ #category : #actions }
MUDFilterBrowser >> configure [
	(MUDFilterConfigureDialog plugin: self plugin) generate.
	self hardRefresh
]

{ #category : #private }
MUDFilterBrowser >> createAreaMorph [
	^ (MUDTerminalTextModel new 
		"maxLines: self class maxLines;"
		newScrolledText)
		beWrapped;
		beReadOnly
]

{ #category : #'private settings' }
MUDFilterBrowser >> createSettings [
	^ (MUDFilterBrowserSettings browserClass: self class game: self game)
		plugin: self plugin;
		filter: self filter;
		yourself
]

{ #category : #actions }
MUDFilterBrowser >> edit [
	(TkMagritteEditor object: self filter) go
]

{ #category : #accessing }
MUDFilterBrowser >> filter [ 
	^ filter
]

{ #category : #initialization }
MUDFilterBrowser >> initializeGame: aGame plugin: aPlugin filter: aFilter [
	filter := aFilter.
	self initializeGame: aGame plugin: aPlugin
	
]

{ #category : #testing }
MUDFilterBrowser >> isMiniWindow [
	^ true
]

{ #category : #'private settings' }
MUDFilterBrowser >> isSettingsMatching: aSetting [
	^ aSetting game = self game 
		and: [ aSetting browserClass = self class 
		and: [ aSetting filter = self filter ]]
]

{ #category : #accessing }
MUDFilterBrowser >> preferredExtent [
	^ (super preferredExtent x)@(MUDAlertFilter basicNew magritteDescription tkHeight)
]

{ #category : #accessing }
MUDFilterBrowser >> send: aString [
	self areaMorph model appendParsedText: (aString, String lf).
	self areaMorph adjustScrollbars.
	self announcer announce: MUDFilterUpdated new.
]

{ #category : #'private settings' }
MUDFilterBrowser >> settingsClass [
	^ MUDFilterBrowserSettings
]

{ #category : #accessing }
MUDFilterBrowser >> title [
	^ self filter name
]
