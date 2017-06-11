accessing
addConnection: direction to: aRoom
	| dirConnections |

	dirConnections := self connections 
		at: direction
		ifAbsentPut: [ Set new ].
	(dirConnections includes: aRoom)
		ifFalse: [ dirConnections add: aRoom ]