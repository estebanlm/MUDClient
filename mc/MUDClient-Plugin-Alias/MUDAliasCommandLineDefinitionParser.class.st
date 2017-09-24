Class {
	#name : #MUDAliasCommandLineDefinitionParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'keyword',
		'keywordWithArgument',
		'whitespace',
		'argument',
		'command',
		'basicCommand',
		'complexCommand',
		'keywordToken'
	],
	#category : 'MUDClient-Plugin-Alias-Parser'
}

{ #category : #primitives }
MUDAliasCommandLineDefinitionParser >> argument [
	^ ($$ asParser, #word asParser plus) flatten
]

{ #category : #grammar }
MUDAliasCommandLineDefinitionParser >> basicCommand [
	^ keyword ==> [ :nodes | { nodes } ]
]

{ #category : #grammar }
MUDAliasCommandLineDefinitionParser >> command [
	^ complexCommand / basicCommand
		==> [ :nodes | MUDAliasCommand keywords: nodes ]
]

{ #category : #grammar }
MUDAliasCommandLineDefinitionParser >> complexCommand [
	^ keywordWithArgument, (whitespace, keywordWithArgument) star
		==> [ :nodes | { nodes first }, (nodes second collect: #second) ]
]

{ #category : #grammar }
MUDAliasCommandLineDefinitionParser >> keyword [
	^ keywordToken
		==> [ :nodes | MUDAliasCommandKeyword value: nodes ]
]

{ #category : #primitives }
MUDAliasCommandLineDefinitionParser >> keywordToken [
	^ #word asParser plus flatten
]

{ #category : #grammar }
MUDAliasCommandLineDefinitionParser >> keywordWithArgument [
	^ keywordToken, whitespace, argument
		==> [ :nodes | 
			MUDAliasCommandKeyword
				value: nodes first
				argument: nodes third ]
]

{ #category : #accessing }
MUDAliasCommandLineDefinitionParser >> start [
	^ command end
]

{ #category : #primitives }
MUDAliasCommandLineDefinitionParser >> whitespace [ 
	^ #space asParser plus
]
