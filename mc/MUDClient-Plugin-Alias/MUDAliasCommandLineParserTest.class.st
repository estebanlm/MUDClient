Class {
	#name : #MUDAliasCommandLineParserTest,
	#superclass : #PPCompositeParserTest,
	#category : 'MUDClient-Plugin-Alias-Parser'
}

{ #category : #tests }
MUDAliasCommandLineParserTest >> assert: command [ command: aCollection
	| readStream |
	
	readStream := aCollection readStream.
	command keywords do: [ :each | 
		self assert: each value equals: readStream next.
		each argument 
			ifNotNil: [ | argument |
				argument := readStream next.
				self assert: each argument value equals: argument first.
				self assert: each argument quantity equals: argument second ]
			ifNil: [
				self assert: readStream next isNil ].
			
		]
]

{ #category : #accessing }
MUDAliasCommandLineParserTest >> parserClass [ 
	^ MUDAliasCommandLineParser
]

{ #category : #tests }
MUDAliasCommandLineParserTest >> testArgument [
	self parse: 'argument' rule: #argument.
	self parse: '"argument"' rule: #argument.
	self parse: '42 argument' rule: #argument.
	self parse: '42 "argument"' rule: #argument.
	self parse: 'all argument' rule: #argument.
	
]

{ #category : #tests }
MUDAliasCommandLineParserTest >> testCommand [
	| command |
	
	command := self parse: 'put argument to bag' rule: #command.
	self assert: command command: #('put' ('argument' nil) 'to' ('bag' nil)).
	
	command := self parse: 'put 42 argument to bag' rule: #command.
	self assert: command command: #('put' ('argument' '42') 'to' ('bag' nil)).
	
	command := self parse: 'locker open' rule: #command.
	self assert: command command: #('locker' ('open' nil)).
	
	command := self parse: 'look in bag' rule: #command.
	self assert: command command: #('look' ('bag' 'in')).

	command := self parse: 'command' rule: #command.
	self assert: command command: #('command' nil).
	
	command := self parse: 'command argument' rule: #command.
	self assert: command command: #('command' ('argument' nil)).
	
	command := self parse: 'command "argument ''with'' string"' rule: #command.
	self assert: command command: #('command' ('"argument ''with'' string"' nil)).
	
	command := self parse: 'command ''argument "with" string''' rule: #command.
	self assert: command command: #('command' ('''argument "with" string''' nil)).
	
	command := self parse: 'command arg1 to arg2' rule: #command.
	self assert: command command: #('command' ('arg1' nil) 'to' ('arg2' nil)).
	
	command := self parse: 'command arg1 to arg2 and "arg3 is a string"' rule: #command.
	self
		assert: command 
		command: #('command' ('arg1' nil) 'to' ('arg2' nil) 'and' ('"arg3 is a string"' nil)).
	
	command := self parse: 'command all arg1 to 2 arg2 and 3 "arg3 is a string"' rule: #command.
	self
		assert: command 
		command: #('command' ('arg1' 'all') 'to' ('arg2' '2') 'and' ('"arg3 is a string"' '3')).
		
	self fail: 'command arg1 "arg2"' rule: #command.
]

{ #category : #tests }
MUDAliasCommandLineParserTest >> testSentence [
	self parse: 'command' rule: #sentence.
	self parse: 'command argument' rule: #sentence.
	self parse: 'command 42 argument' rule: #sentence.

]
