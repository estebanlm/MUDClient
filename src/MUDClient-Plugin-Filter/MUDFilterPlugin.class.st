"
I'm a plugin to redirect parts of the terminal output to a  separated window.
Typically, this is to put out OOC, but it can be used also for other stuff.

We use regexp to define the filters, e.g.: 

^\(OOC\).* -> Will filter out all lines starting with (OOC)
"
Class {
	#name : #MUDFilterPlugin,
	#superclass : #MUDPlugin,
	#instVars : [
		'filters'
	],
	#category : 'MUDClient-Plugin-Filter-Model'
}

{ #category : #accessing }
MUDFilterPlugin >> activeFilters [ 
	^ self filters select: #isActive
]

{ #category : #accessing }
MUDFilterPlugin >> addFilter: aFilter [ 
	^ self filters add: aFilter
]

{ #category : #private }
MUDFilterPlugin >> allPatternMatchingForLine: aString [ 
	| cleanString matchingFilters |
	
	cleanString := MUDANSITextCleaner cleanText: aString.
	matchingFilters := Set new.
	"Collect all possible filters"
	self activeFilters do: [ :each |  
		(each patternMatching: cleanString) 
			ifNotNil: [ :pattern | matchingFilters add: pattern ] ].
	"If none satisfy, then I add a simple null filter (to ensure an output)"
	matchingFilters ifEmpty: [ 
		matchingFilters add: (MUDFilterPattern new filter: MUDNullFilter new) ].
	
	^ matchingFilters
]

{ #category : #private }
MUDFilterPlugin >> applyAlertFilter: aFilter to: aStream line: aLine in: aTerminal [ 
	"Filter is sending messages to desktop"
	
	aFilter isEchoDesktop ifTrue: [ self informFilter: aFilter line: aLine ].
	aFilter isEchoTerminal ifTrue: [
		aTerminal alert 
			alertTitle: aFilter name 
			contents: aLine lineWithoutLineEnding
			position: aFilter notifyPosition
			color: aFilter alertColor ].
	
	^ self applyNullFilterTo: aStream line: aLine in: aTerminal 
]

{ #category : #private }
MUDFilterPlugin >> applyNullFilterTo: aStream line: aLine in: aTerminal [ 
	aLine isEchoed ifTrue: [ ^ 0 ].
	aLine echoed.
	aStream << aLine line.
	^ 0
]

{ #category : #private }
MUDFilterPlugin >> applyRedirectFilter: aFilter pattern: aPattern to: aStream line: aLine in: aTerminal [ 
	| windows |
	
	"Filter is echoing. I need to send to screen anyway"
	aFilter isEcho 
		ifTrue: [ self applyNullFilterTo: aStream line: aLine in: aTerminal ].
	
	"Filter is sending messages to desktop"
	aFilter isEchoDesktop 
		ifTrue: [ self informFilter: aFilter line: aLine ].

	windows := aTerminal dependentWindowsOf: self.
	aFilter 
		send: aLine lineWithoutLineEnding
		toWindows: (windows select: [ :each | each filter = aFilter]).
	^ aPattern eatLines ifNil: [0]
]

{ #category : #private }
MUDFilterPlugin >> applyTriggerFilter: aFilter to: aStream line: aLine in: aTerminal [
	aTerminal 
		sendFilteringInput: aFilter output  
		excluding: self.
	^ self applyNullFilterTo: aStream line: aLine in: aTerminal
]

{ #category : #filtering }
MUDFilterPlugin >> filterOn: aTerminal output: aString [
	"This is the algorithm idea. 
	 for each line (filter applies by line) we strip its ANSI formatting (filter does not 
	 apply by format) then we check if filter pattern matchs and in that case we took it 
	 out, sending the filtered line to its channel"
	| result |

	result := String
		new: aString size
		streamContents: [ :stream | 
			self 
				filterTo: stream 
				output: aString
				in: aTerminal ].

	^ (result allSatisfy: #isSeparator)
		ifTrue: [ '' ]
		ifFalse: [ result ]
]

{ #category : #private }
MUDFilterPlugin >> filterTo: stream output: aString in: aTerminal [  
	| lines nextLinesToFilter eatingFilter |
	
	nextLinesToFilter := 0.
	lines := aString linesWithLineEnding.
	lines do: [ :each | | line | 
		line := MUDFilterLine for: each.
		nextLinesToFilter = 0
			ifTrue: [ 
				(self allPatternMatchingForLine: line lineWithoutLineEnding) do: [ :eachMatching |
					nextLinesToFilter := eachMatching filter
						applyFilterOn: self 
						pattern: eachMatching 
						to: stream 
						line: line 
						in: aTerminal.
					nextLinesToFilter > 0 ifTrue: [ eatingFilter := eachMatching filter ] ] ]
			ifFalse: [
				"Just decrease in case I actual eat something (enters do not count)"
				line lineWithoutLineEnding ifNotEmpty: [ 
					self 
						forwardLine: line lineWithoutLineEnding 
						forFilter: eatingFilter 
						in: aTerminal.
					nextLinesToFilter := nextLinesToFilter - 1 ] ] ]
]

{ #category : #accessing }
MUDFilterPlugin >> filters [
	^ filters
]

{ #category : #private }
MUDFilterPlugin >> forwardLine: line forFilter: aFilter in: aTerminal [
	(aTerminal dependentWindowsOf: self)
		select: [ :each | each filter = aFilter ] 
		thenDo: [ :each | each send: line ]	
]

{ #category : #testing }
MUDFilterPlugin >> hasFilters [
	^ self filters notEmpty
]

{ #category : #private }
MUDFilterPlugin >> informFilter: aFilter line: aLine [
	"show to desktop"
	MUDAlertDesktop current
		alertTitle: aFilter name
		message: aLine cleanLine
]

{ #category : #initialization }
MUDFilterPlugin >> initialize [ 
	super initialize.
	filters := OrderedCollection new
]

{ #category : #testing }
MUDFilterPlugin >> isActiveOn: aTerminal [
	"Filter plugin can just be active if there are filters AND the filter browser is open"
	^ self hasFilters 
		and: [ aTerminal hasDependentWindowOf: self ]
]

{ #category : #accessing }
MUDFilterPlugin >> moveFilterDown: aFilter [ 
	self filters moveDown: aFilter
]

{ #category : #accessing }
MUDFilterPlugin >> moveFilterUp: aFilter [ 
	self filters moveUp: aFilter
]

{ #category : #accessing }
MUDFilterPlugin >> removeFilter: aFilter [ 
	(MUDFilterBrowserSettings findByFilter: self) 
		ifNotNil: [ :setting | setting remove ].
	^ self filters remove: aFilter
]
