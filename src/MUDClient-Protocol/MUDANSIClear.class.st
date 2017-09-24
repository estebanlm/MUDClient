"
I'm a ""clear"" escape. I clear the screen (or other stuff... but I just have implemented clear screen). 
"
Class {
	#name : #MUDANSIClear,
	#superclass : #MUDANSIEscape,
	#category : 'MUDClient-Protocol-ANSI'
}

{ #category : #visitor }
MUDANSIClear >> acceptCollector: aCollector [
	aCollector visitClear: self.
]
