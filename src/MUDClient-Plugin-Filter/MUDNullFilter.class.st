"
I'm a special type of filter to be used when there is no filter. 
I just respond to a double dispatch with the easiest answer possible: I echo to console what I just get.
Check for my users to have an example.
"
Class {
	#name : #MUDNullFilter,
	#superclass : #MUDFilter,
	#category : 'MUDClient-Plugin-Filter-Model'
}

{ #category : #private }
MUDNullFilter >> applyFilterOn: aPlugin pattern: aPattern to: aStream line: aLine in: aTerminal [
	^ aPlugin applyNullFilterTo: aStream line: aLine in: aTerminal
	
]
