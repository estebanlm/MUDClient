Class {
	#name : #MUDCommandHistoryTest,
	#superclass : #TestCase,
	#instVars : [
		'history'
	],
	#category : 'MUDClient-Tests'
}

{ #category : #running }
MUDCommandHistoryTest >> setUp [ 
	super setUp.
	history := MUDCommandHistory new
]

{ #category : #tests }
MUDCommandHistoryTest >> testAdd [
	self assert: history current isNil.
	history add: 'test 1'.
	self assert: history current equals: 'test 1'.
	history add: 'test 2'.
	self assert: history current equals: 'test 2'.
	
]

{ #category : #tests }
MUDCommandHistoryTest >> testBackward [
	history add: 'test 1'.
	history add: 'test 2'.
	history add: 'test 3'.
	
	self assert: history current equals: 'test 3'.
	self assert: history backward equals: 'test 2'.
	self assert: history backward equals: 'test 1'.
	self assert: history backward equals: 'test 1'	
]

{ #category : #tests }
MUDCommandHistoryTest >> testForward [
	history add: 'test 1'.
	history add: 'test 2'.
	history add: 'test 3'.
	history first.
	
	self assert: history current equals: 'test 1'.
	self assert: history forward equals: 'test 2'.
	self assert: history forward equals: 'test 3'.
	self assert: history forward equals: 'test 3'

	
]

{ #category : #tests }
MUDCommandHistoryTest >> testMaxSize [ 
	history maxSize: 10.
	1 to: 100 do: [ :index | history add: 'Test ', (index asString) ].
	self assert: history elements first equals: 'Test 91'.
	self assert: history elements last equals: 'Test 100'.
	self assert: history elements size = 10
]
