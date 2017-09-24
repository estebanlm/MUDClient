Class {
	#name : #MUDAliasCommandTest,
	#superclass : #TestCase,
	#category : 'MUDClient-Plugin-Alias-Parser'
}

{ #category : #tests }
MUDAliasCommandTest >> assert: command matches: aString [ 
	self assert: (command matches: (self parseCommandLine: aString))
]

{ #category : #tests }
MUDAliasCommandTest >> deny: command matches: aString [ 
	self deny: (command matches: (self parseCommandLine: aString))
]

{ #category : #private }
MUDAliasCommandTest >> parseCommandLine: aString [
	^ (MUDAliasCommandLineParser 
		parse: aString
		onError: [ :e | MUDAliasCommandLine keywords: { aString } ])
		rawLine: aString;
		yourself.
]

{ #category : #tests }
MUDAliasCommandTest >> testMatches [
	| command |

	command := MUDAliasCommand fromString: 'rep'.
	self assert: command matches: 'rep'.
	self deny: command matches: 'rep other'.

	command := MUDAliasCommand fromString: 'rep some'.
	self assert: command matches: 'rep some'.
	self deny: command matches: 'rep other added'.
	self deny: command matches: 'rep other'.
	
	command := MUDAliasCommand fromString: 'rep $arg1'.
	self assert: command matches: 'rep some'.
	self assert: command matches: 'rep other'.
	self deny: command matches: 'rep other with some'.

	command := MUDAliasCommand fromString: 'rep $arg1 with $arg2'.
	self assert: command matches: 'rep some with other'.
	self assert: command matches: 'rep other with another'.
	self deny: command matches: 'rep some'.
	self deny: command matches: 'rep other'
]
