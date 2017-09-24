"
I'm a tool to view the logs. 
"
Class {
	#name : #MUDLogViewerPlugin,
	#superclass : #MUDPlugin,
	#category : 'MUDClient-Plugin-LogViewer-Model'
}

{ #category : #accessing }
MUDLogViewerPlugin >> directory [
	^ (MUDSessionLog baseDirectory / self game name) ensureCreateDirectory	

]

{ #category : #accessing }
MUDLogViewerPlugin >> logs [ 
	^ self directory filesMatching: '*.txt'
]
