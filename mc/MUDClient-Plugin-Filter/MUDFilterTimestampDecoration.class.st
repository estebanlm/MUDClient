"
I add a timestamp (DMYHM) to the filtered line.
"
Class {
	#name : #MUDFilterTimestampDecoration,
	#superclass : #MUDFilterDecoration,
	#category : 'MUDClient-Plugin-Filter-Model'
}

{ #category : #decorating }
MUDFilterTimestampDecoration >> decorate: aString [
	| stream |
	stream := VTermOutputDriver on: String new writeStream.
	stream 
		light; 
		white; 
		nextPutAll: DateAndTime now asStringYMDHM;
		reset;
		space;
		nextPutAll: aString.
	^ stream outStream contents
]

{ #category : #accessing }
MUDFilterTimestampDecoration >> name [
	^ 'Timestamp'
]
