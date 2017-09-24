Class {
	#name : #MUDAliasCommandLineParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'sentence',
		'whitespace',
		'argument',
		'command',
		'keyword',
		'string',
		'number'
	],
	#category : 'MUDClient-Plugin-Alias-Parser'
}

{ #category : #grammar }
MUDAliasCommandLineParser >> argument [
	^ ((number / 'all' asParser / 'in' asParser), whitespace plus) optional, 
		(string / #word asParser plus flatten)
		==> [ :nodes | 
			MUDAliasCommandLineArgument new 
				value: nodes second;
				quantity: (nodes first ifNotNil:[ :n | n first ]);
				yourself ]
]

{ #category : #grammar }
MUDAliasCommandLineParser >> command [
	^ sentence, (whitespace, sentence) star
		==> [ :nodes |
			MUDAliasCommandLine new 
				keywords: ( nodes second 
					ifNotNil: [ { nodes first }, (nodes second collect: #second) ]
					ifNil: [ { nodes first } ]);
				yourself ]
]

{ #category : #primitives }
MUDAliasCommandLineParser >> keyword [ 
	^ #word asParser plus flatten
]

{ #category : #primitives }
MUDAliasCommandLineParser >> number [
	^ #digit asParser plus flatten
]

{ #category : #grammar }
MUDAliasCommandLineParser >> sentence [
	^ keyword, (whitespace, argument) optional
		==> [ :nodes | 
			MUDAliasCommandLineKeyword new 
				value: nodes first;
				argument: (nodes second ifNotNil: [ :n | n second ]) ]
]

{ #category : #accessing }
MUDAliasCommandLineParser >> start [
	^ command end
]

{ #category : #primitives }
MUDAliasCommandLineParser >> string [ 
	^ ($" asParser, (PPPredicateObjectParser anyExceptAnyOf: '"') plus, $" asParser) flatten
	 | ($' asParser, (PPPredicateObjectParser anyExceptAnyOf: '''') plus, $' asParser) flatten
]

{ #category : #primitives }
MUDAliasCommandLineParser >> whitespace [ 
	^ #space asParser plus
]
