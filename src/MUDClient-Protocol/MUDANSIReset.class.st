"
I'm a particular case of color: I reset everything to default values.
"
Class {
	#name : #MUDANSIReset,
	#superclass : #MUDANSIEscape,
	#category : 'MUDClient-Protocol-ANSI'
}

{ #category : #visitor }
MUDANSIReset >> acceptCollector: aCollector [
	aCollector visitReset: self.
]
