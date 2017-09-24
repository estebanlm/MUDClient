Class {
	#name : #MUDAlertFilter,
	#superclass : #MUDFilter,
	#instVars : [
		'alertColor',
		'notifyPosition',
		'echoTerminal',
		'echoDesktop'
	],
	#category : 'MUDClient-Plugin-Filter-Model'
}

{ #category : #accessing }
MUDAlertFilter class >> label [
	^ 'Alerts'
]

{ #category : #accessing }
MUDAlertFilter >> alertColor [
	^ alertColor
]

{ #category : #accessing }
MUDAlertFilter >> alertColor: anObject [
	alertColor := anObject
]

{ #category : #private }
MUDAlertFilter >> applyFilterOn: aPlugin pattern: aPattern to: aStream line: aLine [ in: aTerminal  
	^ aPlugin applyAlertFilter: self to: aStream line: aLine in: aTerminal
	
]

{ #category : #descriptions }
MUDAlertFilter >> descriptionAlertColor [
	<magritteDescription>

	^ MAColorDescription new 
		priority: 100;
		label: 'Alert Color';
		accessor: #alertColor;
		morphClass: MUDColorMorph; 
		yourself
]

{ #category : #descriptions }
MUDAlertFilter >> descriptionEchoDesktop [
	<magritteDescription>
	
	^ MABooleanDescription new 
		priority: 125;
		label: 'Echo Desktop';
		accessor: (MAPluggableAccessor 
			read: [ :filter | filter isEchoDesktop ]
			write: [ :filter :value | filter echoDesktop: value ]);
		yourself
]

{ #category : #descriptions }
MUDAlertFilter >> descriptionEchoTerminal [
	<magritteDescription>
	
	^ MABooleanDescription new 
		priority: 120;
		label: 'Echo Terminal';
		accessor: (MAPluggableAccessor 
			read: [ :filter | filter isEchoTerminal ]
			write: [ :filter :value | filter echoTerminal: value ]);
		yourself
]

{ #category : #descriptions }
MUDAlertFilter >> descriptionNotifyPosition [
	<magritteDescription>
	| positions |
	
	positions := MUDGrowlMorph positionsAndLabels keys.
	^ MASingleOptionDescription new 
		priority: 110;
		label: 'Alert Position';
		accessor: #notifyPosition;
		options: positions;
		morphClass: MADropListMorph;
		yourself
]

{ #category : #accessing }
MUDAlertFilter >> echoDesktop: anObject [
	echoDesktop := anObject
]

{ #category : #accessing }
MUDAlertFilter >> echoTerminal: anObject [
	echoTerminal := anObject
]

{ #category : #testing }
MUDAlertFilter >> isAlert [
	^ true
]

{ #category : #testing }
MUDAlertFilter >> isEchoDesktop [
	^ echoDesktop ifNil: [ echoDesktop := false ]
]

{ #category : #testing }
MUDAlertFilter >> isEchoTerminal [
	^ echoTerminal ifNil: [ echoTerminal := true ]
]

{ #category : #accessing }
MUDAlertFilter >> notifyPosition [
	^ notifyPosition
]

{ #category : #accessing }
MUDAlertFilter >> notifyPosition: anObject [
	notifyPosition := anObject
]
