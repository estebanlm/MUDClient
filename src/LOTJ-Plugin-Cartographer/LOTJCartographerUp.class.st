"
I indicate direction up.
"
Class {
	#name : #LOTJCartographerUp,
	#superclass : #LOTJCartographerDirection,
	#category : #'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerUp class >> directions [
	^ #('u' 'up')
]

{ #category : #accessing }
LOTJCartographerUp class >> label [
	^ 'Up'
]

{ #category : #accessing }
LOTJCartographerUp >> inverse [
	^ self class down
]
