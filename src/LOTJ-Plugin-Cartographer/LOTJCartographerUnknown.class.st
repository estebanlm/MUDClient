"
I'm an ""unknown"" direction.
"
Class {
	#name : #LOTJCartographerUnknown,
	#superclass : #LOTJCartographerDirection,
	#instVars : [
		'name'
	],
	#category : #'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerUnknown class >> directions [
	^ #()
]

{ #category : #accessing }
LOTJCartographerUnknown class >> label [
	^ 'Unknown'
]

{ #category : #'instance creation' }
LOTJCartographerUnknown class >> named: aString [
	^ self basicNew 
		initializeName: aString;
		yourself
]

{ #category : #initialization }
LOTJCartographerUnknown >> initializeName: aString [
	self initialize.
	name := aString
]

{ #category : #accessing }
LOTJCartographerUnknown >> inverse [
	^ self class unknown
]

{ #category : #testing }
LOTJCartographerUnknown >> isUnknown [
	^ true
]

{ #category : #accessing }
LOTJCartographerUnknown >> label [ 
	^ self name
]

{ #category : #accessing }
LOTJCartographerUnknown >> name [
	^ name
]
