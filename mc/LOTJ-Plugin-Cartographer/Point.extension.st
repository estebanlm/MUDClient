Extension { #name : #Point }

{ #category : #'*LOTJ-Plugin-Cartographer' }
Point >> inversed [ 
	^ self y @ self x
]
