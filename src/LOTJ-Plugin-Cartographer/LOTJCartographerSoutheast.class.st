"
I indicate direction southeast.
"
Class {
	#name : #LOTJCartographerSoutheast,
	#superclass : #LOTJCartographerDirection,
	#category : #'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerSoutheast class >> directions [
	^ #('se' 'southeast')
]

{ #category : #accessing }
LOTJCartographerSoutheast class >> label [
	^ 'Southeast'
]

{ #category : #accessing }
LOTJCartographerSoutheast >> asciiConnector [
	^ $\
]

{ #category : #accessing }
LOTJCartographerSoutheast >> coordinateModifier [
	^ 1@1
]

{ #category : #accessing }
LOTJCartographerSoutheast >> inverse [
	^ self class northwest
]
