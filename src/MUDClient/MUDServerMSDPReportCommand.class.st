Class {
	#name : #MUDServerMSDPReportCommand,
	#superclass : #MUDServerMSDPCommand,
	#instVars : [
		'variables'
	],
	#category : 'MUDClient-Model-ServerCommand'
}

{ #category : #private }
MUDServerMSDPReportCommand >> buildCommand [
	^ MUDMSDPCommandBuilder new 
		subcommand: [ :command | 
			command var: 'REPORT'.  
			self variables do: [ :each | command put: each ] ];
		contents
]

{ #category : #accessing }
MUDServerMSDPReportCommand >> variables [
	^ variables
]

{ #category : #accessing }
MUDServerMSDPReportCommand >> variables: anObject [
	variables := anObject
]
