"
I'm a spec for adding plugins to the toolbar.
"
Class {
	#name : #MUDPluginToolbarSpec,
	#superclass : #Object,
	#instVars : [
		'action',
		'icon',
		'title'
	],
	#category : #'MUDClient-Model-Plugin'
}

{ #category : #'as yet unclassified' }
MUDPluginToolbarSpec class >> act: aBlock icon: anIcon entitled: aString [
	^ self new 
		action: aBlock;
		icon: anIcon;
		title: aString;
		yourself

]

{ #category : #accessing }
MUDPluginToolbarSpec >> action [
	^ action
]

{ #category : #accessing }
MUDPluginToolbarSpec >> action: anObject [
	action := anObject
]

{ #category : #accessing }
MUDPluginToolbarSpec >> icon [
	^ icon
]

{ #category : #accessing }
MUDPluginToolbarSpec >> icon: anObject [
	icon := anObject
]

{ #category : #accessing }
MUDPluginToolbarSpec >> title [
	^ title
]

{ #category : #accessing }
MUDPluginToolbarSpec >> title: anObject [
	title := anObject
]
