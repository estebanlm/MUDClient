private
clearAreaInset
	#topRight == self notifyPosition ifTrue: [ ^ 5@ -8 ].
	#bottomRight == self notifyPosition ifTrue: [ ^ 0@ -8 ].
	^ -5@ -5