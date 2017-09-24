"
I add a time (HM) to the filtered line.
"
Class {
	#name : #MUDFilterTimeDecoration,
	#superclass : #MUDFilterDecoration,
	#category : 'MUDClient-Plugin-Filter-Model'
}

{ #category : #decorating }
MUDFilterTimeDecoration >> decorate: aString [
	| stream |
	stream := VTermOutputDriver on: String new writeStream.
	stream light; white.
	Time now print24: true showSeconds: false on: stream.
	stream reset.
	stream
		space;
		nextPutAll: aString.
	^ stream outStream contents
]

{ #category : #accessing }
MUDFilterTimeDecoration >> name [
	^ 'Time'
]
