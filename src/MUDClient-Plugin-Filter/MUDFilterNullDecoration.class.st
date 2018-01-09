"
I answer unmodified text.
"
Class {
	#name : #MUDFilterNullDecoration,
	#superclass : #MUDFilterDecoration,
	#category : #'MUDClient-Plugin-Filter-Model'
}

{ #category : #decorating }
MUDFilterNullDecoration >> decorate: aString [
	^ aString
]

{ #category : #accessing }
MUDFilterNullDecoration >> name [
	^ 'No decoration'
]
