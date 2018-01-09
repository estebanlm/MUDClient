Class {
	#name : #MUDAlertFilterSpec,
	#superclass : #MUDFilterSpec,
	#category : #'MUDClient-Plugin-Filter-Model'
}

{ #category : #accessing }
MUDAlertFilterSpec >> filterClass [
	^ MUDAlertFilter
]

{ #category : #accessing }
MUDAlertFilterSpec >> icon [ 
	^ #filterAlert asMUDIcon
]

{ #category : #accessing }
MUDAlertFilterSpec >> pluginClass [
	^ MUDFilterPlugin
]
