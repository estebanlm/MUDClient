private
removeFirstLines
	| count linesToRemove size |

	size := 0.
	count := 0.
	linesToRemove := (self maxLines / 3) asInteger. "1/3"  
	self text string linesDo: [ :line |
		count := count + 1.
		size := size + line size.
		count = linesToRemove ifTrue: [ 
			^ self text 
				replaceFrom: 1 
				to: size 
				with: '' asText ] ]