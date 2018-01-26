"
I'm a parser to resolve text decorated strings. 
This string come usually as part of a MSDP commands, and can have this kind of form: 

'&GB&gasic &GH&golographic &GC&gombat &GT&graining  &c:: &CC&Boruscant &CC&Bombat &CA&Bcademy'
"
Class {
	#name : #LOTJTextDecorationParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'decoration',
		'text',
		'decoratedText',
		'sequence',
		'document',
		'nonDecoratedText',
		'decorationWithoutText',
		'ampersand'
	],
	#classVars : [
		'Default'
	],
	#category : 'LOTJ-Base-TextDecoration'
}

{ #category : #accessing }
LOTJTextDecorationParser class >> ansiText: aString [
	^ (self  
			parse: aString 
			onError: [ ^ aString ])
		inject: ''
		into: [ :s :each | s, each toANSI ]
]

{ #category : #accessing }
LOTJTextDecorationParser class >> cleanText: aString [
	^ (self  
			parse: aString 
			onError: [ ^ aString ])
		inject: ''
		into: [ :s :each | s, each text ]
]

{ #category : #accessing }
LOTJTextDecorationParser class >> default [ 
	^ Default ifNil: [ Default := self new ]
			
]

{ #category : #accessing }
LOTJTextDecorationParser class >> parse: aString [
	^ self  
		parse: aString 
		onError: [ aString ]
]

{ #category : #accessing }
LOTJTextDecorationParser class >> parse: aString onError: aBlock [
	^ self default 
		parse: aString 
		onError: aBlock
]

{ #category : #primitives }
LOTJTextDecorationParser >> ampersand [
	^ '&&' asParser
]

{ #category : #grammar }
LOTJTextDecorationParser >> decoratedText [
	^ decoration, text ==> [ :nodes |
		LOTJTextDecorationNode 
			decoration: nodes first second
			text: nodes second ]
]

{ #category : #primitives }
LOTJTextDecorationParser >> decoration [ 
	^ $& asParser, #letter asParser
]

{ #category : #grammar }
LOTJTextDecorationParser >> decorationWithoutText [
	^ decoration  
		==> [ :nodes | LOTJTextDecorationNode decoration: nodes second text: '' ]
]

{ #category : #grammar }
LOTJTextDecorationParser >> document [ 
	^ sequence plus
]

{ #category : #grammar }
LOTJTextDecorationParser >> nonDecoratedText [
	^ (ampersand ==> [ :nodes | LOTJTextDecorationNode text: '&' ])
		/ (text ==> [ :nodes | LOTJTextDecorationNode text: nodes ])
]

{ #category : #grammar }
LOTJTextDecorationParser >> sequence [ 
	^ decoratedText 
		/ nonDecoratedText
		/ decorationWithoutText
]

{ #category : #accessing }
LOTJTextDecorationParser >> start [ 
	^ document end.
]

{ #category : #primitives }
LOTJTextDecorationParser >> text [
	^ $& asParser negate plus flatten
]
