"
I'm a browser to show the logs.
"
Class {
	#name : #MUDLogViewerBrowser,
	#superclass : #MUDPluginBrowser,
	#category : 'MUDClient-Plugin-LogViewer-View'
}

{ #category : #accessing }
MUDLogViewerBrowser class >> title [
	^ 'Log Viewer'
]

{ #category : #building }
MUDLogViewerBrowser >> buildAreaMorphFor: aNote [
	^ (MUDTerminalTextModel new 
		maxLines: SmallInteger maxVal;
		text: (aNote contents ifNil: [ '' ]);
		newScrolledText)
		textColor: Smalltalk ui theme textColor;
		backgroundColor: Smalltalk ui theme backgroundColor;
		beReadOnly;
		yourself

]

{ #category : #building }
MUDLogViewerBrowser >> buildOn: browser [ 
	
	browser
		column: #logs;
		column: #log span: 3.
		
	browser transmit 
		to: #logs;
		andShow: [ :a | 
			a fastList
				title: 'Logs';
				display: [ self logs ];
				format: [ :log | self toLogName: log ] ].

	browser transmit 
		to: #log;
		from: #logs;
		andShow: [ :a | 
			a morph 
				title: [ :log | self toLogName: log ];
				morph: [ :presenter :log | self buildAreaMorphFor: log ] ]
]

{ #category : #accessing }
MUDLogViewerBrowser >> logs [
	^ self plugin logs sorted reversed
]

{ #category : #private }
MUDLogViewerBrowser >> toLogName: aReference [ 
	^ (aReference basename allButFirst: 4) copyUpTo: $.
]
