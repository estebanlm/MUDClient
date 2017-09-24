Class {
	#name : #MUDAliasCommandLineDefinitionParserTest,
	#superclass : #PPCompositeParserTest,
	#category : 'MUDClient-Plugin-Alias-Parser'
}

{ #category : #accessing }
MUDAliasCommandLineDefinitionParserTest >> parserClass [ 
	^ MUDAliasCommandLineDefinitionParser
]

{ #category : #tests }
MUDAliasCommandLineDefinitionParserTest >> testCommand [
	self parse: 'command' rule: #command.
	self parse: 'command $arg1' rule: #command.
	self parse: 'command $arg1 to $arg2' rule: #command.
	self parse: 'command $arg1 to $arg2 and $arg3' rule: #command.
	
	self fail: 'command1 command2' rule: #command.		
	self fail: 'command $arg1 $arg2' rule: #command.
]

{ #category : #tests }
MUDAliasCommandLineDefinitionParserTest >> testKeyword [
	self parse: 'reparmpr' rule: #keyword.
	self fail: 'reparmpr $arg1' rule: #keyword.
]

{ #category : #tests }
MUDAliasCommandLineDefinitionParserTest >> testKeywordWithArgument [
	self parse: 'reparmpr $arg1' rule: #keywordWithArgument.	
	self fail: 'reparmpr' rule: #keywordWithArgument.
	self fail: 'reparmpr arg1' rule: #keywordWithArgument
]
