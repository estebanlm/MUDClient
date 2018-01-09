Class {
	#name : #MUDTriggerFilterSpec,
	#superclass : #MUDFilterSpec,
	#category : #'MUDClient-Plugin-Filter-Model'
}

{ #category : #accessing }
MUDTriggerFilterSpec >> filterClass [
	^ MUDTriggerFilter
]

{ #category : #accessing }
MUDTriggerFilterSpec >> icon [ 
	^ #filterTrigger asMUDIcon
]

{ #category : #accessing }
MUDTriggerFilterSpec >> pluginClass [
	^ MUDFilterPlugin
]
