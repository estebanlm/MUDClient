Class {
	#name : #MUDRedirectFilterSpec,
	#superclass : #MUDFilterSpec,
	#category : #'MUDClient-Plugin-Filter-Model'
}

{ #category : #accessing }
MUDRedirectFilterSpec >> filterClass [
	^ MUDRedirectFilter
]

{ #category : #accessing }
MUDRedirectFilterSpec >> icon [ 
	^ #filterRedirect asMUDIcon
]

{ #category : #accessing }
MUDRedirectFilterSpec >> pluginClass [
	^ MUDFilterPlugin
]
