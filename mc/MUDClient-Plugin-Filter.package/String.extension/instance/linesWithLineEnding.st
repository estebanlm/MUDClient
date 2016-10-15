*MUDClient-Plugin-Filter
linesWithLineEnding
 ^ Array new: (self size // 60 max: 16) streamContents: [ :lines | 
		self lineIndicesDo: [ :start :endWithoutDelimiters :end |
			lines nextPut: (self copyFrom: start to: end) ] ]	