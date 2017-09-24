"
I can parse ANSI formatted strings.
"
Class {
	#name : #MUDANSIParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'ps',
		'csi',
		'color',
		'reset',
		'document',
		'text',
		'escape',
		'sequence',
		'clear'
	],
	#classVars : [
		'Default'
	],
	#category : 'MUDClient-Protocol-ANSI'
}

{ #category : #accessing }
MUDANSIParser class >> default [
	^ Default ifNil: [ Default := self new ]
]

{ #category : #grammar }
MUDANSIParser >> clear [
	^ (csi, ps, 'J' asParser)
		==> [ :nodes | MUDANSIClear value: nodes second asNumber ]
]

{ #category : #grammar }
MUDANSIParser >> color [
	^ csi, (ps, ';' asParser) star, ps, 'm' asParser
		==> [ :nodes | | colors |
			colors := nodes second 
				ifNotEmpty: [ :v | v collect: [ :each | each first asNumber ] ]
				ifEmpty: [ #() ].
			colors :=  colors copyWith: nodes third asNumber.
			MUDANSIColor value: colors ]
]

{ #category : #primitives }
MUDANSIParser >> csi [
	^ (Character escape asString, '[') asParser
]

{ #category : #grammar }
MUDANSIParser >> document [ 
	^ sequence plus
]

{ #category : #grammar }
MUDANSIParser >> escape [ 
	^ reset / clear / color
]

{ #category : #primitives }
MUDANSIParser >> ps [ 
	^ #digit asParser plus flatten
]

{ #category : #grammar }
MUDANSIParser >> reset [
	^ (csi, '0m' asParser)
		==> [ :nodes | MUDANSIReset new ]
]

{ #category : #grammar }
MUDANSIParser >> sequence [ 
	^ escape / text
]

{ #category : #accessing }
MUDANSIParser >> start [
	^ document end
]

{ #category : #grammar }
MUDANSIParser >> text [ 
	^ (PPPredicateObjectParser anyExceptAnyOf: Character escape asString) plus flatten
		==> [ :nodes | 
			MUDANSIText new 
				text: nodes;
				yourself ]
]
